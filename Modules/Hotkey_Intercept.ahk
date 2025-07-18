; this file is responsible for new bevahiors of all intercepted keys
; keys are intercepted in SetHotkeys.ahk
; this is necessary to 'listen' to keystrokes and attack our desired behavior to them

; these functions fire ONLY when a layout is loaded


Hotkey_LAlt() {

	keyPressed_LAlt = 1
	if (m_EventLog.active) {
		UpdateEventLog("LAlt Pressed")
	}

	; here we intercept and BLOCK the Alt key so that it doesn't toggle off healthbars.

	; on LAlt key resease...
	;KeyWait, LAlt
	KeyWait, % object_LAlt.physicalKey


	; this is very much needed because we intercept and block Alt.
	; this means while Warcraft 3 is active the Alt cannot be activated
	; this is great, because Alt no longer toggles of our healthbars in-game. Especially great, because we use Alt for Items.
	; this is bad, because when Alt is blocked, we can't Alt-tab, which sucks massively.
	; the code below listens to Alt and allows us to "simulate" Alt-Tabbing.
	if (A_PriorKey == "Tab") {
		Send {Blind}{Alt Up}
	}

	; this handles Alt+Enter combo
	if (A_PriorKey == "Enter" || A_PriorKey == "NumpadEnter" ) {
		if (m_EventLog.active) {
			UpdateEventLog("[Alt + Enter]")
		}
		Send {Blind}{Alt Up}
	}

	keyPressed_LAlt = 0
	if (m_EventLog.active) {
		UpdateEventLog("LAlt Released")
	}
}


Hotkey_RAlt() {

	keyPressed_RAlt = 1
	if (m_EventLog.active) {
		UpdateEventLog("RAlt Pressed")
	}

	; here we intercept and BLOCK the Alt key so that it doesn't toggle off healthbars.

	; on RAlt key resease...
	;KeyWait, RAlt
	KeyWait, % object_RAlt.physicalKey

	; this is very much needed because we intercept and block Alt.
	; this means while Warcraft 3 is active the Alt cannot be activated
	; this is great, because Alt no longer toggles of our healthbars in-game. Especially great, because we use Alt for Items.
	; this is bad, because when Alt is blocked, we can't Alt-tab, which sucks massively.
	; the code below listens to Alt and allows us to "simulate" Alt-Tabbing.
	if (A_PriorKey == "Tab") {
		Send {Blind}{Alt Up}
	}

	; this handles Alt+Enter combo
	if (A_PriorKey == "Enter" || A_PriorKey == "NumpadEnter" ) {
		if (m_EventLog.active) {
			UpdateEventLog("[Alt + Enter]")
		}
		Send {Blind}{Alt Up}
	}

	keyPressed_RAlt = 0
	if (m_EventLog.active) {
		UpdateEventLog("RAlt Released")
	}
}


Hotkey_LCtrl() {

	keyPressed_LCtrl = 1
	if (m_EventLog.active) {
		UpdateEventLog("LCtrl Pressed")
	}

	KeyWait, % object_LCtrl.physicalKey

	keyPressed_LCtrl = 0
	if (m_EventLog.active) {
		UpdateEventLog("LCtrl Released")
	}
}

Hotkey_RCtrl() {

	keyPressed_RCtrl = 1
	if (m_EventLog.active) {
		UpdateEventLog("RCtrl Pressed")
	}

	KeyWait, % object_RCtrl.physicalKey

	keyPressed_RCtrl = 0
	if (m_EventLog.active) {
		UpdateEventLog("RCtrl Released")
	}
}



Hotkey_LShift() {

	keyPressed_LShift = 1
	if (m_EventLog.active) {
		UpdateEventLog("LShift Pressed")
	}

	KeyWait, % object_LShift.physicalKey

	keyPressed_LShift = 0
	if (m_EventLog.active) {
		UpdateEventLog("LShift Released")
	}
}

Hotkey_RShift() {

	keyPressed_RShift = 1
	if (m_EventLog.active) {
		UpdateEventLog("RShift Pressed")
	}

	KeyWait, % object_RShift.physicalKey

	keyPressed_RShift = 0
	if (m_EventLog.active) {
		UpdateEventLog("RShift Released")
	}
}


