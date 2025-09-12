;-----------------------------------------
; ----- Event Log
;-----------------------------------------
;
; This is an internal module to see what the program reads and does
;
;-----------------------------------------


;--------------------------------
; On program start...

Global m_EventLog_menuLabel := "< EventLog >"

; Add this module to Tray only if it has been enabled in Settings
if (m_EventLog.enabled) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_EventLog.menuLabel := m_EventLog_menuLabel ; but we can store it just in case

	Menu, Tray, Add, %m_EventLog_menuLabel%, Toggle_m_EventLog

	m_EventLog.marginTop 		:= 60
	m_EventLog.width 			:= 220
	m_EventLog.lineHeight 		:= 40

	Global pAlert1 := ""
	Global pAlert2 := ""
	Global pAlert3 := ""
	Global pAlert4 := ""
	Global pAlert5 := ""
	Global pAlert6 := ""
	Global pAlert7 := ""
	Global pAlert8 := ""
	Global pAlert9 := ""
	Global pAlert10 := ""
	Global pAlert11 := ""
	Global pAlert12 := ""

	Gui, gui_AlertBox:+LastFound -Caption -Border +ToolWindow +Owner%winID%

	Gui, gui_AlertBox:Color, 0xFFFFFF
	Gui, gui_AlertBox:Color, %color%
	Gui, gui_AlertBox:margin, 10, 10

	Gui, gui_AlertBox: Add, Text,, Event Log:


	; couldn't figure this out
	; Gui, gui_AlertBox: Add, Text, % "w"m_EventLog.width "h"m_EventLog.lineHeight, % vAlert1

	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert1
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert2
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert3
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert4
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert5
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert6
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert7
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert8
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert9
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert10
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert11
	Gui, gui_AlertBox:Add, Text, w220 h40 vAlert12

	WinSet, TransColor, %color% 222, % gui_AlertBox ; PNG transparency. 0 = fully transparent
	WinSet, ExStyle, +0x20, % gui_AlertBox	; Click-through

	if WinExist(winClass) {
		Control_m_EventLog(1)
	} else {
		Control_m_EventLog(0)
	}
}

;-----------------------------------------
; EventLog Module
;-----------------------------------------

UpdateEventLog(message) {

	if (pAlert11 != "") {
		pAlert12 := pAlert11
	}	

	if (pAlert10 != "") {
		pAlert11 := pAlert10
	}

	if (pAlert9 != "") {
		pAlert10 := pAlert9
	}

	if (pAlert8 != "") {
		pAlert9 := pAlert8
	}

	if (pAlert7 != "") {
		pAlert8 := pAlert7
	}

	if (pAlert6 != "") {
		pAlert7 := pAlert6
	}

	if (pAlert5 != "") {
		pAlert6 := pAlert5
	}

	if (pAlert4 != "") {
		pAlert5 := pAlert4
	}

	if (pAlert3 != "") {
		pAlert4 := pAlert3
	}

	if (pAlert2 != "") {
		pAlert3 := pAlert2
	}

	if (pAlert1 != "") {
		pAlert2 := pAlert1	
	}

	pAlert1 := message

	GuiControl, gui_AlertBox:, Alert1, % pAlert1
	GuiControl, gui_AlertBox:, Alert2, % pAlert2
	GuiControl, gui_AlertBox:, Alert3, % pAlert3
	GuiControl, gui_AlertBox:, Alert4, % pAlert4
	GuiControl, gui_AlertBox:, Alert5, % pAlert5
	GuiControl, gui_AlertBox:, Alert6, % pAlert6
	GuiControl, gui_AlertBox:, Alert7, % pAlert7
	GuiControl, gui_AlertBox:, Alert8, % pAlert8
	GuiControl, gui_AlertBox:, Alert9, % pAlert9
	GuiControl, gui_AlertBox:, Alert10, % pAlert10
	GuiControl, gui_AlertBox:, Alert11, % pAlert11
	GuiControl, gui_AlertBox:, Alert12, % pAlert12
	
}

;-----------------------------------------
; EventLog Control
;-----------------------------------------

Toggle_m_EventLog() {

	if (m_EventLog.active == 1) {

		Control_m_EventLog(0)

	} else {
		; only toggle on if the Warcraft III window exists
		if WinExist(winClass) {
			Control_m_EventLog(1)
		} else {
			Control_m_EventLog(0)
			;MsgBox, % error_warcraftNotFound ;"`n`n (Attempt to activate Event Log)"
		}
	}
} 


Control_m_EventLog(switchTo) {

	if (switchTo == 1) {
		Gui, gui_AlertBox:Show, % "x" (A_ScreenWidth-m_EventLog.width) " y" (50) 
	} else {
		Gui, gui_AlertBox:Hide
	}

	m_EventLog.active := switchTo
	
	ToggleCheckmark(m_EventLog_menuLabel, switchTo)

	if (m_EventLog.active) {
		UpdateEventLog("EventLog - " . switchTo)	
	}
}