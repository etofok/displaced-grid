Hotkey_LAlt() {

	keyPressed_LAlt = 1
	if (b_EventLog) {
		UpdateEventLog("LAlt Pressed")
	}

	; we intercept and BLOCK the Alt key so that it doesn't toggle off healthbars.

	KeyWait, LAlt

	; this is very much needed because we intercept and block Alt.
	; this means while Warcraft 3 is active the Alt cannot be activated
	; this is great, because Alt no longer toggles of our healthbars in-game. Especially great, because we use Alt for Items.
	; this is bad, because when Alt is blocked, we can't Alt-tab, which sucks massively.
	; the code below listens to Alt and allows us to "simulate" Alt-Tabbing.
	if (b_PreventAltfromTogglingHealthbars) {
		if (A_PriorKey == "Tab") {
			SendInput {Blind}{Alt Up}
		}
	}

	keyPressed_LAlt = 0
	if (b_EventLog) {
		UpdateEventLog("LAlt Released")
	}
}


; this doesn't nothing but allows us to flag LCtrl and log it
Hotkey_LCtrl() {

	keyPressed_LCtrl = 1
	if (b_EventLog) {
		UpdateEventLog("LCtrl Pressed")
	}

	KeyWait, LCtrl

	keyPressed_LCtrl = 0
	if (b_EventLog) {
		UpdateEventLog("LCTRL Released")
	}
}

; this doesn't nothing but allows us to flag LShift and log it
Hotkey_LShift() {

	keyPressed_LShift = 1
	if (b_EventLog) {
		UpdateEventLog("LShift Pressed")
	}

	KeyWait, LShift

	keyPressed_LShift = 0
	if (b_EventLog) {
		UpdateEventLog("LShift Released")
	}
}

; this doesn't nothing but allows us to flag CapsLock and log it
; I also desided to "block" the key entirely, so that Capslock has no effect while Warcraft3 is in focus. Who cares about Capslock?
; CapsLock is "listenned to" so that we can use it as a modifier for CommandAllGroups
Hotkey_CapsLock() {

	keyPressed_CapsLock = 1
	if (b_EventLog) {
		UpdateEventLog("CapsLock Pressed")
	}

	KeyWait, CapsLock

	keyPressed_CapsLock = 0
	if (b_EventLog) {
		UpdateEventLog("CapsLock Released")
	}
}


Hotkey_Tab() {

	keyPressed_Tab = 1
	if (b_EventLog) {
		UpdateEventLog("Tab Pressed")
	}
	
	; this is very much needed because we intercept and block Alt.
	; this means while Warcraft 3 is active the Alt cannot be activated
	; this is great, because Alt no longer toggles of our healthbars in-game. Especially great, because we use Alt for Items.
	; this is bad, because when Alt is blocked, we can't Alt-tab, which sucks massively.
	; the code below listens to Alt and allows us to "simulate" Alt-Tabbing.
	if (b_PreventAltfromTogglingHealthbars) {
		if (GetKeyState("Alt", "P") ) {
			UpdateEventLog("Try Alt Tab...")
			SendInput {Blind}{Alt Down}
			SendInput {Blind}{Tab Down}
		}
	}

	KeyWait, Tab

	keyPressed_Tab = 0
	if (b_EventLog) {
		UpdateEventLog("Tab Released")
	}
}
