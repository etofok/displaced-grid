; ------------------------------------------
; This file contains the list of hotkeys AS THEY APPEAR TO YOU IN-GAME

; this file assumes you are using Blizzard GRID.
; There are regional differences i.e. QWERTY (English) vs AZERTY (French)

; For example, 
; if your GRID_00 (Move) is "Q" then GRID_00.ingameHotkey must be "{q}"

; Parentheses are necessary. Please adhere to this format.

;-------------------------------------------
; Command Card.
;-------------------------------------------

; Blizzard GRID
; | 0,0 | 1,0 | 2,0 | 3,0 |
; | 0,1 | 1,1 | 2,1 | 3,1 |
; | 0,2 | 1,2 | 2,2 | 3,2 |

layoutName	 					:= 	""

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
; Modifiers and other keys
;-------------------------------------------

laltkey.ingameHotkey 			:= 	"{LAlt}"
raltkey.ingameHotkey 			:= 	"{RAlt}"
lctrlkey.ingameHotkey 			:= 	"{LCtrl}"
rctrlkey.ingameHotkey 			:= 	"{RCtrl}"
lshiftkey.ingameHotkey			:= 	"{LShift}"
rshiftkey.ingameHotkey			:= 	"{RShift}"
capslockkey.ingameHotkey		:= 	"{CapsLock}"
mouse1key.ingameHotkey 			:= 	"{Lbutton}"
mouse2key.ingameHotkey 			:= 	"{Rbutton}"
tabkey.ingameHotkey 			:= 	"{Tab}"
enterkey.ingameHotkey			:= 	"{Enter}"
numpadenterkey.ingameHotkey		:= 	"{NumpadEnter}"
upkey.ingameHotkey				:= 	"{Up}"
