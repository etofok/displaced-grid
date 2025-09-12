;-----------------------------------------
; 	Displaced Grid for Warcraft III:Reforged by etofok
;	Website Presentation: https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/index
;	Download Latest: https://github.com/etofok/Displaced-Grid-for-Warcraft-III

;	Development: 
;	Dec 10th, 2023 - Sept 13th, 2025

#SingleInstance force
#NoEnv
#Persistent
#UseHook
#MaxThreadsPerHotkey 1

;-----------------------------------------

SetWorkingDir %A_ScriptDir%

if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"


SetTitleMatchMode, 3
CoordMode, Mouse, Client ; otherwise the war3 window in window mode will account for the window border

#Include *i %A_ScriptDir%\Modules\Initialize.ahk

; get window info
UpdateWindowData()
; dynamically load all layouts in the Hotkey Layouts folder
loadLayouts()
#Include *i %A_ScriptDir%\Modules\layoutLoader.ahk

; --------------------------------
#Include *i %A_ScriptDir%\Hotkey Layouts\INGAME_HOTKEYS.ahk
#include *i %A_ScriptDir%\Modules\SetHotkeys.ahk

; --------------------------------
#Include *i %A_ScriptDir%\Modules\SettingsGUI.ahk
ReadSettingsFromIni()

; --------------------------------
#Include *i %A_ScriptDir%\Modules\Hotkey_Intercept.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_CommandCard.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_Bind.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_Item.ahk
#Include *i %A_ScriptDir%\Modules\DynamicHotkey.ahk

; --------------------------------
Hotkey, %Hotkey_Toggle_CurrentLayout%, 					Toggle_CurrentLayout,		UseErrorLevel
Hotkey, %Hotkey_ScriptReload%, 							ScriptReload,				UseErrorLevel
Hotkey, %Hotkey_OpenSettings%, 							OpenSettings,				UseErrorLevel

Hotkey, IfWinActive, %winClass%

;Hotkey, %Hotkey_Send_glhf%,							Send_glhf,					UseErrorLevel
;Hotkey, %Hotkey_Send_gg%, 								Send_gg,					UseErrorLevel

;-----------------------------------------
; App control hotkeys
;-----------------------------------------
Tooltip_Hotkey_Toggle_CurrentLayout 		:= ReplaceModifiers(Hotkey_Toggle_CurrentLayout)
Tooltip_Hotkey_ScriptReload 				:= ReplaceModifiers(Hotkey_ScriptReload)
Tooltip_Hotkey_OpenSettings 				:= ReplaceModifiers(Hotkey_OpenSettings)


Global menu_Toggle_CurrentLayout			:= currentLayout " <" 			. Tooltip_Hotkey_Toggle_CurrentLayout 	. ">"
Global menu_ScriptReload 					:= "Restart the app <" 			. Tooltip_Hotkey_ScriptReload 			. ">"
Global menu_OpenSettings					:= "Open Settings"
Global menu_ScriptFolder					:= "Open Folder"

;-----------------------------------------
; Tray Menu
;-----------------------------------------

Menu, Tray, Icon, %A_ScriptDir%\Modules\icons\icon_Hotkeys0.ico
Menu, Tray, NoStandard
Menu, Tray, Tip, 		Displaced Grid %DisplacedGridVersion% by etofok

Menu, Tray, Add, 		Displaced Grid %DisplacedGridVersion% by etofok,		handler_blank
Menu, Tray, Disable, 	Displaced Grid %DisplacedGridVersion% by etofok
Menu, Tray, Add, 		Donate >>,													Button_Donate
Menu, Tray, Add, 		Discord >>,												Button_Discord
Menu, Tray, Add, 		Website >>,												Button_Website

Menu, Tray, Add, 	,		
Menu, Tray, Add, 		Layout in use:, 										handler_blank
Menu, Tray, Disable, 	Layout in use:

Menu, Tray, Add, 		%menu_Toggle_CurrentLayout%,							Toggle_CurrentLayout
Menu, Tray, Default, 	%menu_Toggle_CurrentLayout%,

#Include *i %A_ScriptDir%\Modules\module_EventLog.ahk


; activate hotkeys on app start?
if (ActivateHotkeysOnLaunch == 1) {
	loadLayout(currentLayout)
	Switch_CurrentLayout(1)
} else {
	Switch_CurrentLayout(0)
}

