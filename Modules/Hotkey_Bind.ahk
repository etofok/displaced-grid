Hotkey_bind(objCommand) {

	; QuickDrop
	if (b_QuickDropItems) {

		; ALT + CTRL pressed down...
		if (keyPressed_LAlt and keyPressed_LCtrl) {

			if (b_EventLog) {
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

		if (b_EventLog) {
			UpdateEventLog("Quick Drop is OFF")	
		}

	}


	; Item binds use ALT
	; This is hardcoded.
	; Maybe in future updates if/when I get to update this to a higher level of enlightment the layout will be more flexible.
	; The reason the block is nested within the "Control Group" logic is because they share the same keys: qwaszx.
	; So ALT is the differentiator between control groups and items.
	if (keyPressed_LAlt) {

		if (b_EventLog) {
			UpdateEventLog("ITEM USED`nPhysical Key:`t" objCommand.physicalKey "`nLogical Key:  " objCommand.logicalKey "`nA_ThisHotkey: " A_ThisHotkey)	
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


	; -------------------
	; Control Group logic
	
	; Set control group
	if (keyPressed_LCtrl) {

		if (b_EventLog) {
			UpdateEventLog("CONTROL GROUP SET`nPhysical Key:`t" objCommand.physicalKey "`nLogical Key:  " objCommand.logicalKey "`nA_ThisHotkey: " A_ThisHotkey)	
		}	

		Send % "^" objCommand.logicalKey
		return
	}

	; Add to control group
	if (keyPressed_LShift) {
		
		if (b_EventLog) {
			UpdateEventLog("CONTROL GROUP ADD`nPhysical Key:`t" objCommand.physicalKey "`nLogical Key:  " objCommand.logicalKey "`nA_ThisHotkey: " A_ThisHotkey)	
		}

		Send % "+" objCommand.logicalKey
		return
	}


	; Select control group
	if (b_EventLog) {
		UpdateEventLog("CONTROL GROUP SELECT`nPhysical Key:`t" objCommand.physicalKey "`nLogical Key:  " objCommand.logicalKey "`nA_ThisHotkey: " A_ThisHotkey)	
	}

	Send % objCommand.logicalKey

	; See module_InstantCamera.ahk
	if (b_InstantCamera == 1) {
		InstantCamera(objCommand)	
	}
}