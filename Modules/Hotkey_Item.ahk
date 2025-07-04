;--------------------------------

;--------------------------------

Hotkey_Item(objCommand) {

	static LastKeyPressTime := 0
	local currentTime := A_TickCount ; Get current time in milliseconds

	 
	if (m_EventLog.active) {
		UpdateEventLog("--- Hotkey_Item ----")
		UpdateEventLog("Physical Key:`t" A_ThisHotkey "`nLogical key:`t" objCommand.ingameHotkey)	
	}

	; Shift-keyed Item Key Usage
	if (keyPressed_LShift) {

		; By default, we cannot activate Item keys while Shift is pressed down: there's just no effect - the item hotkey is ignored.
		; We must let go of the Shift key, activate the Item Hotkey, THEN hold down Shift and only then select the target.
		; The ShiftQueueItems module improves this so we do not have to let go of the Shift key to activate the Item key.

		if (m_ShiftQueueItems.active == 1) {

			if (A_PriorKey == objCommand.physicalKey) {
				UpdateEventLog("---- Item Double tap! ---")
				CastOnYourself(objCommand)
				Return
			}

			if (m_EventLog.active) {
				UpdateEventLog("Module QuickCastItems is ON")
			}

			Send % "{Shift Down}"objCommand.ingameHotkey

			if (m_EventLog.active) {
				UpdateEventLog("Shift Queueing item...")
			}

			; ONLY QUICK CAST IF THE MODULE IS ENABLED
			if (m_QuickCastItems.active == 1) {
				
				QuickCastItem(objCommand)

			}
		}

		; By default, we cannot activate Item keys while Shift is pressed down: there's just no effect - the item hotkey is ignored.
		if (m_ShiftQueueItems.active == 0) {

			if (m_EventLog.active) {
				UpdateEventLog("Attempt to activate " objCommand.ingameHotkey "`n(Default behavior - no action)")
			}
		}

	; No "Shift" Item Usage
	} else {

		; redirect to CastOnYourself if the item hotkey has been double-tapped
		if ((keyPressed_LAlt || keyPressed_RAlt) AND (currentTime - LastKeyPressTime < 500) && LastKeyPressTime != 0)  { ; Added LastKeyPressTime != 0 to prevent initial false positive
	    	UpdateEventLog("---- Item Double Tap! ---")
		    LastKeyPressTime := 0
		    CastOnYourself(objCommand)
		    Return
		}
		
		LastKeyPressTime := currentTime


		Send % objCommand.ingameHotkey ; fire layout key to active item

		; redirect to quickcast if the module is enabled
		if (m_QuickCastItems.active == 1) {

			if (m_EventLog.active) {
				UpdateEventLog("Module QuickCastItems is ON")
			}

			QuickCastItem(objCommand)

		} else {
			if (m_EventLog.active) {
				UpdateEventLog("Module QuickCast Items is OFF")
			}	
		}
	}
}