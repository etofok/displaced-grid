;-----------------------------------------
; ----- RepeatMouse
;-----------------------------------------
; 
;--------------------------------
; On program start...

Global m_RepeatMouse_menuLabel := "< Repeat Mouse >"

; Add this module to Tray only if it has been enabled in Settings
if (m_RepeatMouse.enabled == True) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_RepeatMouse.menuLabel := m_RepeatMouse_menuLabel ; but we can store it just in case

	Menu, Tray, Add, %m_RepeatMouse_menuLabel%, Toggle_m_RepeatMouse

	Control_m_RepeatMouse(1)
}

;--------------------------------
; Module
;--------------------------------


;-----------------------------------------
; RepeatMouse Control
;-----------------------------------------

Toggle_m_RepeatMouse() {
	Control_m_RepeatMouse(not m_RepeatMouse.active)
} 


Control_m_RepeatMouse(switchTo) {

	m_RepeatMouse.active := switchTo
	
	ToggleCheckmark(m_RepeatMouse_menuLabel, switchTo)

	; have to reload here
	SetHotkeys(0)	
	SetHotkeys(1)

	if (m_EventLog.active) {
		UpdateEventLog("RepeatMouse - " . switchTo)
	}
}



Hotkey_RButton(objCommand) {

	keyPressed_RButton := 1

	; send immediately
	temp_physicalKey := objCommand.physicalKey
	temp_ingameHotkey := objCommand.ingameHotkey

	if (keyPressed_LShift || keyPressed_RShift) {
		Send {Blind}{Shift Down}%temp_ingameHotkey%{Shift Up}
	} else {
		Send {Blind}%temp_ingameHotkey%
	}

	if (m_EventLog.active) {
		UpdateEventLog("RButton Pressed")
	}

	MouseGetPos, mx, my

	; Check if clicked INSIDE inventory
	if (mx >= InventoryStartX && mx <= InventoryEndX && my >= InventoryStartY && my <= InventoryEndY) {
		; Inside: send once
		; already sent
	} else {
		; Outside: repeat
		while (GetKeyState(temp_physicalKey, "P")) {

			Sleep, 100

			if ((GetKeyState(temp_physicalKey, "P"))) {
				if (keyPressed_LShift || keyPressed_RShift) {
					Send {Blind}{Shift Down}%temp_ingameHotkey%{Shift Up}
				} else {
					Send {Blind}%temp_ingameHotkey%
				}
			}
		}
	}

	KeyWait, % temp_physicalKey

	if (m_EventLog.active) {
		UpdateEventLog("RButton Released")
	}

	keyPressed_RButton := 0
}

