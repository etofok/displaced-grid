;-----------------------------------------
; ----- O V E R L A Y -----
;-----------------------------------------
;
; This module will diplay hotkey labels on top of the in-game window
; Hotkeys displayed are currently loaded hotkeys into .physicalkey
; The overlay automatically understands where to be displayed and adjusts itself on window change
;
;-----------------------------------------

Global isUpdating   := 0
Global hooks        := []

; the HotkeyOverlay is tied to the Displaced Grid layout. Layout On = HotkeyOverlay On.
b_HotkeyOverlay 										:= ActivateHotkeysOnLaunch

; this allows us to adjust the overlay automatically without manually refreshing it
; I spent like 15 hours figuring out this stuff, this is the best solution of them all

;-----------------------------------------
; On program start...

; overlay is switched off with the layout toggle in the main file

;--------------------------------
; HotkeyOverlay Control
;--------------------------------
Control_HotkeyOverlay(switchTo) {

	if (switchTo == 1) {
		if WinExist(winClass) {
            SetHooks()
			SetupHotkeyOverlay() ; main
		} else {
			;MsgBox, % error_warcraftNotFound
		}

	} else {
        ; Hide overlay when we turn it off
		Gui, gui_HotkeyOverlay:Hide
	}

	b_HotkeyOverlay := switchTo

	if (m_EventLog.active) {
		UpdateEventLog("Overlay - " . switchTo)	
	}
}

; ---------------------------------------------
; SetHooks
; ---------------------------------------------
SetHooks() {

    ; unhook hooks if were previously installed before proceeding
    if (hooks.MaxIndex() > 0) {
        UnhookAllEvents()
    }

    WINEVENT_OUTOFCONTEXT := 0x0000

    ; this is an event listener for window move and resize with mouse
    ; however, it does not account for window resize with Alt+Enter and maximize/restore
    ; EVENT_SYSTEM_MOVESIZEEND guarantees one update on move/size end motion
    EVENT_SYSTEM_MOVESIZEEND  := 0x000B
    hook_MOVESIZEEND := DllCall("SetWinEventHook"
        , "UInt", EVENT_SYSTEM_MOVESIZEEND 
        , "UInt", EVENT_SYSTEM_MOVESIZEEND 
        , "UInt", 0
        , "Ptr", RegisterCallback("ResizeCallback_MOVESIZEEND", "F")
        , "UInt", winPID
        , "UInt", 0
        , "UInt", WINEVENT_OUTOFCONTEXT)

    if (hook_MOVESIZEEND) {
        hooks.Push(hook_MOVESIZEEND)
    }

    ; this is an event listener for every window change, including Alt+Enter and maximize/restore
    ; It technically includes the EVENT_SYSTEM_MOVESIZEEND, but I decided to use both.
    ; because EVENT_OBJECT_LOCATIONCHANGE fires every nanosecond and break things.
    EVENT_OBJECT_LOCATIONCHANGE := 0x800B
    hook_LOCATIONCHANGE := DllCall("SetWinEventHook"
        , "UInt", EVENT_OBJECT_LOCATIONCHANGE 
        , "UInt", EVENT_OBJECT_LOCATIONCHANGE 
        , "UInt", 0
        , "Ptr", RegisterCallback("ResizeCallback_CHANGE", "F")
        , "UInt", winPID
        , "UInt", 0
        , "UInt", WINEVENT_OUTOFCONTEXT)

    if (hook_LOCATIONCHANGE) {
        hooks.Push(hook_LOCATIONCHANGE)
    }

    EVENT_OBJECT_DESTROY := 0x8001
    hook_DESTROY := DllCall("SetWinEventHook"
        , "UInt", EVENT_OBJECT_DESTROY
        , "UInt", EVENT_OBJECT_DESTROY
        , "Ptr", 0
        , "Ptr", RegisterCallback("WindowDestoyedCallback", "Fast")
        , "UInt", winPID
        , "UInt", 0
        , "UInt", WINEVENT_OUTOFCONTEXT)
    
    if (hook_DESTROY) {
        hooks.Push(hook_DESTROY)
    }

    ;MsgBox, % "Hooks installed: " hooks.MaxIndex()
}

; ---------------------------------------------
; UpdateClientArea
; ---------------------------------------------

UpdateClientArea() {
    if (!winID || winID == "") {

        if (m_EventLog.active) {
            UpdateEventLog("ERROR: No winID!")
        }

        return
    }

    clientArea := v1_WinGetClientPos(winID)
    ;MsgBox, % "clientArea.x: " clientArea.x "`nclientArea.y: " clientArea.y "`nclientArea.width: " clientArea.width "`nclientArea.height: " clientArea.height
}

