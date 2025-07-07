;-----------------------------------------
; 	Displaced Grid for Warcraft III:Reforged by etofok
;	Website Presentation: https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/index
;	Download Latest: https://github.com/etofok/Displaced-Grid-for-Warcraft-III

;	Development: 
;	Dec 10th, 2023 - July 7th, 2025

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

; ---- get window info ----
UpdateWindowData()

; --------------------------------

#Include *i %A_ScriptDir%\Hotkey Layouts\INGAME_HOTKEYS.ahk
#include *i %A_ScriptDir%\Hotkey Layouts\layout_DisplacedGrid.ahk
#include *i %A_ScriptDir%\Hotkey Layouts\layout_BlizzardGrid.ahk
#include *i %A_ScriptDir%\Hotkey Layouts\layout_Dota1Grid.ahk
#include *i %A_ScriptDir%\Hotkey Layouts\layout_YourCustomGrid.ahk

#include *i %A_ScriptDir%\Modules\SetHotkeys.ahk

#Include *i %A_ScriptDir%\Modules\SettingsGUI.ahk
ReadSettingsFromIni()


#Include *i %A_ScriptDir%\Modules\Hotkey_Intercept.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_CommandCard.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_Bind.ahk
#Include *i %A_ScriptDir%\Modules\Hotkey_Item.ahk
#Include *i %A_ScriptDir%\Modules\DynamicHotkey.ahk

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

loadLayout(layout) {

	; load the layout
	; all this is hardcoded for now. expanding this to be user friendly will take a lot of my brainpower for no audience

	if (layout == "DisplacedGrid") {
		layout_DisplacedGrid()
		currentLayout := layoutName
	}
	
	if (layout == "BlizzardGrid") {
		layout_BlizzardGrid()
		currentLayout := layoutName
	}	

	if (layout == "Dota1Grid") {
		layout_Dota1Grid()
		currentLayout := layoutName
	}

	if (layout == "YourCustomGrid") {
		layout_YourCustomGrid()
		currentLayout := layoutName
	}
	
}

unloadLayout() {
	SetHotkeys(0)
}

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


;-----------------------------------------
; Labes that I can't include into modules, because modules are loaded in the autorun section
; it's not elegant and I'm aware

; this is to capture Press Any Key... for setting up user hotkeys
; in AHK v1 SetTimer only works with labels, so this needs to be a label
; and I can't put a label into SettingsGUI.ahk because it loads in the autolaunch section
_WatchForKeyPress:
    Loop {
        KeyList := "A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|" ; letters
                 . "0|1|2|3|4|5|6|7|8|9|"
                 . "F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|"
                 . "Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|"
                 . "NumpadDot|NumpadEnter|NumpadAdd|NumpadSub|NumpadMult|NumpadDiv|"
                 . "ScrollLock|CapsLock|Pause|Insert|Delete|Home|End|PgUp|PgDn|"
                 . "Up|Down|Left|Right|Tab|Enter|Escape|Space|Backspace|PrintScreen"

        Loop, Parse, KeyList, |
        {
            if GetKeyState(A_LoopField, "P") {
                SetTimer, _WatchForKeyPress, Off
                DynamicHotkey_Capture(A_LoopField)
                return
            }
        }
    }
return

RepeatHotkeyLoop:
	if (!repeatTimerActive || !repeatDelayTimerFired)
		return

	if (!GetKeyState(repeatKey, "P")) {
		SetTimer, RepeatHotkeyLoop, Off
		repeatTimerActive := false
		return
	}

	MouseGetPos, mx, my
	if (mx >= InventoryStartX && mx <= InventoryEndX && my >= InventoryStartY && my <= InventoryEndY) {
		SetTimer, RepeatHotkeyLoop, Off
		repeatTimerActive := false
		return
	}

	if (keyPressed_LShift)
		Send {Blind}{Shift Down}%repeatHotkey%{Shift Up}
	else
		Send {Blind}%repeatHotkey%
return


StartRepeatLoop:
	if (!repeatTimerActive)
		return
	repeatDelayTimerFired := true
	SetTimer, RepeatHotkeyLoop, 100
return


#IfWinActive

