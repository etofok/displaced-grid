;-----------------------------------------
; ----- Instant Camera
;-----------------------------------------
;
; This is a tiny module that allows the user to instantly move (pan) the camera to a control group. 

; The defaults in Displaced Grid are the control groups 7,8,9 and 0 (which are bound to f1 f2 f3 f4).
; These are VALID control groups - not separate cameras!
;
; This module double-taps the group when you single tap it. That's how the camera instantly pans.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that may or not provide an advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

;--------------------------------
; On program start...

Global m_InstantCamera_menuLabel := "< Instant Camera >"
Global m_InstantCamera_menuLabel_extra := " "

; Add this module to Tray only if it has been enabled in Settings
if (m_InstantCamera.enabled == True) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_InstantCamera.menuLabel := m_InstantCamera_menuLabel ; but we can store it just in case

	cnt := 0
	
	for index, gr in a_ControlGroups {

	    if (gr.instantCamera == 1) {
	    	cnt++
	    	tmpup := gr.physicalKey

	    	StringUpper, tmpup, tmpup
	    	m_InstantCamera_menuLabel_extra := m_InstantCamera_menuLabel_extra . " [" . tmpup . "]"
	    }
	}


	if (cnt = 0) {
		m_InstantCamera_menuLabel := m_InstantCamera_menuLabel . m_InstantCamera_menuLabel_extra . "none"
	} else {
		m_InstantCamera_menuLabel := m_InstantCamera_menuLabel . m_InstantCamera_menuLabel_extra
	}

	Menu, Tray, Add, %m_InstantCamera_menuLabel%, Toggle_m_InstantCamera

	Control_m_InstantCamera(1)
}


;-----------------------------------------
; Module

InstantCamera(objCommand) {

	if (objCommand.instantCamera == 1) {
		Send % objCommand.ingameHotkey, 1
	}	
}

;-----------------------------------------
; InstantCamera Control
;-----------------------------------------

Toggle_m_InstantCamera() {
	Control_m_InstantCamera(not m_InstantCamera.active)
} 

Control_m_InstantCamera(switchTo) {

	m_InstantCamera.active := switchTo
	
	ToggleCheckmark(m_InstantCamera_menuLabel, switchTo)

	if (m_EventLog.active) {
		UpdateEventLog("Instant Camera - " . switchTo)	
	}
}