; ---------------------------------------------
; UpdateOverlayCoordinates
; ---------------------------------------------

UpdateOverlayCoordinates() {
     ; Overlay Setup

    ; the smallest window possible: w800 h600
    ; As we scale up the client height — every UI element scales up with it.
    ;
    ; From a hero icon on user interface I figured the multiplier is x1.8 between h600 and h1080, and we can easily interpolate every other multiplier between these two values
    ; This way we can correctly set any X,Y coordinate for any screen resolution

    global multiplierIncreasePerPixel := 1.8 / 1080

    ; linear interpolation between 600px height and 1080px height given the known multiplier
    global heightScaleMultiplier := 1 + ( (clientArea.height - 600) * multiplierIncreasePerPixel ) 

    ; ---  --- Portrait UI element --- ---

    ; we know fullHd x700, y900
    ; we know heightScaleMultiplier
    ; from Paint, I figured the Portrait is located 270px to the left of the half of width at fullHD, so divided by 1.8 that's 150px to the left at minimum at 800px height
    PortraitUI.x := (clientArea.width / 2) - (150 * heightScaleMultiplier)

    ; y is constant
    PortraitUI.y := clientArea.height * 0.90



    ; Command card coordinates
    ; I figured the command card gets linearly pushed to the right as we increase the width of the client.

    ; Command card X starts at 220px to the right of the half the client width.
    ; then as the height grows we need to add a multiple to it
    GRID_00.x := clientArea.width / 2 + (220 * heightScaleMultiplier)
   

    ; Y coordinate is easier because height is static
    ; the value always stays constant to client height — 0.78
    GRID_00.y := clientArea.height * 0.78


    ; I figured a command card icon takes up 78px-79px at 1080px — ~7.22% of the client height
    ; This value doesn't change with height, so it's a constant that doesn't need to be reassigned
    ; but for readability I'm gonna leave it here hopefully your PC can afford this operation
    CommandCardButtonSize_WindowPercentage := 7.25 ; 7.25%, adjusted by eye

    ; big brain time
    ; because command card buttons are squares, the height gives us the width as well
    CommandCardButtonSize := clientArea.height * CommandCardButtonSize_WindowPercentage / 100

    GRID_10.x := GRID_00.x + CommandCardButtonSize
    GRID_10.y := GRID_00.y

    GRID_20.x := GRID_00.x + CommandCardButtonSize + CommandCardButtonSize
    GRID_20.y := GRID_00.y

    GRID_30.x := GRID_00.x + CommandCardButtonSize + CommandCardButtonSize + CommandCardButtonSize
    GRID_30.y := GRID_00.y

    ;MsgBox, % "GRID_00.x: " GRID_00.x "`nGRID_00.y: " GRID_00.y "`nGRID_10.x: " GRID_10.x "`nGRID_10.y: " GRID_10.y "`nGRID_20.x: " GRID_20.x "`nGRID_20.y: " GRID_20.y "`nGRID_30.x: " GRID_30.x "`nGRID_30.y: " GRID_30.y "`nCommandCardButtonSize: " CommandCardButtonSize

    ; GRID 2nd ROW
    GRID_01.x := GRID_00.x
    GRID_01.y := GRID_00.y + CommandCardButtonSize

    GRID_11.x := GRID_00.x + CommandCardButtonSize
    GRID_11.y := GRID_00.y + CommandCardButtonSize

    GRID_21.x := GRID_00.x + CommandCardButtonSize + CommandCardButtonSize
    GRID_21.y := GRID_00.y + CommandCardButtonSize

    GRID_31.x := GRID_00.x + CommandCardButtonSize + CommandCardButtonSize + CommandCardButtonSize
    GRID_31.y := GRID_00.y + CommandCardButtonSize

    ; GRID 3rd ROW
    GRID_02.x := GRID_00.x
    GRID_02.y := GRID_00.y + CommandCardButtonSize + CommandCardButtonSize

    GRID_12.x := GRID_00.x + CommandCardButtonSize
    GRID_12.y := GRID_00.y + CommandCardButtonSize + CommandCardButtonSize

    GRID_22.x := GRID_00.x + CommandCardButtonSize + CommandCardButtonSize
    GRID_22.y := GRID_00.y + CommandCardButtonSize + CommandCardButtonSize

    GRID_32.x := GRID_00.x + CommandCardButtonSize + CommandCardButtonSize + CommandCardButtonSize
    GRID_32.y := GRID_00.y + CommandCardButtonSize + CommandCardButtonSize



    ; ---  --- Items x,y on UI --- ---

    ; linear interpolation between height 600px and height 1080px to align hotkey overlay for item block for every resolution
    ; offset is for the labels
    Coordinates_Items_offset_x := Floor(-12 + ( ((clientArea.height - 600) / -37) ))  ; -12 @600px -> -25 @1080px
    Coordinates_Items_offset_y := Floor(-3 + ( ((clientArea.height - 600) / -69) )) ; -3 @600px -> -10 @1080px

    ; voodoo
    itemSizeMultiplier := 1 + ( (clientArea.height - 600) * (1.8 / 1080) ) 

    ; it was a long night
    Item1.x                     :=  Floor((clientArea.width / 2) + (131.6666666666667 * itemSizeMultiplier)) ; fullHD 1197
    Item1.y                     :=  Floor(clientArea.height * 0.8148148148148148) ; fullHD 880

    Item2.x                     :=  Floor((clientArea.width / 2) + (172.2222222222222 * itemSizeMultiplier)) ; fullHD 1270
    Item2.y                     :=  Floor(clientArea.height * 0.8148148148148148) ; fullHD 880

    Item3.x                     :=  Floor((clientArea.width / 2) + (131.6666666666667 * itemSizeMultiplier)) ; fullHD 1197
    Item3.y                     :=  Floor(clientArea.height * 0.8787037037037037) ; fullHD 949

    Item4.x                     :=  Floor((clientArea.width / 2) + (172.2222222222222 * itemSizeMultiplier)) ; fullHD 1270
    Item4.y                     :=  Floor(clientArea.height * 0.8787037037037037) ; fullHD 949

    Item5.x                     :=  Floor((clientArea.width / 2) + (131.6666666666667 * itemSizeMultiplier)) ; fullHD 1197
    Item5.y                     :=  Floor(clientArea.height * 0.9416666666666667) ; fullHD 1017

    Item6.x                     :=  Floor((clientArea.width / 2) + (172.2222222222222 * itemSizeMultiplier)) ; fullHD 1270
    Item6.y                     :=  Floor(clientArea.height * 0.9416666666666667) ; fullHD 1017
}


