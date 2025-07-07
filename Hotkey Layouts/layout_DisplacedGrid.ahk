;-------------------------------------------
; This is the Displaced Grid layout
;
;


layout_DisplacedGrid() {

	layoutName	 				:= "DisplacedGrid"

	SelectHero1.physicalKey		:= 	"1"
	SelectHero2.physicalKey		:= 	"2"
	SelectHero3.physicalKey		:= 	"3"
	IdleWorker.physicalKey		:=	"`"
	JumpToEvent.physicalKey		:=	"5"

	ControlGroup1.physicalKey	:=	"a"
	ControlGroup2.physicalKey	:=	"s"
	ControlGroup3.physicalKey	:=	"z"
	ControlGroup4.physicalKey	:=	"x"
	ControlGroup5.physicalKey	:=	"q"
	ControlGroup6.physicalKey	:=	"w"
	ControlGroup7.physicalKey	:=	"f1"
	ControlGroup8.physicalKey	:=	"f2"
	ControlGroup9.physicalKey	:=	"f3"
	ControlGroup0.physicalKey	:=	"f4"

	; Blizzard GRID
	; | 0,0 | 1,0 | 2,0 | 3,0 |
	; | 0,1 | 1,1 | 2,1 | 3,1 |
	; | 0,2 | 1,2 | 2,2 | 3,2 |

	GRID_00.physicalKey 		:= 	"D"
	GRID_10.physicalKey 		:= 	"F"
	GRID_20.physicalKey 		:= 	"G"
	GRID_30.physicalKey 		:= 	"Space"

	GRID_01.physicalKey 		:= 	"C"
	GRID_11.physicalKey 		:= 	"V"
	GRID_21.physicalKey 		:= 	"B"
	GRID_31.physicalKey 		:= 	"N"

	GRID_02.physicalKey 		:= 	"E"
	GRID_12.physicalKey 		:= 	"R"
	GRID_22.physicalKey 		:= 	"T"
	GRID_32.physicalKey 		:= 	"4"

	Item1.physicalKey			:=	"q"
	Item2.physicalKey			:=	"w"
	Item3.physicalKey			:=	"a"
	Item4.physicalKey			:=	"s"
	Item5.physicalKey			:=	"z"
	Item6.physicalKey			:=	"x"
	ItemsRequireAlt				:=	1 		; <--------- notice this

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