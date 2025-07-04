;-----------------------------------------
; ----- C O M M A N D - A L L - U N I T S -
;-----------------------------------------
;
; Hold CapsLock to issue a command to all the units assigned to "unifiedOrders" control groups.
;
; This is A VERY OBVIOUS to anyone macro.
;
; This module loops through the designated 'Army' control groups to execute the action for each group.
; It loops from bottom up so that the first group is selected at the end of the cycle.
;
; Extremely useful to issue attacks and move commands for the entire army.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------


;--------------------------------
; On program start...

Global m_UnifiedOrders_menuLabel := "< Unified Orders >"
Global m_UnifiedOrders_menuLabel_extra := " "

; Add this module to Tray only if it has been enabled in Settings



if (m_UnifiedOrders.enabled == True) {

	Global UnifiedGroups := []
	Global UnifiedGroups_count := 0

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_UnifiedOrders.menuLabel := m_UnifiedOrders_menuLabel

	cnt := 0

	for index, gr in a_ControlGroups {
	    if (gr.unifiedOrders == 1 || gr.unifiedOrders == True) {
	    	cnt++
	    	tmpup := gr.physicalKey

	    	StringUpper, tmpup, tmpup
	    	m_UnifiedOrders_menuLabel_extra := m_UnifiedOrders_menuLabel_extra . " [" . tmpup . "]"
	    }
	}

	if (cnt = 0) {
		m_UnifiedOrders_menuLabel := m_UnifiedOrders_menuLabel . m_UnifiedOrders_menuLabel_extra . "none"
	} else {
		m_UnifiedOrders_menuLabel := m_UnifiedOrders_menuLabel . m_UnifiedOrders_menuLabel_extra
	}

	Menu, Tray, Add, %m_UnifiedOrders_menuLabel%, Toggle_m_UnifiedOrders

	SetUnifiedGroups()
	Control_m_UnifiedOrders(1)
}

;-----------------------------------------
; Capslock Right Click to Order Right Click
;-----------------------------------------

; hardcoded right click to this because I'm really tired of this already
; this allows us to hold down capslock as a modifier and command groups with right click as well
If (false) {

	#If keyPressed_CapsLock && m_UnifiedOrders.active
		
		*RButton:: 

			UnifiedOrders(mouse2key)

		return

	#If
}

;-----------------------------------------
; On program start...



;-----------------------------------------
; Module Control

SetUnifiedGroups() {

	; once per app initialization we create a sub group of ControlGroups
	; this group contains ONLY the groups flagged with .unifiedOrders in Settings

	Loop, % a_ControlGroups.MaxIndex() {

		; we're going to populate this subgroup from last to first
		; this is because we want to loop groups from back to front, 
		; so that at the end of the cycle we end up with our 'main' group 1
	   	i := a_ControlGroups.MaxIndex() - A_Index
	   
		if (a_ControlGroups[i].unifiedOrders) {
			UnifiedGroups.push(a_ControlGroups[i])
	    }
	}
	
	UnifiedGroups_count := UnifiedGroups.MaxIndex()
}

UnifiedOrders(objCommand) {

	if (m_EventLog.active) {
		UpdateEventLog("UnifiedOrders: " objCommand.ingameHotkey)
	}

	Loop, % UnifiedGroups_count {

		; we cycle forwards because the group has already been populated backwards
        Send % UnifiedGroups[A_Index].ingameHotkey

        ; account for shift-queue
        if (keyPressed_LShift) {
        	Send % "{Shift Down}"objCommand.ingameHotkey
    	} else {
	        Send % objCommand.ingameHotkey
		}
	}
}

;-----------------------------------------
; UnifiedOrders Control
;-----------------------------------------

Toggle_m_UnifiedOrders() {
	Control_m_UnifiedOrders(not m_UnifiedOrders.active)
} 

Control_m_UnifiedOrders(switchTo) {

	m_UnifiedOrders.active := switchTo
	
	ToggleCheckmark(m_UnifiedOrders_menuLabel, switchTo)

	if (m_EventLog.active) {
		UpdateEventLog("Unified Orders - " . switchTo)	
	}
}