Hotkey_Tab() {
    static keyPressed_Tab := false

    if (keyPressed_Tab)
        return

    keyPressed_Tab := true

    if (m_EventLog.active) {
        UpdateEventLog("Tab Pressed")
    }

    if (keyPressed_LAlt || keyPressed_RAlt) {
        if (m_EventLog.active) {
            UpdateEventLog("ALT + TAB")
        }
        Send {Blind}{Alt Down}
        Send {Blind}{Tab Down}
        keyPressed_Tab := false
        return
    }

    ; Send initial Tab press immediately
    Send {Blind}{Tab}

    ; initial delay but exit early if Tab is released
    Loop 20 {  ; 20 * 10ms = 200ms
        Sleep 10
        if !GetKeyState("Tab", "P") {
            keyPressed_Tab := false
            if (m_EventLog.active) {
                UpdateEventLog("Tab Released early (no repeat)")
            }
            return
        }
    }

    ; Repeat while Tab is held down
    while GetKeyState(object_Tab.physicalKey, "P") {
        Send {Blind}{Tab}
        Sleep 50
    }

	KeyWait, % object_Tab.physicalKey

    keyPressed_Tab := false

    if (m_EventLog.active) {
        UpdateEventLog("Tab Released after repeat")
    }
}


Hotkey_Menu() {

	keyPressed_Menu = 1
	if (m_EventLog.active) {
		UpdateEventLog("Menu Pressed")
	}
	
	KeyWait, % object_Menu.physicalKey

	keyPressed_Menu = 0
	if (m_EventLog.active) {
		UpdateEventLog("Menu Released")
	}
}

	


; this does nothing but allows us to flag CapsLock and log it
; I also desided to "block" the key entirely, so that Capslock has no effect while Warcraft3 is in focus
; CapsLock is "listenned to" so that we can use it as a modifier for UnifiedOrders
Hotkey_CapsLock() {
	keyPressed_CapsLock = 1
	if (m_EventLog.active) {
		UpdateEventLog("CapsLock Pressed")
	}

	KeyWait, % object_Capslock.physicalKey

	keyPressed_CapsLock = 0
	if (m_EventLog.active) {
		UpdateEventLog("CapsLock Released")
	}
}


Hotkey_Enter() {

	keyPressed_Enter = 1
	if (m_EventLog.active) {
		UpdateEventLog("Enter Pressed")
	}

	; this is needed because we intercept and block Alt.
	if (keyPressed_LAlt || keyPressed_RAlt) {
		if (m_EventLog.active) {
			UpdateEventLog("[Alt + Enter]")
		}
		Send {Blind}{Alt Down}
		Send {Blind}{Enter Down}
	}

	; emulate the key
	Send {Blind}{Enter Down}

	; for the release
	KeyWait, % object_Enter.physicalKey

	Send {Blind}{Enter Up}

	keyPressed_Enter = 0
	if (m_EventLog.active) {
		UpdateEventLog("Enter Released")
	}
}

Hotkey_NumpadEnter() {

	keyPressed_NumpadEnter = 1
	if (m_EventLog.active) {
		UpdateEventLog("NumpadEnter Pressed")
	}

	; this is needed because we intercept and block Alt.
	if (keyPressed_LAlt || keyPressed_RAlt) {
		if (m_EventLog.active) {
			UpdateEventLog("[Alt + Enter]")
		}
		Send {Blind}{Alt Down}
		Send {Blind}{NumpadEnter Down}
	}

	; emulate the key
	Send {Blind}{NumpadEnter Down}

	; wait for the release
	KeyWait, % object_NumpadEnter.physicalKey

	Send {Blind}{NumpadEnter Up}

	keyPressed_NumpadEnter = 0
	if (m_EventLog.active) {
		UpdateEventLog("NumpadEnter Released")
	}
}


Hotkey_Up() {

	keyPressed_Up = 1
	if (m_EventLog.active) {
		UpdateEventLog("Up Pressed")
	}
	
	KeyWait, % object_Up.physicalKey

	keyPressed_Up = 0
	if (m_EventLog.active) {
		UpdateEventLog("Up Released")
	}
}