Hotkey_bind(objCommand) {

	; QuickDrop
	if (m_QuickDropItems.active) {

		; ALT + CTRL pressed down...
		if ((keyPressed_LAlt || keyPressed_RAlt) and keyPressed_LCtrl) {

			if (m_EventLog.active) {
				UpdateEventLog("QuickDrop...")
			}

			if (objCommand.physicalKey == Item1.physicalKey) {
				QuickDrop(Item1)
				return
			}
			if (objCommand.physicalKey == Item2.physicalKey) {
				QuickDrop(Item2)
				return
			}
			if (objCommand.physicalKey == Item3.physicalKey) {
				QuickDrop(Item3)
				return
			}
			if (objCommand.physicalKey == Item4.physicalKey) {
				QuickDrop(Item4)
				return
			}
			if (objCommand.physicalKey == Item5.physicalKey) {
				QuickDrop(Item5)
				return
			}
			if (objCommand.physicalKey == Item6.physicalKey) {
				QuickDrop(Item6)
				return
			}
		}
	} else {

		if (m_EventLog.active) {
			UpdateEventLog("Quick Drop is OFF")	
		}

	}


	; Item binds use ALT
	; This is hardcoded.
	; Maybe in future updates if/when I get to update this to a higher level of enlightment the layout will be more flexible.
	; The reason the block is nested within the "Control Group" logic is because they share the same keys: qwaszx.
	; So ALT is the differentiator between control groups and items.

	if (ItemsRequireAlt) {

		if (keyPressed_LAlt || keyPressed_RAlt) {

			if (m_EventLog.active) {
				UpdateEventLog("ITEM USED`nKeyboard Key:`t" objCommand.physicalKey "`ningameHotkey:  " objCommand.ingameHotkey)	
			}

			if (objCommand.physicalKey == Item1.physicalKey) {
				Hotkey_Item(Item1)
				return
			}

			if (objCommand.physicalKey == Item2.physicalKey) {
				Hotkey_Item(Item2)
				return
			}
			
			if (objCommand.physicalKey == Item3.physicalKey) {
				Hotkey_Item(Item3)
				return
			}
			
			if (objCommand.physicalKey == Item4.physicalKey) {
				Hotkey_Item(Item4)
				return
			}
			
			if (objCommand.physicalKey == Item5.physicalKey) {
				Hotkey_Item(Item5)
				return
			}
			
			if (objCommand.physicalKey == Item6.physicalKey) {
				Hotkey_Item(Item6)
				return
			}
		}
	}



	; -------------------
	; Control Group logic
	
	; Set control group
	if (keyPressed_LCtrl) {

		if (m_EventLog.active) {
			UpdateEventLog("Control Group Set: `nKeyboard Key:`t" objCommand.physicalKey "`ningameHotkey:  " objCommand.ingameHotkey)	
		}	

		Send % "^" objCommand.ingameHotkey
		return
	}

	; Add to control group
	if (keyPressed_LShift) {
		
		if (m_EventLog.active) {
			UpdateEventLog("Control Group Add `nKeyboard Key:`t" objCommand.physicalKey "`ningameHotkey Key:  " objCommand.ingameHotkey)	
		}

		Send % "+" objCommand.ingameHotkey
		return
	}


	; Select control group
	if (m_EventLog.active) {
		UpdateEventLog("Control Group Select `nKeyboard Key:`t" objCommand.physicalKey "`ningameHotkey Key:  " objCommand.ingameHotkey)	
	}

	Send % objCommand.ingameHotkey

	; See module_InstantCamera.ahk
	if (m_InstantCamera.active == 1) {
		InstantCamera(objCommand)	
	}
}