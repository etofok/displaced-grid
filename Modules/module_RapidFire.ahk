;-----------------------------------------
; ----- RapidFire Casting
;-----------------------------------------
;
; This module enables the user to hold down a hotkey to repeatedly activate it.
;
; Example: we used an Ability, but got an yellow error message ('Unit is immune to magic' / 'Spell is not ready' / 'Must target organic units' / 'Unable to target self' / etc)
;
; "b_RapidFire == 1" will deselect the crosshair-like 'Select Target' mouse cursor state by sending {Espace} key
; ...which allows the user instantly issue the same command.
;
; LIMITATION: it'll deselect your in-game chat panel as you type, because it sends {Escape}, and it closes the chat panel.
; SOLUTION: I tied this module to Displaced Grid layout.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------


;--------------------------------
; On program start...

Global m_RapidFire_menuLabel 			:= "< RapidFire Casting >"

; Add this module to Tray only if it has been enabled in Settings
if (m_RapidFire.enabled == True) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_RapidFire.menuLabel := m_RapidFire_menuLabel ; but we can store it just in case

	Menu, Tray, Add, %m_RapidFire_menuLabel%, Toggle_m_RapidFire

	Control_m_RapidFire(1)
}
 
;-----------------------------------------
; Module Control

RapidFire() {
	Send, {Escape}
	if (m_EventLog.active) {
		UpdateEventLog("RapidFire - Deselect")	
	}
}

RapidFire_queue() {
	Send, {Shift Down}{Escape}
	if (m_EventLog.active) {
		UpdateEventLog("RapidFire - Deselect")
	}
}

;-----------------------------------------
; RapidFire Control
;-----------------------------------------

Toggle_m_RapidFire() {
	Control_m_RapidFire(not m_RapidFire.active)
}

Control_m_RapidFire(switchTo) {

	m_RapidFire.active := switchTo
	
	ToggleCheckmark(m_RapidFire_menuLabel, switchTo)

	if (m_EventLog.active) {
		UpdateEventLog("RapidFire - " . switchTo)
	}
}