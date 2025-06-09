SetHotkeys(activeOrNot) {

	if (activeOrNot == 1)
		activeOrNot := "On"
	else
		activeOrNot := "Off"

	; ----------------------------------------------------
	; Jump to Unique.
	;
	; Defaults are 1 2 3 for Heroes, 
	; 4 for Idle Worker
	; 5 for Jump to Recent Event
	; ----------------------------------------------------

	set_altkey										:= Func("Hotkey_LAlt").bind(altkey)
	set_ctrlkey										:= Func("Hotkey_LCtrl").bind(ctrlkey)
	set_shiftkey									:= Func("Hotkey_LShift").bind(shiftkey)
	set_capslockkey									:= Func("Hotkey_CapsLock").bind(capslockkey)
	set_tabkey										:= Func("Hotkey_Tab").bind(tabkey)

	if (b_PreventAltfromTogglingHealthbars) {
		Hotkey % "*"altkey.physicalKey,					% set_altkey, 		%activeOrNot% 
	} else {
		Hotkey % "~*"altkey.physicalKey,				% set_altkey, 		%activeOrNot% 
	}
	Hotkey % "~*"ctrlkey.physicalKey,				% set_ctrlkey, 		%activeOrNot%
	Hotkey % "~*"shiftkey.physicalKey,				% set_shiftkey,		%activeOrNot%
	Hotkey % "~*"tabkey.physicalKey,				% set_tabkey, 		%activeOrNot%
	Hotkey % "~*"capslockkey.physicalKey,			% set_capslockkey, 	%activeOrNot%

	set_SelectHero1									:= Func("Hotkey_bind").bind(SelectHero1)
	set_SelectHero2									:= Func("Hotkey_bind").bind(SelectHero2)
	set_SelectHero3									:= Func("Hotkey_bind").bind(SelectHero3)
	set_IdleWorker									:= Func("Hotkey_bind").bind(IdleWorker)
	set_JumpToEvent									:= Func("Hotkey_bind").bind(JumpToEvent)

	Hotkey % "*"SelectHero1.physicalKey,			% set_SelectHero1, 	%activeOrNot%
	Hotkey % "*"SelectHero2.physicalKey,			% set_SelectHero2, 	%activeOrNot%
	Hotkey % "*"SelectHero3.physicalKey,			% set_SelectHero3, 	%activeOrNot%
	Hotkey % "*"IdleWorker.physicalKey,				% set_IdleWorker,	%activeOrNot%
	Hotkey % "*"JumpToEvent.physicalKey,			% set_JumpToEvent,	%activeOrNot%

	; ----------------------------------------------------
	; Control Groups. 
	;
	; Defaults are qw as zx f1 f2 f3 f4 
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

	Hotkey % "*"ControlGroup1.physicalKey,			% ControlGroup1_key, %activeOrNot%
	Hotkey % "*"ControlGroup2.physicalKey,			% ControlGroup2_key, %activeOrNot%
	Hotkey % "*"ControlGroup3.physicalKey,			% ControlGroup3_key, %activeOrNot%
	Hotkey % "*"ControlGroup4.physicalKey,			% ControlGroup4_key, %activeOrNot%
	Hotkey % "*"ControlGroup5.physicalKey,			% ControlGroup5_key, %activeOrNot%
	Hotkey % "*"ControlGroup6.physicalKey,			% ControlGroup6_key, %activeOrNot%
	Hotkey % "*"ControlGroup7.physicalKey,			% ControlGroup7_key, %activeOrNot%
	Hotkey % "*"ControlGroup8.physicalKey,			% ControlGroup8_key, %activeOrNot%
	Hotkey % "*"ControlGroup9.physicalKey,			% ControlGroup9_key, %activeOrNot%
	Hotkey % "*"ControlGroup0.physicalKey,			% ControlGroup0_key, %activeOrNot%


	; Since Items are on the same hotkeys as some of the Control Groups, I have to handle the logic inside the Hotkey_bind function.
	; Otherwise if I do bind 2 functions to the same key it won't understand it.
	; or rather it would... BUT if I also BLOCK the Alt key (which I do), then AHK will never "see" Alt+Key as something that has been pressed by the user. Which means I can't bind a function explicitly to Alt+Key.
	
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

    Hotkey % "*"GRID_00.physicalKey, 				% set_GRID_00, %activeOrNot%
    Hotkey % "*"GRID_10.physicalKey, 				% set_GRID_10, %activeOrNot%
    Hotkey % "*"GRID_20.physicalKey, 				% set_GRID_20, %activeOrNot%
    Hotkey % "*"GRID_30.physicalKey, 				% set_GRID_30, %activeOrNot%

    Hotkey % "*"GRID_01.physicalKey, 				% set_GRID_01, %activeOrNot%
    Hotkey % "*"GRID_11.physicalKey, 				% set_GRID_11, %activeOrNot%
    Hotkey % "*"GRID_21.physicalKey, 				% set_GRID_21, %activeOrNot%
    Hotkey % "*"GRID_31.physicalKey, 				% set_GRID_31, %activeOrNot%

    Hotkey % "*"GRID_02.physicalKey, 				% set_GRID_02, %activeOrNot%
    Hotkey % "*"GRID_12.physicalKey, 				% set_GRID_12, %activeOrNot%
    Hotkey % "*"GRID_22.physicalKey, 				% set_GRID_22, %activeOrNot%
    Hotkey % "*"GRID_32.physicalKey, 				% set_GRID_32, %activeOrNot%

	; ----------------------------------------------------
	; Items.
	;
	; Defaults are Alt + q w a s z x
	; -------------


	/*
	 the reason I can't do Hotkey % "!" Item1.physicalKey,			% set_Item1, %activeOrNot%
	 is because I want to intercept ALT so it doesn't toggle the healthbars.
	 which means this will NEVER fire.
	*/

	/*
    set_Item1 								:= Func("Hotkey_Item").bind(Item1)
    set_Item2 								:= Func("Hotkey_Item").bind(Item2)
    set_Item3 								:= Func("Hotkey_Item").bind(Item3)
    set_Item4 								:= Func("Hotkey_Item").bind(Item4)
    set_Item5 								:= Func("Hotkey_Item").bind(Item5)
    set_Item6 								:= Func("Hotkey_Item").bind(Item6)

	Hotkey % "!"Item1.physicalKey,			% set_Item1, %activeOrNot%
	Hotkey % "!"Item2.physicalKey,			% set_Item2, %activeOrNot%
	Hotkey % "!"Item3.physicalKey,			% set_Item3, %activeOrNot%
	Hotkey % "!"Item4.physicalKey,			% set_Item4, %activeOrNot%
	Hotkey % "!"Item5.physicalKey,			% set_Item5, %activeOrNot%
	Hotkey % "!"Item6.physicalKey,			% set_Item6, %activeOrNot%
	*/

}