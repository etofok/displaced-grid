;-------------------------------------------
; This file contains the default Blizzard Grid layout for English keyboard
; You can load this layout to EMULATE playing on 'default' hotkeys.
; This would enable you to use DisplacedGrid modules


layout_BlizzardGrid() {

	layoutName	 				:= 	"BlizzardGrid"

	SelectHero1.physicalKey		:= 	"f1"
	SelectHero2.physicalKey		:= 	"f2"
	SelectHero3.physicalKey		:= 	"f3"
	IdleWorker.physicalKey		:=	"f8"
	JumpToEvent.physicalKey		:=	"Space"

	ControlGroup1.physicalKey	:=	"1"
	ControlGroup2.physicalKey	:=	"2"
	ControlGroup3.physicalKey	:=	"3"
	ControlGroup4.physicalKey	:=	"4"
	ControlGroup5.physicalKey	:=	"5"
	ControlGroup6.physicalKey	:=	"6"
	ControlGroup7.physicalKey	:=	"7"
	ControlGroup8.physicalKey	:=	"8"
	ControlGroup9.physicalKey	:=	"9"
	ControlGroup0.physicalKey	:=	"0"

	; Blizzard GRID
	; | 0,0 | 1,0 | 2,0 | 3,0 |
	; | 0,1 | 1,1 | 2,1 | 3,1 |
	; | 0,2 | 1,2 | 2,2 | 3,2 |
	
	GRID_00.physicalKey 		:= 	"Q" 	; move
	GRID_10.physicalKey 		:= 	"W" 	; stop
	GRID_20.physicalKey 		:= 	"E"		; hold
	GRID_30.physicalKey 		:= 	"R" 	; attack

	GRID_01.physicalKey 		:= 	"A" 	; patrol
	GRID_11.physicalKey 		:= 	"S" 	;
	GRID_21.physicalKey 		:= 	"D" 	;
	GRID_31.physicalKey 		:= 	"F" 	; learn ability

	GRID_02.physicalKey 		:= 	"Z" 	; ability 1
	GRID_12.physicalKey 		:= 	"X"		; ability 2
	GRID_22.physicalKey 		:= 	"C"		; ability 3
	GRID_32.physicalKey 		:= 	"V"		; ability 4

	Item1.physicalKey			:=	"Numpad7"
	Item2.physicalKey			:=	"Numpad8"
	Item3.physicalKey			:=	"Numpad4"
	Item4.physicalKey			:=	"Numpad5"
	Item5.physicalKey			:=	"Numpad1"
	Item6.physicalKey			:=	"Numpad2"
	ItemsRequireAlt				:=	0 		; <--------- notice this

	; --- --- --- --- --- ---
	laltkey.physicalKey			:= 	"LAlt"
	raltkey.physicalKey			:= 	"RAlt"
	ctrlkey.physicalKey			:= 	"LCtrl"
	shiftkey.physicalKey		:= 	"LShift"	
	capslockkey.physicalKey		:= 	"CapsLock"
	tabkey.physicalKey			:= 	"Tab"
	enterkey.physicalKey		:= 	"Enter"
	numpadenterkey.physicalKey	:= 	"NumpadEnter"
	upkey.physicalKey			:= 	"Up"

	mouse1key.physicalKey		:= 	"LButton"	; not used
	mouse2key.physicalKey		:= 	"RButton" 	; used for UnifiedOrders and RepeatMouse
}