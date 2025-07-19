;-----------------------------------------
; Here lie the labels that I can't include into modules, because modules are loaded in the autorun section
; it's not elegant and I'm aware. just another gay ahk v1 thing



; this is to capture Press Any Key... for setting up user hotkeys
; in AHK v1 SetTimer only works with labels, so this needs to be a label
; and I can't put a label into SettingsGUI.ahk because it loads in the autolaunch section
_WatchForKeyPress:
    Loop {
        KeyList := "A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|" ; letters
                 . "0|1|2|3|4|5|6|7|8|9|"
                 . "F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|"
                 . "Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|"
                 . "NumpadDot|NumpadEnter|NumpadAdd|NumpadSub|NumpadMult|NumpadDiv|"
                 . "ScrollLock|CapsLock|Pause|Insert|Delete|Home|End|PgUp|PgDn|"
                 . "Up|Down|Left|Right|Tab|Enter|Escape|Space|Backspace|PrintScreen"

        Loop, Parse, KeyList, |
        {
            if GetKeyState(A_LoopField, "P") {
                SetTimer, _WatchForKeyPress, Off
                DynamicHotkey_Capture(A_LoopField)
                return
            }
        }
    }
return

RepeatHotkeyLoop:
    if (!repeatTimerActive || !repeatDelayTimerFired)
        return

    if (!GetKeyState(repeatKey, "P")) {
        SetTimer, RepeatHotkeyLoop, Off
        repeatTimerActive := false
        return
    }

    MouseGetPos, mx, my
    if (mx >= InventoryStartX && mx <= InventoryEndX && my >= InventoryStartY && my <= InventoryEndY) {
        SetTimer, RepeatHotkeyLoop, Off
        repeatTimerActive := false
        return
    }

    if (keyPressed_LShift)
        Send {Blind}{Shift Down}%repeatHotkey%{Shift Up}
    else
        Send {Blind}%repeatHotkey%
return


StartRepeatLoop:
    if (!repeatTimerActive)
        return
    repeatDelayTimerFired := true
    SetTimer, RepeatHotkeyLoop, 100
return




On_GUI_m_QuickcastItemsToggle:

    global GUI_m_QuickCastItems_enabled, GUI_Item1_quickcast, GUI_Item2_quickcast, GUI_Item3_quickcast, GUI_Item4_quickcast, GUI_Item5_quickcast, GUI_Item6_quickcast

    GuiControlGet, isChecked,, GUI_m_QuickCastItems_enabled

    if (isChecked) {
        GuiControl, gui_Settings: -Disabled, GUI_Item1_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item2_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item3_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item4_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item5_quickcast
        GuiControl, gui_Settings: -Disabled, GUI_Item6_quickcast
    } else {
        GuiControl, gui_Settings: +Disabled, GUI_Item1_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item2_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item3_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item4_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item5_quickcast
        GuiControl, gui_Settings: +Disabled, GUI_Item6_quickcast
    }
return