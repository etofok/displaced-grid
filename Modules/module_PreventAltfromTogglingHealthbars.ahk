;-----------------------------------------
; ----- PreventAltfromTogglingHealthbars
;-----------------------------------------
; 
;
;-----------------------------------------
; I do believe this functionality SHOULD be a part of the core experience.
;-----------------------------------------

; Yes I use Globals
Global menu_Toggle_PreventAltfromTogglingHealthbars				:= "[ALT] No Longer Toggles Healthbars"
Menu, Tray, Add, %menu_Toggle_PreventAltfromTogglingHealthbars%, Toggle_PreventAltfromTogglingHealthbars

;--------------------------------
; On program start...

if (b_PreventAltfromTogglingHealthbars == 1) {
	Control_PreventAltfromTogglingHealthbars(1)
} else {
	Control_PreventAltfromTogglingHealthbars(0)
	Menu, Tray, Disable, 	%menu_Toggle_PreventAltfromTogglingHealthbars%
}

;--------------------------------

;--------------------------------
; Module
;--------------------------------

; no code here.

; Alt-Tabbing is handled in Hotkey_Modifiers.ahk
; Items with Alt is handled in Hotkey_Bind.ahk

;-----------------------------------------
; PreventAltfromTogglingHealthbars Control
;-----------------------------------------

Toggle_PreventAltfromTogglingHealthbars() {

	if (b_PreventAltfromTogglingHealthbars == 1) {
		Control_PreventAltfromTogglingHealthbars(0)
		ReloadHotkeys()	; have to reload here
	} else {
		Control_PreventAltfromTogglingHealthbars(1)
		ReloadHotkeys() ; have to reload here
	}
} 


Control_PreventAltfromTogglingHealthbars(switchTo) {

	b_PreventAltfromTogglingHealthbars := switchTo
	
	ToggleCheckmark(menu_Toggle_PreventAltfromTogglingHealthbars, switchTo)

	if (b_EventLog) {
		UpdateEventLog("PreventAltfromTogglingHealthbars - " . switchTo)
	}
}