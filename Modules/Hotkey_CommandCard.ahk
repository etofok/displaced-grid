Hotkey_CommandCard(objCommand) {

	if (b_EventLog) {
		UpdateEventLog("Physical Key:`t" objCommand.physicalKey "`nGRID Action:  " objCommand.logicalKey "`nA_ThisHotkey: " A_ThisHotkey)	
	}

	; redirect to the CastOnYourself module if Alt is pressed down
	if (b_CastOnYourself == 1) {

		if (keyPressed_LAlt) {
			CastOnYourself(objCommand)
			return
		}
	}

	; redirect to the SetSkillPoint module if Ctrl is pressed down
	if (b_SetSkillPoint == 1) {

		if (keyPressed_LCtrl) {
			SetSkillPoint(objCommand)
			return
		}
	}

	; if CapsLock is pressed held, issue that command to all the groups (commandThisGroup)
	if (b_CommandMultipleGroups == 1) {

		if (keyPressed_CapsLock) {
			
			CommandMultipleGroups(objCommand)
			return
		}
	}

	; If we're holding down a command the RapidFire module will attempt to fire it repeatedly
	if (b_RapidFire == 1) {	; * Breakdown below

		if (A_ThisHotkey == A_PriorHotkey) {
			RapidFire()		
		}
	}


	if (keyPressed_LShift) {

		Send % "+" objCommand.logicalKey

	} else {

		Send % objCommand.logicalKey
	}
}

; This last part with b_RapidFire allows us to hold down a hotkey to repeatedly activate it.
;
; Example: we used an Ability, but got an error such as 
; 'unit is immune to magic' / 'Spell is not ready' / 'must target organic units' / 'unable to target self' / etc
;
; This code will deselect the 'Select Target' mouse cursor state
; ...and this allows us to use the Ability button again... just by holding the Ability button!



