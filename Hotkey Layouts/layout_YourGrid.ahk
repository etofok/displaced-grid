;-------------------------------------------
; This file contains a layout that you can design for yourself
; currently there's no easy way to load this, but maybe in a future update I will expand DisplacedGrid to AnythingGrid

layout_YourGrid() {

	layoutName	 				:= "YourGrid"

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
	
	GRID_00.physicalKey 		:= 	"Q"
	GRID_10.physicalKey 		:= 	"W"
	GRID_20.physicalKey 		:= 	"E"
	GRID_30.physicalKey 		:= 	"R"

	GRID_01.physicalKey 		:= 	"A"
	GRID_11.physicalKey 		:= 	"S"
	GRID_21.physicalKey 		:= 	"D"
	GRID_31.physicalKey 		:= 	"F"

	GRID_02.physicalKey 		:= 	"Z"
	GRID_12.physicalKey 		:= 	"X"
	GRID_22.physicalKey 		:= 	"C"
	GRID_32.physicalKey 		:= 	"V"

	; items might require ALT because it's hardcoded. No guarantees at this point, let me know if you need something like this.
	Item1.physicalKey			:=	"numpad7"
	Item2.physicalKey			:=	"numpad8"
	Item3.physicalKey			:=	"numpad4"
	Item4.physicalKey			:=	"numpad5"
	Item5.physicalKey			:=	"numpad1"
	Item6.physicalKey			:=	"numpad2"

	; --- --- --- --- --- ---
	laltkey.physicalKey			:= 	"LAlt"
	raltkey.physicalKey			:= 	"RAlt"
	ctrlkey.physicalKey			:= 	"LCtrl"
	shiftkey.physicalKey		:= 	"LShift"	
	capslockkey.physicalKey		:= 	"CapsLock"
	mouse1key.physicalKey		:= 	"LButton"	; not used
	mouse2key.physicalKey		:= 	"RButton"
	tabkey.physicalKey			:= 	"Tab"
	enterkey.physicalKey		:= 	"Enter"
	numpadenterkey.physicalKey	:= 	"NumpadEnter"
	upkey.physicalKey			:= 	"Up"
}