SetHotkeys(activateHotkeys) {

	hotkeysRemapped := activateHotkeys

	if (activateHotkeys == 1)
		activateHotkeys := "On"
	else
		activateHotkeys := "Off"


	; ----------------------------------------------------
	; Various keys.
	; ----------------------------------------------------

	set_laltkey										:= Func("Hotkey_LAlt").bind(laltkey)
	set_raltkey										:= Func("Hotkey_RAlt").bind(raltkey)
	set_ctrlkey										:= Func("Hotkey_LCtrl").bind(ctrlkey)
	set_shiftkey									:= Func("Hotkey_LShift").bind(shiftkey)
	set_capslockkey									:= Func("Hotkey_CapsLock").bind(capslockkey)
	set_tabkey										:= Func("Hotkey_Tab").bind(tabkey)
	set_enterkey									:= Func("Hotkey_Enter").bind(enterkey)
	set_numpadenterkey								:= Func("Hotkey_NumpadEnter").bind(numpadenterkey)
	set_upkey										:= Func("Hotkey_Up").bind(upkey)
	set_mouse2key									:= Func("Hotkey_Mouse").bind(mouse2key)

	if (m_HealthbarsAlwaysStay.active) {
		; intercept
		Hotkey % "*"laltkey.physicalKey,			% set_laltkey, 			%activateHotkeys% 
		Hotkey % "*"raltkey.physicalKey,			% set_raltkey, 			%activateHotkeys% 
	} else {
		; pass through
		Hotkey % "~*"laltkey.physicalKey,			% set_laltkey, 			%activateHotkeys% 
		Hotkey % "~*"raltkey.physicalKey,			% set_raltkey, 			%activateHotkeys% 
	}
	Hotkey % "~*"ctrlkey.physicalKey,				% set_ctrlkey, 			%activateHotkeys%
	Hotkey % "~*"shiftkey.physicalKey,				% set_shiftkey,			%activateHotkeys%
	Hotkey % "*"capslockkey.physicalKey,			% set_capslockkey, 		%activateHotkeys%

	Hotkey % "*"tabkey.physicalKey,					% set_tabkey, 			%activateHotkeys%
	Hotkey % "*"enterkey.physicalKey,				% set_enterkey, 		%activateHotkeys%
	Hotkey % "*"numpadenterkey.physicalKey,			% set_numpadenterkey, 	%activateHotkeys%

	Hotkey % "~*"upkey.physicalKey,					% set_upkey, 			%activateHotkeys%

	Hotkey % "*"mouse2key.physicalKey,				% set_mouse2key,		%activateHotkeys%
	

	; ----------------------------------------------------
	; Select.
	;
	; Defaults are 1 2 3 for Heroes, 
	; 4 for Idle Worker
	; 5 for Jump to Recent Event
	; ----------------------------------------------------

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