Menu, Tray, Add, 	,

Menu, Tray, Add, 		Modules in use:, handler_blank
Menu, Tray, Disable, 	Modules in use:

#Include 				*i %A_ScriptDir%\Modules\module_HealthbarsAlwaysStay.ahk
#Include 				*i %A_ScriptDir%\Modules\module_UnifiedOrders.ahk
#Include 				*i %A_ScriptDir%\Modules\module_SetSkillPoint.ahk
#Include 				*i %A_ScriptDir%\Modules\module_CastOnYourself.ahk
#Include 				*i %A_ScriptDir%\Modules\module_RapidFire.ahk
#Include 				*i %A_ScriptDir%\Modules\module_RepeatMouse.ahk
#Include 				*i %A_ScriptDir%\Modules\module_InstantCamera.ahk
#Include 				*i %A_ScriptDir%\Modules\module_QuickCastItems.ahk
#Include 				*i %A_ScriptDir%\Modules\module_QuickDropItems.ahk
#Include 				*i %A_ScriptDir%\Modules\module_ShiftQueueItems.ahk

Menu, Tray, Add, 		,
Menu, Tray, Add, 		Settings, handler_blank
Menu, Tray, Disable, 	Settings
Menu, Tray, Add, 		%menu_OpenSettings%, 										OpenSettings
Menu, Tray, Add, 		,

Menu, Tray, Add, 		%menu_ScriptReload%,										ScriptReload
Menu, Tray, Add, 		%menu_ScriptFolder%, 										ScriptFolder
Menu, Tray, Add, 		Exit, 														ScriptExit

;-----------------------------------------
; ----- L A U N C H -----
;-----------------------------------------

if (false) {
} ; this is actually an important line of code

; Greetings and Salutations
displaySplash := "Displaced Grid`nby etofok`n`nTOGGLE HOTKEY: `n" . Tooltip_Hotkey_Toggle_CurrentLayout
SplashTextOn, 300, 120, , %displaySplash%
Sleep, 1000
SplashTextOff

; load Overlay at the very end
#Include *i %A_ScriptDir%\Modules\module_HotkeyOverlay.ahk
#Include *i %A_ScriptDir%\Modules\SettingsGUI_labels.ahk

;--------------------
; --- E N D  O F  A U T O L A U N C H ---
;-----------------------------------------
;-----------------------------------------
return ; this return is the most important line of code
; all modules are added in the autorun section above




#IfWinActive


;--------------------------------
; 
;--------------------------------
Switch_CurrentLayout(switchTo) {

	if (switchTo == 1) {	

		if !(WinExist(winClass)) {
			MsgBox, 48, Displaced Grid %DisplacedGridVersion%, % error_warcraftNotFound
			Switch_CurrentLayout(0)
			return
		}

		loadLayout(currentLayout)
		SetHotkeys(1)

		Control_HotkeyOverlay(1)
		if (m_RapidFire.enabled) {
			Control_m_RapidFire(1)
		}

		ToggleCheckmark(menu_Toggle_CurrentLayout, 1)
		Menu, Tray, Icon, %A_ScriptDir%\Modules\icons\icon_Hotkeys1.ico
	}


	if (switchTo == 0) {

		unloadLayout()

		Control_HotkeyOverlay(0)
		if (m_RapidFire.enabled) {
			Control_m_RapidFire(0) ; This is a crutch to "link" "DisplacedGrid Off" to the RapidFire module. Otherwise you can't type, because RapidFire sends an ESCAPE command as you press buttons (i.e. when you type) which closes the chat
		}

		ToggleCheckmark(menu_Toggle_CurrentLayout, 0)

		Menu, Tray, Icon, %A_ScriptDir%\Modules\icons\icon_Hotkeys0.ico
	}
}

Toggle_CurrentLayout() {
	Switch_CurrentLayout(not hotkeysRemapped)
}