SetupHotkeyOverlay() {
    ; set up GUI

    ; don't update the overlay if hotkeys are not loaded
    if !(hotkeysRemapped) {
        return
    }

    ; update winID in case the game was closed and reopened
    UpdateWindowData()

    ; get client window x,y, width, height
    UpdateClientArea()

    ; figure out correct overlay coordinates from the client area size
    UpdateOverlayCoordinates()

    ; dynamic font size depending on client height, from 10 at 600px to 22 at 1080px
    fontSize            := Floor(10 + ( ((clientArea.height - 600) / 40) ))

    ; differentiate between quickcast color and normalcast color
    fontColorNormal     := "FFFFFF"
    fontColorQuickcast  := "F69420"

    Gui, gui_HotkeyOverlay: Destroy
    Gui, gui_HotkeyOverlay: -Caption +LastFound -Border +Owner%winID%
    Gui, gui_HotkeyOverlay: Color, 0x000001 ; set GUI background to this color
    WinSet, TransColor, 0x000001 255 ; make that color transparent
    WinSet, ExStyle, +0x20, % gui_HotkeyOverlay ; make the overlay click-through

    GuiFont := "s" . fontSize . " c" . fontColorNormal . " bold"
    Gui, gui_HotkeyOverlay: Font, %GuiFont%

    ; gpt told me, and I quote: "AHK v1.1 can't read the regular dot notation in its Gui — you have to assign local variables"
    ; but I figured the syntaxic out on my own
    ; get fcking trained mr gpt

    ; draw all GRID labels with their loaded key at their x,y
    for index, gr in a_GRID {
        displayKey := gr.physicalKey

        ; truncate the numpadX key name so it doesn't take up a lot of space
        if (InStr(gr.physicalKey, "num", false)) {
            displayKey := "n" . SubStr(gr.physicalKey, -0)
        }

        Gui, gui_HotkeyOverlay: Add, Text, % "x"gr.x " " "y"gr.y, % displayKey
    }

    ; draw all items labels with their loaded key at their x,y
    for index, Item in a_Items {
        ; differentiate between quickcast color and normalcast color
        colorToUse := fontColorNormal
        if (Item.quickcast == 1 AND clientArea.height == 1080) {
            colorToUse := fontColorQuickcast
        }
        displayKey := Item.physicalKey

        ; truncate the numpadX key name so it doesn't take up a lot of space
        if (InStr(Item.physicalKey, "num", false)) {
            displayKey := "n" . SubStr(Item.physicalKey, -0)
        }
    
        GuiFont := "s" . fontSize . " c" . colorToUse . " bold"
        Gui, gui_HotkeyOverlay: Font, %GuiFont%
        Gui, gui_HotkeyOverlay: Add, Text, % "x"Item.x+Coordinates_Items_offset_x " " "y"Item.y+Coordinates_Items_offset_y, % displayKey
    }

    ; top-left DisplacedGrid logo
    Gui, gui_HotkeyOverlay: Add, Picture, % "x"clientArea.width-24 " " "y"8 " " "w"16 " " "h"16, % DisplacedGrid_logoOn
    
    ; finally show the overlay
    Gui, gui_HotkeyOverlay: Show, % "NA " "x"clientArea.x " " "y"clientArea.y " " "w"clientArea.width " " "h"clientArea.height

    ; set focus back to Warcraft III
    WinActivate, %winName%
}



