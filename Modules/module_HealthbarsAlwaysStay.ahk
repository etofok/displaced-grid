;-----------------------------------------
; ----- HealthbarsAlwaysStay
;-----------------------------------------
; 
;
;-----------------------------------------
; I do believe this functionality SHOULD be a part of the core experience.
;-----------------------------------------

;--------------------------------
; On program start...

Global m_HealthbarsAlwaysStay_menuLabel := "< Healthbars Always Stay >"

; Add this module to Tray only if it has been enabled in Settings
if (m_HealthbarsAlwaysStay.enabled == True) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_HealthbarsAlwaysStay.menuLabel := m_HealthbarsAlwaysStay_menuLabel ; but we can store it just in case

	Menu, Tray, Add, %m_HealthbarsAlwaysStay_menuLabel%, Toggle_m_HealthbarsAlwaysStay

	Control_m_HealthbarsAlwaysStay(1)
}

;--------------------------------
; Module
;--------------------------------

; no code here.

; Alt-Tabbing is handled in Hotkey_Intercept.ahk
; Items with Alt are handled in Hotkey_Bind.ahk

;-----------------------------------------
; HealthbarsAlwaysStay Control
;-----------------------------------------

Toggle_m_HealthbarsAlwaysStay() {
	Control_m_HealthbarsAlwaysStay(not m_HealthbarsAlwaysStay.active)
} 


Control_m_HealthbarsAlwaysStay(switchTo) {

	m_HealthbarsAlwaysStay.active := switchTo
	
	ToggleCheckmark(m_HealthbarsAlwaysStay_menuLabel, switchTo)

	; have to reload here
	SetHotkeys(0)	
	SetHotkeys(1)

	if (m_EventLog.active) {
		UpdateEventLog("HealthbarsAlwaysStay - " . switchTo)
	}
}