;--------------------------------
; Load all layouts dynamically
;--------------------------------
loadLayouts() {
    global LayoutMap, a_Layouts

    loaderFile := A_ScriptDir "\Modules\layoutLoader.ahk"
    FileDelete, %loaderFile%  ; clear old loader

    ; loop through all layout_*.ahk files
    Loop, Files, %A_ScriptDir%\Hotkey Layouts\layout_*.ahk
    {
        ; get the layout name from the file
        RegExMatch(A_LoopFileName, "layout_([A-Za-z0-9_]+)\.ahk", match)
        layoutName := match1

        ; get the function name - find first function
        FileRead, layoutFileContents, %A_LoopFileFullPath%
        RegExMatch(layoutFileContents, "([A-Za-z0-9_]+)\s*\(", match)
        layoutFunc := match1

        ; append #Include to load functions
        FileAppend, #Include *i %A_LoopFileFullPath%`n, %loaderFile%

        ; store names and function references
        if (layoutName != "" && layoutFunc != "") {
            a_Layouts.push(layoutName)  			; store just the layout's name
            LayoutMap[layoutName] := layoutFunc		; store the function to call later to load keys
        }
    }

    ; convert function names into callable Func objects
    for index, name in a_Layouts {
        funcName := LayoutMap[name]
        if IsFunc(funcName)
            LayoutMap[name] := Func(funcName)
        else
            LayoutMap[name] := ""
    }
}


; call the selected layout
loadLayout(layout) {
    global LayoutMap, currentLayout

    if !LayoutMap.HasKey(layout) || (LayoutMap[layout] = "") {
        ;MsgBox, 16, Error, Layout "%layout%" not found!
        if (m_EventLog.active) {
        	UpdateEventLog("Layout " layout " not found!")
        }

        return
    }

    ; Call the function tied to this layout
    LayoutMap[layout].Call()
    currentLayout := layout
}


unloadLayout() {
	SetHotkeys(0)
}


;----------------------------------------------------------------
; UpdateWindowData 
;----------------------------------------------------------------
UpdateWindowData() {
	WinGet, winID, ID, %winName%
	WinGet, winPID, PID, %winClass%

	if (winID == "" || winPID == "") {
		;--------------------------MsgBox % error_warcraftNotFound
	}
}

;----------------------------------------------------------------
; Player respect 
;----------------------------------------------------------------
Send_glhf() {
    Send, {Enter}
    Sleep, 50
    SendRaw, gl hf
    Sleep, 50
    Send, {Enter}
}


Send_gg() {
    Send, {Enter}
    Sleep, 50
    SendRaw, gg
    Sleep, 50
    Send, {Enter}
}




;--------------------------------
; Reload This Script
;--------------------------------
ScriptReload:
	;Suspend, Permit
	UnhookAllEvents() ; important because we set hooks for Overlay to work; hooks must be unhooked manually
	Reload
return

;--------------------------------
; Reload This Script
;--------------------------------
RestartApp() {
	UnhookAllEvents() ; important because we set hooks for Overlay to work; hooks must be unhooked manually
	Reload
}

;--------------------------------
; Locate This Script
;--------------------------------
ScriptFolder:
	Suspend, Permit
	Run, %a_scriptdir%
return

;--------------------------------
; OpenSettings
;--------------------------------
OpenSettings:
	SettingsGUI()
return

;--------------------------------
; Exit This Script
;--------------------------------
ScriptExit:
	Suspend, Permit
	UnhookAllEvents() ; important because we set hooks for Overlay to work; hooks must be unhooked manually
	ExitApp
return

;----------------------------------------------------------------
;----------------------------------------------------------------
;----------------------------------------------------------------

;--------------------------------
; Translate Tooltip Hotkeys to Human Language
;--------------------------------
ReplaceModifiers(str) {
    ; replace symbols with corresponding names
    str := StrReplace(str, "+", "SHIFT+")		; start with the "+"!
    str := StrReplace(str, "!", "ALT+")
    str := StrReplace(str, "^", "CTRL+")
    str := StrReplace(str, "#", "WIN+")

    return str
}

;--------------------------------
; Toggle Checkmark
;--------------------------------
ToggleCheckmark(trayitem, onoff) {
	if (trayitem) {
		;MsgBox, % "trayitem: " trayitem
		sub := (onoff == 1) ? "Check" : "Uncheck"
		Menu, Tray, %sub%, %trayitem%
	}
}

;--------------------------------
; RemoveTip
;--------------------------------
RemoveTip:
	ToolTip
return

;--------------------------------
; linktr
;--------------------------------
LinkTree:
	Run, https://linktr.ee/etofok
return

;-----------------------------------------
; Random 
;-----------------------------------------
Rand(min, max) {
    Random, output, min, max
    return output
}

;-----------------------------------------
; Blank 
;-----------------------------------------

handler_blank() {
}


#IfWinActive

