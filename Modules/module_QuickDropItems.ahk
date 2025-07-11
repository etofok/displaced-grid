;-----------------------------------------
; ----- QuickDrop Items
;-----------------------------------------
; Drop/Pass/Sell an item from your inventory to the target at mouse cursor: 
; a. place on the ground
; b. pass to a hero
; c. sell in a shop.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

;--------------------------------
; On program start...

Global m_QuickDropItems_menuLabel := "< Item QuickDrop >"

; Add this module to Tray only if it has been enabled in Settings
if (m_QuickDropItems.enabled == True) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_QuickDropItems.menuLabel := m_QuickDropItems_menuLabel ; but we can store it just in case

	Menu, Tray, Add, %m_QuickDropItems_menuLabel%, Toggle_m_QuickDropItems

	Control_m_QuickDropItems(1)
}

;-----------------------------------------
; QuickDrop Module
;-----------------------------------------

QuickDrop(objItem) {

	;MsgBox, % "objItem.x: " objItem.x "`nobjItem.y: " objItem.y 

	ItemX := objItem.x
	ItemY := objItem.y+15 ; somewhat below the coordinates so it clicks somewhere in the middle of the Item icon

	MouseGetPos, StartX, StartY	; remember where the mouse cursor is

	; if Shift
	if (keyPressed_LShift || keyPressed_RShift) {	
		MouseMove, ItemX, ItemY, 1
		Send {Blind}{Click Right}
		Sleep 50
		MouseMove, StartX, StartY, 1
		Sleep 50
		Send {Blind}{Shift Down}{Click}{Shift Up}

	; if No Shift
	} else {
		Send {Click Right}
		MouseMove, ItemX, ItemY, 1
		Send {Click Right}
		Sleep 30
		MouseMove, StartX, StartY, 1
		Send {Click}
	}

	Return
}

;--------------------------------
; QuickDropItems Control
;--------------------------------


Toggle_m_QuickDropItems() {
	Control_m_QuickDropItems(not m_QuickDropItems.active)
}

Control_m_QuickDropItems(switchTo) {

	m_QuickDropItems.active := switchTo

	ToggleCheckmark(m_QuickDropItems_menuLabel, switchTo)

	if (m_EventLog.active) {
		UpdateEventLog("Item QuickDrop  - " . switchTo)
	}
}