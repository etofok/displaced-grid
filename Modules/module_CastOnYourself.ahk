;-----------------------------------------
; ----- Cast on Yourself
;-----------------------------------------
; 
; 1) "Alt + Ability X" casts the ability onto the caster (doesn't work with items because items require Alt to cast in the firstplace).
;
; Most contemporary games already have some sort of 'Cast On Yourself' functionality to help players with in-battle control.
; With this module it's now possible in Warcraft 3.
; This is a very blatant macro that targets the Unit Portrait and returns the mouse cursor to its initial position.
;
; 2) ALT + D + D no longer exits the game!
; In Displaced Grid we use ALT a lot, so it's much easier to accidentally press this combination.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience.
;-----------------------------------------


;--------------------------------
; On program start...

Global m_CastOnYourself_menuLabel := "< Cast on Yourself >"

; Add this module to Tray only if it has been enabled in Settings
if (m_CastOnYourself.enabled == True) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_CastOnYourself.menuLabel := m_CastOnYourself_menuLabel ; but we can store it just in case

	Menu, Tray, Add, %m_CastOnYourself_menuLabel%, Toggle_m_CastOnYourself

	Control_m_CastOnYourself(1)
}

;--------------------------------
; Module
;--------------------------------

CastOnYourself(objCommand) {

	; memorise where mouse cursor currently is
	MouseGetPos, StartX, StartY			

	; if Shift is pressed down...
	if (keyPressed_LShift) {

		if (m_EventLog.active) {
			UpdateEventLog("Shift + Cast on Yourself! (" objCommand.ingameHotkey ")")	
		}

		; move the cursor on top of the portrait element, cast the ability
		; this is important because it respects both quickcast=0 and quickcast=1
		MouseMove, PortraitUI.x, PortraitUI.y, 0	; I feel like moving THEN clicking the portrait is more consistent
		Send % "{Shift Down}"objCommand.ingameHotkey
		Click % PortraitUI.x " " PortraitUI.y

		; this is a crutch that I think makes it less buggy. otherwise the Alt being pressed stays pressed for some reason. no idea.
		if (keyPressed_LAlt) {
			Send {Blind}{LAlt Up}
		}
		
		; if RapidFire is ON, we need to issue the Escape command to not break the Shift-Queue
		if (m_RapidFire.active == 1) {
			RapidFire_queue()

			if (m_EventLog.active) {
				UpdateEventLog("Deselect")			
			}
		}

	; if Shift is not pressed down...
	} else {

		if (m_EventLog.active) {
			UpdateEventLog("Cast on Yourself! (" objCommand.ingameHotkey ")")	 
		}

		; issue a 'Stop' command to cancel the current order.
		; otherwise the caster turns
		Send % GRID_10.ingameHotkey

		; move the cursor on top of the portrait element, cast the ability
		; this is important because it respects both quickcast=0 and quickcast=1
		MouseMove, PortraitUI.x, PortraitUI.y, 0	; I feel like moving THEN clicking the portrait is more consistent
		Send % objCommand.ingameHotkey
		Click % PortraitUI.x " " PortraitUI.y

		; this is a crutch that I think makes it less buggy. otherwise the Alt being pressed stays pressed for some reason. no idea.
		if (keyPressed_LAlt) {
			Send {Blind}{LAlt Up}
		}
	}

	if (m_EventLog.active) {
		UpdateEventLog("Clicked Portait")	
	}

	; Return the mouse cursor to its initial position
	MouseMove, StartX, StartY, 0

	if (m_EventLog.active) {
		UpdateEventLog("Returning Mouse Cursor to " StartX ", " StartY)
	}
}


;-----------------------------------------
; CastOnYourself Control
;-----------------------------------------

Toggle_m_CastOnYourself() {
	Control_m_CastOnYourself(not m_CastOnYourself.active)
}


Control_m_CastOnYourself(switchTo) {

	m_CastOnYourself.active := switchTo

	ToggleCheckmark(m_CastOnYourself_menuLabel, switchTo)

	if (m_EventLog.active) {
		UpdateEventLog("Cast on Yourself - " . switchTo)
	}
}