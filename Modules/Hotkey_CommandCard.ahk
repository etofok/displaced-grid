Hotkey_CommandCard(objCommand) {

	if (m_EventLog.active) {
		UpdateEventLog("Keyboard Key:`t" objCommand.physicalKey "`ningameHotkey:  " objCommand.ingameHotkey)	
	}

	; redirect to the CastOnYourself module if Alt is pressed down
	; this is for COMMAND CARD (not items)
	if (m_CastOnYourself.active == 1) {

		if (keyPressed_LAlt || keyPressed_RAlt) {
			CastOnYourself(objCommand)
			return
		}
	}

	; redirect to the SetSkillPoint module if Ctrl is pressed down
	if (m_SetSkillPoint.active == 1) {

		if (keyPressed_LCtrl) {
			SetSkillPoint(objCommand)
			return
		}
	}

	; if CapsLock is pressed held, issue that command to all the groups (unifiedOrders)
	if (m_UnifiedOrders.active == 1) {

		if (keyPressed_CapsLock) {
			
			UnifiedOrders(objCommand)
			return
		}
	}


	; If we're holding down a command the RapidFire module will attempt to fire it repeatedly
	if (m_RapidFire.active == 1) {	; * Breakdown below

		if (A_ThisHotkey == A_PriorHotkey) {
			RapidFire()		
		}
	}

	if (keyPressed_LShift) {
		Send % "+" objCommand.ingameHotkey
		return
	}

	Send % objCommand.ingameHotkey
}

; RapidFire allows us to hold down a hotkey to repeatedly activate it.
;
; Example: we used an Ability, but got an error such as 
; 'unit is immune to magic' / 'Spell is not ready' / 'must target organic units' / 'unable to target self' / etc
;
; This code will deselect the 'Select Target' mouse cursor state
; ...and this allows us to use the Ability button again... just by holding the Ability button!


