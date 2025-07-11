;-------------------------------------------
; This an example of how you can set up TheCore for Wc3
; By no means this is the final version.

layout_TheCore() {

	layoutName	 				:= 	"TheCore"
	
	SelectHero1.physicalKey		:= 	"="
	SelectHero2.physicalKey		:= 	"-"
	SelectHero3.physicalKey		:= 	"0"
	IdleWorker.physicalKey		:=	"9"
	JumpToEvent.physicalKey		:=	"8"

	ControlGroup1.physicalKey	:=	"["
	ControlGroup2.physicalKey	:=	"]"
	ControlGroup3.physicalKey	:=	";"
	ControlGroup4.physicalKey	:=	"'"
	ControlGroup5.physicalKey	:=	"."
	ControlGroup6.physicalKey	:=	"/"
	ControlGroup7.physicalKey	:=	""
	ControlGroup8.physicalKey	:=	""
	ControlGroup9.physicalKey	:=	""
	ControlGroup0.physicalKey	:=	""

	; Blizzard GRID
	; | 0,0 | 1,0 | 2,0 | 3,0 |
	; | 0,1 | 1,1 | 2,1 | 3,1 |
	; | 0,2 | 1,2 | 2,2 | 3,2 |
	
	GRID_00.physicalKey 		:= 	"U" 	; move
	GRID_10.physicalKey 		:= 	"I" 	; stop
	GRID_20.physicalKey 		:= 	"O"		; hold
	GRID_30.physicalKey 		:= 	"P" 	; attack

	GRID_01.physicalKey 		:= 	"H" 	; patrol
	GRID_11.physicalKey 		:= 	"J" 	;
	GRID_21.physicalKey 		:= 	"K" 	;
	GRID_31.physicalKey 		:= 	"L" 	; learn ability

	GRID_02.physicalKey 		:= 	"B" 	; ability 1
	GRID_12.physicalKey 		:= 	"N"		; ability 2
	GRID_22.physicalKey 		:= 	"M"		; ability 3
	GRID_32.physicalKey 		:= 	","		; ability 4

	Item1.physicalKey			:=	"["
	Item2.physicalKey			:=	"]"
	Item3.physicalKey			:=	";"
	Item4.physicalKey			:=	"'"
	Item5.physicalKey			:=	"."
	Item6.physicalKey			:=	"/"
	ItemsRequireAlt				:=	1 		; <--------- notice this

	; --- --- --- --- --- ---
	laltkey.physicalKey			:= 	"AppsKey"
	raltkey.physicalKey			:= 	"RAlt"
	lctrlkey.physicalKey		:= 	"LCtrl"
	rctrlkey.physicalKey		:= 	"RCtrl"
	lshiftkey.physicalKey		:= 	"LShift"
	rshiftkey.physicalKey		:= 	"RShift"
	capslockkey.physicalKey		:= 	"CapsLock"
	tabkey.physicalKey			:= 	"Tab"
	enterkey.physicalKey		:= 	"Enter"
	numpadenterkey.physicalKey	:= 	"NumpadEnter"
	upkey.physicalKey			:= 	"Up"

	mouse1key.physicalKey		:= 	"LButton"	; not used
	mouse2key.physicalKey		:= 	"RButton" 	; used for UnifiedOrders and RepeatMouse
}