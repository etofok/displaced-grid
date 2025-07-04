;-----------------------------------------
; ----- ShiftQueue Items
;-----------------------------------------
;
; This module allows the player to use items and abilities keys while holding Shift.
;
; By default, the user has to let go of the Shift key in order to activate an item hotkey.
; By default, the user has to left-click to Shift-queue abilities (minor, but not the user can use the hotkey as well)
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

;--------------------------------
; On program start...

Global m_ShiftQueueItems_menuLabel := "< Item Shift-Queue >"

; Add this module to Tray only if it has been enabled in Settings
if (m_ShiftQueueItems.enabled == True) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_ShiftQueueItems.menuLabel := m_ShiftQueueItems_menuLabel ; but we can store it just in case

	Menu, Tray, Add, %m_ShiftQueueItems_menuLabel%, Toggle_m_ShiftQueueItems

	Control_m_ShiftQueueItems(1)
}

;-----------------------------------------
; ShiftQueueItems Module
;-----------------------------------------

; This module affects the CORE hotkey processing modules 

;--------------------------------
; ShiftQueueItems Control
;--------------------------------

Toggle_m_ShiftQueueItems() {
	Control_m_ShiftQueueItems(not m_ShiftQueueItems.active)
} 


Control_m_ShiftQueueItems(switchTo) {

	m_ShiftQueueItems.active := switchTo
	
	ToggleCheckmark(m_ShiftQueueItems_menuLabel, switchTo)

	if (m_EventLog.active) {
		UpdateEventLog("Item Shift-Queue - " . switchTo)	
	}
}