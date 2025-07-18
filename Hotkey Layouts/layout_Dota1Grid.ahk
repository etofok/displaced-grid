;-------------------------------------------
; 

layout_Dota1Grid() {

	SelectHero1.physicalKey		:= 	"f1"
	SelectHero2.physicalKey		:= 	"f2"
	SelectHero3.physicalKey		:= 	"f3"
	IdleWorker.physicalKey		:=	"f8"
	JumpToEvent.physicalKey		:=	"f5"

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
	
	GRID_00.physicalKey 		:= 	"M" 	; move
	GRID_10.physicalKey 		:= 	"F" 	; stop
	GRID_20.physicalKey 		:= 	"H"		; hold
	GRID_30.physicalKey 		:= 	"Space" ; attack

	GRID_01.physicalKey 		:= 	"P" 	; patrol
	GRID_11.physicalKey 		:= 	"T" 	;
	GRID_21.physicalKey 		:= 	"Y" 	;
	GRID_31.physicalKey 		:= 	"N" 	; learn ability

	GRID_02.physicalKey 		:= 	"Q" 	; ability 1
	GRID_12.physicalKey 		:= 	"W"		; ability 2
	GRID_22.physicalKey 		:= 	"E"		; ability 3
	GRID_32.physicalKey 		:= 	"R"		; ability 4

	Item1.physicalKey			:=	"A"
	Item2.physicalKey			:=	"Z"
	Item3.physicalKey			:=	"S"
	Item4.physicalKey			:=	"X"
	Item5.physicalKey			:=	"D"
	Item6.physicalKey			:=	"C"
	ItemsRequireAlt				:=	0 		; <--------- notice this

	;-------------------------------------------

	object_Capslock.physicalKey			:= 	"CapsLock"
	object_RButton.physicalKey 			:= 	"Rbutton"
	object_Tab.physicalKey 				:= 	"Tab"
	object_Enter.physicalKey			:= 	"Enter"
	object_NumpadEnter.physicalKey		:= 	"NumpadEnter"









	;-------------------------------------------
	; Modifiers (CTRL / ALT / SHIFT) can not be rebound
	;-------------------------------------------
	; not supported
	object_LShift.physicalKey			:= 	"LShift"
	object_LCtrl.physicalKey 			:= 	"LCtrl"
	object_LAlt.physicalKey 			:= 	"LAlt"

	object_RShift.physicalKey			:= 	"RShift"
	object_RCtrl.physicalKey 			:= 	"RCtrl"
	object_RAlt.physicalKey 			:= 	"RAlt"
	object_Menu.physicalKey 			:= 	"AppsKey"
}