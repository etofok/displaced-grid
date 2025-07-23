; ------------------------------------------
; This file contains the list of hotkeys = in-game actions
; This file assumes you are using Blizzard GRID set in your Warcraft 3 Input Options.

; There are regional differences i.e. QWERTY (English) vs AZERTY (French)

; For example, 
; if your GRID_00 (Move) is "Q" then GRID_00.ingameHotkey must be "{q}"
; if your GRID_00 (Move) is "A" then GRID_00.ingameHotkey must be "{a}"
; if your GRID_00 (Move) is "Z" then GRID_00.ingameHotkey must be "{z}"

; Parentheses are necessary. Please adhere to this format.

;-------------------------------------------
; Command Card.
;-------------------------------------------

; Blizzard GRID
; | 0,0 | 1,0 | 2,0 | 3,0 |
; | 0,1 | 1,1 | 2,1 | 3,1 |
; | 0,2 | 1,2 | 2,2 | 3,2 |

GRID_00.ingameHotkey 			:= 	"{q}"	; Move
GRID_10.ingameHotkey			:=	"{w}"	; Stop
GRID_20.ingameHotkey			:=	"{e}"	; Hold Position
GRID_30.ingameHotkey			:=	"{r}"	; Attack
GRID_01.ingameHotkey			:=	"{a}"	; Patrol
GRID_11.ingameHotkey			:=	"{s}"	; 
GRID_21.ingameHotkey			:=	"{d}"	; 
GRID_31.ingameHotkey			:=	"{f}"	; Learn Ability
GRID_02.ingameHotkey			:=	"{z}"	; Ability 1
GRID_12.ingameHotkey			:=	"{x}"	; Ability 2
GRID_22.ingameHotkey			:=	"{c}"	; Ability 3
GRID_32.ingameHotkey			:=	"{v}"	; Ability 4

;-------------------------------------------
; Select Hero.
;----------------------------------------

SelectHero1.ingameHotkey		:= 	"{f1}"
SelectHero2.ingameHotkey		:= 	"{f2}"
SelectHero3.ingameHotkey		:= 	"{f3}"
IdleWorker.ingameHotkey			:=	"{f8}"
JumpToEvent.ingameHotkey		:=	"{Space}"

;-------------------------------------------
; Control Groups.
;-------------------------------------------

ControlGroup1.ingameHotkey		:=	"{1}"
ControlGroup2.ingameHotkey		:=	"{2}"
ControlGroup3.ingameHotkey		:=	"{3}"
ControlGroup4.ingameHotkey		:=	"{4}"
ControlGroup5.ingameHotkey		:=	"{5}"
ControlGroup6.ingameHotkey		:=	"{6}"
ControlGroup7.ingameHotkey		:=	"{7}"
ControlGroup8.ingameHotkey		:=	"{8}"
ControlGroup9.ingameHotkey		:=	"{9}"
ControlGroup0.ingameHotkey		:=	"{0}"

;-------------------------------------------
; Items.
;-------------------------------------------
; Slots are as follows:
; 1 | 2
; 3 | 4
; 5 | 6

Item1.slot						:= 	1
Item1.ingameHotkey 				:=	"{numpad7}"

Item2.slot						:= 	2
Item2.ingameHotkey 				:=	"{numpad8}"

Item3.slot						:= 	3
Item3.ingameHotkey 				:=	"{numpad4}"

Item4.slot						:= 	4
Item4.ingameHotkey 				:=	"{numpad5}"

Item5.slot						:= 	5
Item5.ingameHotkey 				:=	"{numpad1}"

Item6.slot						:= 	6
Item6.ingameHotkey 				:=	"{numpad2}"

;-------------------------------------------

object_Up.ingameHotkey				:= 	"{Up}"
object_Down.ingameHotkey			:= 	"{Down}"
object_Left.ingameHotkey			:= 	"{Left}"
object_Right.ingameHotkey			:= 	"{Right}"

;-------------------------------------------

object_Capslock.ingameHotkey		:= 	"{CapsLock}"
object_RButton.ingameHotkey 		:= 	"{Rbutton}"
object_Tab.ingameHotkey 			:= 	"{Tab}"
object_Enter.ingameHotkey			:= 	"{Enter}"
object_NumpadEnter.ingameHotkey		:= 	"{NumpadEnter}"

;-------------------------------------------
; Modifiers (CTRL / ALT / SHIFT) can not be rebound
;-------------------------------------------

object_LShift.ingameHotkey			:= 	"{LShift}"
object_LCtrl.ingameHotkey 			:= 	"{LCtrl}"
object_LAlt.ingameHotkey 			:= 	"{LAlt}"

object_RShift.ingameHotkey			:= 	"{RShift}"
object_RCtrl.ingameHotkey 			:= 	"{RCtrl}"
object_RAlt.ingameHotkey 			:= 	"{RAlt}"
object_Menu.ingameHotkey 			:= 	"{AppsKey}"