; after some time searching how to do this in v1.1 I found this post
; https://www.autohotkey.com/boards/viewtopic.php?p=227431#p227431
v1_WinGetClientPos( Hwnd ) {
    ; (!) windows border (on top on a window) adds w2 h32, but may vary for different Windows themes
    ; so we need a custom function to figure out the 'clean' window area, called "client area"
    ; this is apparently a native function for AHK v2, but I don't use v2.

    VarSetCapacity( size, 16, 0 )
    DllCall( "GetClientRect", UInt, Hwnd, Ptr, &size )
    DllCall( "ClientToScreen", UInt, Hwnd, Ptr, &size )
    x := NumGet(size, 0, "Int")
    y := NumGet(size, 4, "Int")
    w := NumGet( size, 8, "Int" ) 
    h := NumGet( size, 12, "Int" )

    ;MsgBox, % "v1_WinGetClientPos(): `nClient_X: " X "`nClient_Y: " Y "`nClient_Width: " W "`nClient_Height: " H

    return { X: x, Y: y, width: w, height: h }
}

/*
--------------------------------
*/


ResizeCallback_MOVESIZEEND(hWinEventHook, event, hWnd, idObject, idChild, idThread, dwmsEventTime) {
    ; ignore events not related to top-level windows
    if (idObject != 0)  
        return 0

    SetupHotkeyOverlay()

    Return 0 ; always return 0 for callbacks
}


ResizeCallback_CHANGE(hWinEventHook, event, hWnd, idObject, idChild, idThread, dwmsEventTime) {
    ; ignore events not top-level events i.e. mouse movement
    if (idObject != 0)  
        return 0

    if (isUpdating == 1) {
        return 0
    }

    ; current state of the window
    WinGet, state, MinMax, ahk_id %hWnd%

    ; if the window is being minimized (-1), block
    ; otherwise it attempts to redraw which maximizes it back
    if (state = -1) {
        return 0
    }

    isUpdating := 1

    SetupHotkeyOverlay()
    
    ; I'm using a timer to block this event from firing every 0.0001 second
    ; this is unbelievably clunky because in AHK v1.1 we can't target a function within a timer
    ; and because all modules are inside the autorun section of the application — we can't encapsulate the module, because we can't have a label there
    ; so it's really unintuitive and the amount of time I wasted of these limitations is completely ridiculous
    SetTimer, timerUpdateReset, 500

    Return 0 ; always return 0 for callbacks
}


WindowDestoyedCallback(hWinEventHook, event, hWnd, idObject, idChild, idThread, dwmsEventTime) {
   if (idObject != 0)
       return 0
    
    if (isUpdating == 1) {
        return 0
    }

    If (hWnd = winID) {
        isUpdating := 1
        ;MsgBox, % "HWND: " hWnd "`nwinID: " winID "`nidObject: " idObject "`nwinPID: " winPID
        Switch_CurrentLayout(0)
        UnhookAllEvents()
        SetTimer, timerUpdateReset, 500
    }

    Return 0 ; always return 0 for callbacks
}

; this will unhook all the installed hooks to prevent memory leaks and way to many hooks installed
UnhookAllEvents() {
    ;MsgBox, "Attempting to unhook all events..."

    For index, hook in hooks {
        If (hook) {
            If DllCall("UnhookWinEvent", "Ptr", hook) {
                ;MsgBox, % "Successfully unhooked:" hook
            }
        }
    }

    hooks := []
    ;MsgBox, "All hooks cleared"
}


timerUpdateReset:
    isUpdating := 0
return