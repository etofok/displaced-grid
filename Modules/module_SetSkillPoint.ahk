;-----------------------------------------
; ----- Set Skill Point
;-----------------------------------------
;
; Set Skill Point with CTRL + Ability Key
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------


;--------------------------------
; On program start...

Global m_SetSkillPoint_menuLabel := "< Set Skill Point >"

; Add this module to Tray only if it has been enabled in Settings
if (m_SetSkillPoint.enabled == True) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_SetSkillPoint.menuLabel := m_SetSkillPoint_menuLabel ; but we can store it just in case

	Menu, Tray, Add, %m_SetSkillPoint_menuLabel%, Toggle_m_SetSkillPoint

	Control_m_SetSkillPoint(1)
}


;-----------------------------------------
; Module logic

; Set Skill Point with CTRL + Ability Key
SetSkillPoint(objCommand) {

	if (m_EventLog.enabled)
		UpdateEventLog("SetSkillPoint..." . objCommand.ingameHotkey)

		;CTRL ability has to work for the bottom row and the top row
	; Ability 1
	if (objCommand.ingameHotkey == GRID_02.ingameHotkey || objCommand.ingameHotkey == GRID_00.ingameHotkey) {
		Send % GRID_31.ingameHotkey ; Hero Abilities Menu
		Sleep, 100
		Send % GRID_00.ingameHotkey ; Ability 1 in Hero Abilities Menu

		if (m_EventLog.active) {
			UpdateEventLog("CTRL + Ability 4")
		}

		return	
	}

	; Ability 2
	if (objCommand.ingameHotkey == GRID_12.ingameHotkey || objCommand.ingameHotkey == GRID_10.ingameHotkey) {
		Send % GRID_31.ingameHotkey ; Hero Abilities Menu
		Sleep, 100
		Send % GRID_10.ingameHotkey ; Ability 2 in Hero Abilities Menu

		if (m_EventLog.active) {
			UpdateEventLog("CTRL + Ability 4")
		}

		return	
	}

	; Ability 3
	if (objCommand.ingameHotkey == GRID_22.ingameHotkey || objCommand.ingameHotkey == GRID_20.ingameHotkey) {
		Send % GRID_31.ingameHotkey ; Hero Abilities Menu
		Sleep, 100
		Send % GRID_20.ingameHotkey ; Ability 3 in Hero Abilities Menu

		if (m_EventLog.active) {
			UpdateEventLog("CTRL + Ability 4")
		}

		return	
	}

	; Ability 4
	if (objCommand.ingameHotkey == GRID_32.ingameHotkey || objCommand.ingameHotkey == GRID_30.ingameHotkey) {
		Send % GRID_31.ingameHotkey ; Hero Abilities Menu
		Sleep, 100
		Send % GRID_30.ingameHotkey ; Ability 4 in Hero Abilities Menu

		if (m_EventLog.active) {
			UpdateEventLog("CTRL + Ability 4")
		}

		return	
	}

}


;-----------------------------------------
; SetSkillPoint Control
;-----------------------------------------

Toggle_m_SetSkillPoint() {
	Control_m_SetSkillPoint(not m_SetSkillPoint.active)
}

Control_m_SetSkillPoint(switchTo) {

	m_SetSkillPoint.active := switchTo
	
	ToggleCheckmark(m_SetSkillPoint_menuLabel, switchTo)

	if (m_EventLog.active) {
		UpdateEventLog("Set Skill Point - " . switchTo)
	}
}