SetHotkeys(activateHotkeys) {

	; after many weeks of trying I gave up on trying to rebind modifiers (cascading issues, ahk v1 limitations, intercept.dll requires admin rights and a kernel-lvl install)

	hotkeysRemapped := activateHotkeys

	if (activateHotkeys == 1)
		activateHotkeys := "On"
	else
		activateHotkeys := "Off"

	; ----------------------------------------------------
	; Various keys.
	; ----------------------------------------------------

	set_object_LShift									:= Func("Hotkey_LShift")
	set_object_LCtrl									:= Func("Hotkey_LCtrl")
	set_object_LAlt										:= Func("Hotkey_LAlt")

	set_object_Capslock									:= Func("Hotkey_CapsLock")
	set_object_Tab										:= Func("Hotkey_Tab")

	set_object_Enter									:= Func("Hotkey_Enter")
	set_object_NumpadEnter								:= Func("Hotkey_NumpadEnter")

	set_object_RShift									:= Func("Hotkey_RShift")
	set_object_RCtrl									:= Func("Hotkey_RCtrl")
	set_object_RAlt										:= Func("Hotkey_RAlt")
	set_object_Menu										:= Func("Hotkey_Menu")


	if (m_RepeatMouse.active) {
		set_object_RButton									:= Func("Hotkey_RButton").bind(object_RButton)
		Hotkey % "*"object_RButton.physicalKey,				% set_object_RButton,		%activateHotkeys%	
	}

	if (m_HealthbarsAlwaysStay.active) {
		; intercept
		Hotkey % "*"object_LAlt.physicalKey,			% set_object_LAlt, 			%activateHotkeys% 
		Hotkey % "*"object_RAlt.physicalKey,			% set_object_RAlt, 			%activateHotkeys% 
	} else {
		; pass through
		Hotkey % "~*"object_LAlt.physicalKey,			% set_object_LAlt, 			%activateHotkeys% 
		Hotkey % "~*"object_RAlt.physicalKey,			% set_object_RAlt, 			%activateHotkeys% 
	}

	Hotkey % "~*"object_LShift.physicalKey,				% set_object_LShift, 		%activateHotkeys%
	Hotkey % "~*"object_LCtrl.physicalKey,				% set_object_LCtrl, 		%activateHotkeys%

	Hotkey % "*"object_Capslock.physicalKey,			% set_object_Capslock, 		%activateHotkeys%
	Hotkey % "*"object_Tab.physicalKey,					% set_object_Tab, 			%activateHotkeys%
	
	Hotkey % "*"object_Enter.physicalKey,				% set_object_Enter, 		%activateHotkeys%
	Hotkey % "*"object_NumpadEnter.physicalKey,			% set_object_NumpadEnter, 	%activateHotkeys%
	
	Hotkey % "~*"object_RShift.physicalKey,				% set_object_RShift,		%activateHotkeys%
	Hotkey % "~*"object_RCtrl.physicalKey,				% set_object_RCtrl, 		%activateHotkeys%
	Hotkey % "~*"object_Menu.physicalKey,				% set_object_Menu, 			%activateHotkeys%
	;Hotkey % "~*"upkey.physicalKey,					% set_upkey, 			%activateHotkeys%

	; ----------------------------------------------------
	; Select.

	set_SelectHero1									:= Func("Hotkey_bind").bind(SelectHero1)
	set_SelectHero2									:= Func("Hotkey_bind").bind(SelectHero2)
	set_SelectHero3									:= Func("Hotkey_bind").bind(SelectHero3)
	set_IdleWorker									:= Func("Hotkey_bind").bind(IdleWorker)
	set_JumpToEvent									:= Func("Hotkey_bind").bind(JumpToEvent)

	Hotkey % "*"SelectHero1.physicalKey,			% set_SelectHero1, 	%activateHotkeys%
	Hotkey % "*"SelectHero2.physicalKey,			% set_SelectHero2, 	%activateHotkeys%
	Hotkey % "*"SelectHero3.physicalKey,			% set_SelectHero3, 	%activateHotkeys%
	Hotkey % "*"IdleWorker.physicalKey,				% set_IdleWorker,	%activateHotkeys%
	Hotkey % "*"JumpToEvent.physicalKey,			% set_JumpToEvent,	%activateHotkeys%

	; ----------------------------------------------------
	; Control Groups. 
	;
	; Defaults are q w a s z x f1 f2 f3 f4 
	; -------------

	ControlGroup1_key								:= Func("Hotkey_bind").bind(ControlGroup1)
	ControlGroup2_key								:= Func("Hotkey_bind").bind(ControlGroup2)
	ControlGroup3_key								:= Func("Hotkey_bind").bind(ControlGroup3)
	ControlGroup4_key								:= Func("Hotkey_bind").bind(ControlGroup4)
	ControlGroup5_key								:= Func("Hotkey_bind").bind(ControlGroup5)
	ControlGroup6_key								:= Func("Hotkey_bind").bind(ControlGroup6)
	ControlGroup7_key								:= Func("Hotkey_bind").bind(ControlGroup7)
	ControlGroup8_key								:= Func("Hotkey_bind").bind(ControlGroup8)
	ControlGroup9_key								:= Func("Hotkey_bind").bind(ControlGroup9)
	ControlGroup0_key								:= Func("Hotkey_bind").bind(ControlGroup0)

	Hotkey % "*"ControlGroup1.physicalKey,			% ControlGroup1_key, %activateHotkeys%
	Hotkey % "*"ControlGroup2.physicalKey,			% ControlGroup2_key, %activateHotkeys%
	Hotkey % "*"ControlGroup3.physicalKey,			% ControlGroup3_key, %activateHotkeys%
	Hotkey % "*"ControlGroup4.physicalKey,			% ControlGroup4_key, %activateHotkeys%
	Hotkey % "*"ControlGroup5.physicalKey,			% ControlGroup5_key, %activateHotkeys%
	Hotkey % "*"ControlGroup6.physicalKey,			% ControlGroup6_key, %activateHotkeys%
	Hotkey % "*"ControlGroup7.physicalKey,			% ControlGroup7_key, %activateHotkeys%
	Hotkey % "*"ControlGroup8.physicalKey,			% ControlGroup8_key, %activateHotkeys%
	Hotkey % "*"ControlGroup9.physicalKey,			% ControlGroup9_key, %activateHotkeys%
	Hotkey % "*"ControlGroup0.physicalKey,			% ControlGroup0_key, %activateHotkeys%

	; -------------

	set_object_Up									:= Func("Hotkey_Up").bind(1)
	set_object_Down									:= Func("Hotkey_Down").bind(1)
	set_object_Left									:= Func("Hotkey_Left").bind(1)
	set_object_Right								:= Func("Hotkey_Right").bind(1)

	Hotkey % "*"object_Up.physicalKey,				% set_object_Up, %activateHotkeys%
	Hotkey % "*"object_Down.physicalKey,			% set_object_Down, %activateHotkeys%
	Hotkey % "*"object_Left.physicalKey,			% set_object_Left, %activateHotkeys%
	Hotkey % "*"object_Right.physicalKey,			% set_object_Right, %activateHotkeys%	

	set_object_Up_up								:= Func("Hotkey_Up").bind(0)
	set_object_Down_up								:= Func("Hotkey_Down").bind(0)
	set_object_Left_up								:= Func("Hotkey_Left").bind(0)
	set_object_Right_up								:= Func("Hotkey_Right").bind(0)

	Hotkey % "*"object_Up.physicalKey " Up",		% set_object_Up_up, %activateHotkeys%
	Hotkey % "*"object_Down.physicalKey " Up",		% set_object_Down_up, %activateHotkeys%
	Hotkey % "*"object_Left.physicalKey " Up",		% set_object_Left_up, %activateHotkeys%
	Hotkey % "*"object_Right.physicalKey " Up",		% set_object_Right_up, %activateHotkeys%

	; Since Items are on the same hotkeys as some of the Control Groups, we have to handle the logic inside the Hotkey_bind function.
	; Otherwise if I do bind 2 functions to the same key it doesn't understand which one to use.
	; or rather it would... 
	; BUT if we also BLOCK the Alt key (which we do to prevent healthbar toggles), then AHK will never "see" Alt+Key as something that has been pressed by the user. Which means we can't bind a function explicitly to Alt+Key.
	; anyway

	; ----------------------------------------------------
	; Command Card.
	;

	; We want this separate from the control groups

	; 1rd Row: Move Stop Hold Attack / Build T1 / Train units
	; D F G Space
	
	; 2rd Row: T2 / Miscellaneous
	; C V B N

	; 3rd Row: Use Abilities / Build T3, Shop / Research Upgrades
	; E R T 4
   	
	; Blizzard GRID
	; | 0,0 | 1,0 | 2,0 | 3,0 |
	; | 0,1 | 1,1 | 2,1 | 3,1 |
	; | 0,2 | 1,2 | 2,2 | 3,2 |
   	
   	set_GRID_00 									:= Func("Hotkey_CommandCard").bind(GRID_00)
   	set_GRID_10 									:= Func("Hotkey_CommandCard").bind(GRID_10)
   	set_GRID_20 									:= Func("Hotkey_CommandCard").bind(GRID_20)
    set_GRID_30 									:= Func("Hotkey_CommandCard").bind(GRID_30)

    set_GRID_01 									:= Func("Hotkey_CommandCard").bind(GRID_01)
    set_GRID_11 									:= Func("Hotkey_CommandCard").bind(GRID_11)
    set_GRID_21 									:= Func("Hotkey_CommandCard").bind(GRID_21)
    set_GRID_31 									:= Func("Hotkey_CommandCard").bind(GRID_31)

    set_GRID_02 									:= Func("Hotkey_CommandCard").bind(GRID_02)
    set_GRID_12 									:= Func("Hotkey_CommandCard").bind(GRID_12)
    set_GRID_22 									:= Func("Hotkey_CommandCard").bind(GRID_22)
    set_GRID_32 									:= Func("Hotkey_CommandCard").bind(GRID_32)

    Hotkey % "*"GRID_00.physicalKey, 				% set_GRID_00, %activateHotkeys%
    Hotkey % "*"GRID_10.physicalKey, 				% set_GRID_10, %activateHotkeys%
    Hotkey % "*"GRID_20.physicalKey, 				% set_GRID_20, %activateHotkeys%
    Hotkey % "*"GRID_30.physicalKey, 				% set_GRID_30, %activateHotkeys%

    Hotkey % "*"GRID_01.physicalKey, 				% set_GRID_01, %activateHotkeys%
    Hotkey % "*"GRID_11.physicalKey, 				% set_GRID_11, %activateHotkeys%
    Hotkey % "*"GRID_21.physicalKey, 				% set_GRID_21, %activateHotkeys%
    Hotkey % "*"GRID_31.physicalKey, 				% set_GRID_31, %activateHotkeys%

    Hotkey % "*"GRID_02.physicalKey, 				% set_GRID_02, %activateHotkeys%
    Hotkey % "*"GRID_12.physicalKey, 				% set_GRID_12, %activateHotkeys%
    Hotkey % "*"GRID_22.physicalKey, 				% set_GRID_22, %activateHotkeys%
    Hotkey % "*"GRID_32.physicalKey, 				% set_GRID_32, %activateHotkeys%

	; ----------------------------------------------------
	; Items.
	;
	; Defaults are Alt + q w a s z x
	; -------------


	/*
	 the reason I can't do 
	 Hotkey % "!" Item1.physicalKey,			% set_Item1, %activateHotkeys%
	 
	 is because I intercept ALT so it doesn't toggle the healthbars.
	 This means "!" will NEVER trigger.
	*/

	if (ItemsRequireAlt == 0) {
		set_Item1 								:= Func("Hotkey_Item").bind(Item1)
		set_Item2 								:= Func("Hotkey_Item").bind(Item2)
		set_Item3 								:= Func("Hotkey_Item").bind(Item3)
		set_Item4 								:= Func("Hotkey_Item").bind(Item4)
		set_Item5 								:= Func("Hotkey_Item").bind(Item5)
		set_Item6 								:= Func("Hotkey_Item").bind(Item6)

		Hotkey % "*"Item1.physicalKey,			% set_Item1, %activateHotkeys%
		Hotkey % "*"Item2.physicalKey,			% set_Item2, %activateHotkeys%
		Hotkey % "*"Item3.physicalKey,			% set_Item3, %activateHotkeys%
		Hotkey % "*"Item4.physicalKey,			% set_Item4, %activateHotkeys%
		Hotkey % "*"Item5.physicalKey,			% set_Item5, %activateHotkeys%
		Hotkey % "*"Item6.physicalKey,			% set_Item6, %activateHotkeys%
	}

}