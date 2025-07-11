Hotkey_CommandCard(objCommand) {

	if (m_EventLog.active) {
		UpdateEventLog("Keyboard Key:`t" objCommand.physicalKey "`ningameHotkey:  " objCommand.ingameHotkey)	
	}

	; redirect to the CastOnYourself module if Alt is held
	; this is for COMMAND CARD (not items)
	if (m_CastOnYourself.active == 1) { ; I think it's kind of shitty to check this everytime on runtime, but what the alternative? making 10 similar functions for SetHotkeys? Imagine the mess

		if (keyPressed_LAlt || keyPressed_RAlt) {
			CastOnYourself(objCommand)
			return
		}
	}

	; redirect to the SetSkillPoint module if Ctrl is held
	if (m_SetSkillPoint.active == 1) {

		if (keyPressed_LCtrl || keyPressed_RCtrl) {
			SetSkillPoint(objCommand)
			return
		}
	}

	; if CapsLock is held, issue that command to all the groups (unifiedOrders)
	if (m_UnifiedOrders.active == 1) {

		if (keyPressed_CapsLock) {
			
			UnifiedOrders(objCommand)
			return
		}
	}

	; when the commandcard action is held the RapidFire module deselects (Escape) the 'Select' cursor so the action is attempted again
	; Example: we used an Ability, but got an error such as 
	; 'unit is immune to magic' / 'Spell is not ready' / 'must target organic units' / 'unable to target self' / etc
	; RapidFire deselects the 'Select Target' mouse cursor state
	; and this allows us to use the Ability button again... just by holding the Ability button!
	if (m_RapidFire.active == 1) {

		if (A_ThisHotkey == A_PriorHotkey) {
			; this will send Escape
			; this is not ideal because rn it does this for any command card action, and it's not needed for Attack/Stop etc.
			; however specifying each individual commandcard action for every layout is such significant bump in difficulty to set up I feel like it's not necessary
			; if you have a better solution to this let me know
			RapidFire()
		}
	}

	if (keyPressed_LShift || keyPressed_RShift) {
		Send % "+" objCommand.ingameHotkey
		return
	}

	Send % objCommand.ingameHotkey
}
