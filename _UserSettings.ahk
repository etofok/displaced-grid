;-----------------------------------------
; Welcome to UserSettings!
; Please set aside 5 minutes to set up everything.
; You won't have to do this again.
;-----------------------------------------



;-----------------------------------------
;
; (!) How to enable QuickCasts for Abilities in Warcraft III:Reforged.
; Displaced Grid is designed with this functionality in mind.
;
; Step 1. You MUST use the 'GRID' layout in Warcraft III:Reforged. 
; Warcraft III -> Menu -> Options -> Input -> Preset Keybindings -> Dropdown select "Grid" -> Save -> Exit Warcraft III
;
; Step 2. Open War3Preferences.txt
; Go to your %USERNAME%\Documents\Warcraft III\War3Preferences.txt
;
; Step 3. 
; In War3Preferences.txt change every "QuickCast=0" to "QuickCast=1".
; Save War3Preferences.txt -> Launch the game.
;
; You now have QuickCasts for Abilities enabled.
;-----------------------------------------






;-----------------------------------------
; 1. Do you want to have Displaced Grid hotkeys ON or OFF on app Launch?
; Change the variable to indicate Yes or No (True = Yes, False = No).
;-----------------------------------------

Global b_DisplacedGrid 			:= True		; True / False

;-----------------------------------------
; 2. What hotkeys do you want to control the app with?
;-----------------------------------------

; Hotswitch between Displaced Grid and Default hotkeys. 
; ScrollLock is a good hotkey because it got a visual indicator on most keyboards.
; Another great option is to bind it to a side mouse button like Xbutton1 or Xbutton2.
; https://www.autohotkey.com/docs/v1/KeyList.htm

Hotkey_Toggle_DisplacedGrid		= ScrollLock

Hotkey_Send_glhf 				= F9 		; type "gl hf" in chat
Hotkey_Send_gg 					= F11		; type "gg" in chat

Hotkey_ScriptReload 			= ^Numpad3 	; Reload the Script with CONTROL + NUMPAD3 (default bind)


; ^ - CTRL
; + - SHIFT
; ! - ALT
; Wiki page: https://www.autohotkey.com/docs/v1/Hotkeys.htm


;-----------------------------------------
; 3. What MODULES do you want to use?
;
; If set to 'True' - the module is ENABLED.
; If set to 'False' - the module is DISABLED.
;
;-----------------------------------------

Global b_PreventAltfromTogglingHealthbars 	:= True 	; This will prevent ALT from toggling healthbars.
Global b_SetSkillPoint						:= True 	; CTRL + Ability to quickly allocate a hero skill point.
Global b_CommandMultipleGroups 				:= True 	; Command Multiple Groups (default control groups: 'A', 'S', 'Z' and 'X', see below).
Global b_RapidFire							:= True 	; RapidFire Casting: Hold an action key to repeatedly fire.
Global b_InstantCamera 						:= False 	; Instant camera for control groups (default control groups: none, see below).
Global b_ShiftQueueItems					:= True 	; Ability to queue items when holding SHIFT and ALT. It's important for DGRID users because item activation requres pressing down ALT.

; The following modules REQUIRE YOUR ATTENTION to work properly.
; These DO NOT work "out of the box".
; See instructions below.
; (takes 5 minutes)

Global b_QuickCastItems 		:= False 	; Pseudo QuickCast for Items (requires VERY precise pixel coordinates, see below).
Global b_QuickDropItems 		:= False 	; ALT + CTRL + q/w/a/s/z/x to drop/pass items to mouse cursor (requires VERY precise pixel coordinates, see below).
Global b_CastOnYourself			:= False 	; Hold ALT to Cast On Yourself. Alt+D+D will no longer exit the game.

;-----------------------------------------
; 4. To what control groups would you like to attach the Instant Camera functionality, if any?
;
; This module double-taps the group when you single tap it.
;-----------------------------------------

ControlGroup1.instantCamera := False 	; a
ControlGroup2.instantCamera := False 	; s
ControlGroup3.instantCamera := False 	; z
ControlGroup4.instantCamera := False 	; x
ControlGroup5.instantCamera := False 	; q
ControlGroup6.instantCamera := False 	; w
ControlGroup7.instantCamera := False 	; f1
ControlGroup8.instantCamera := False 	; f2
ControlGroup9.instantCamera := False 	; f3
ControlGroup0.instantCamera := False 	; f4

; I found two main use cases:
; Instantly pan to a dedicated scout group or a hit-squad group (i.e. 'x')
; Instantly pan between your Main Base and Expansion (i.e. 'f1' and 'f2')

;-----------------------------------------
; 5. What control groups would you like to manage simultaneously using CapsLock? | 'Command Multiple Groups' Module Set Up
;
; This module allows the user to send attack/move/cast/stop/hold/patrol commands to specific control groups.
;
; I recommend using CG1 CG2 CG3 CG4 as your main 'army' hotkeys (which are bound to 'A', 'S', 'Z' and 'X').
;-----------------------------------------

ControlGroup1.commandThisGroup := True 		; a
ControlGroup2.commandThisGroup := True 		; s
ControlGroup3.commandThisGroup := True 		; z
ControlGroup4.commandThisGroup := True 		; x
ControlGroup5.commandThisGroup := False 	; q
ControlGroup6.commandThisGroup := False 	; w
ControlGroup7.commandThisGroup := False 	; f1
ControlGroup8.commandThisGroup := False 	; f2
ControlGroup9.commandThisGroup := False 	; f3
ControlGroup0.commandThisGroup := False 	; f4


;-----------------------------------------
; 6. Where is the Inventory/Backpack UI element located on your screen?
;
; This is required for the QuickCastItem module, because we pixel hunt to determine whether the item is on cooldown by its blue cooldown overlay.
; This is also required for the QuickDropItem module, because we right-click the item to grab and drag it.
; The app needs to know where exactly to click.
;
; Otherwise, these two modules will not work properly.
;
; You can easily find the coordinates using the Windows Paint app, like so:
; https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/assets/images/pixelhuntsetup.mp4
;
; You are looking for the blue overlay on top of the item border — just one pixel! (!)
; It's very precise but this works.
;
; This way, we can determine whether the item slot contains an item (by its silver-colored border) 
; AND whether the item is on cooldown (by the blue overlay).
;-----------------------------------------

; The following works for 1920x1080

; item slot #1 (top-left)
; item slot #2 (top-right)
; item slot #3 (middle-left)
; item slot #4 (middle-right)
; item slot #5 (bottom-left)
; item slot #6 (bottom-right)

Item1.x 					:= 	1197
Item1.y 					:= 	880

Item2.x 					:= 	1270
Item2.y 					:= 	880

Item3.x 					:= 	1197
Item3.y 					:= 	949

Item4.x 					:= 	1270
Item4.y 					:= 	949

Item5.x 					:= 	1197
Item5.y 					:= 	1017

Item6.x 					:= 	1270
Item6.y 					:= 	1017

;-----------------------------------------

; 7. What Item SLOTS do you want to have on Quick Casts?
; This is useful because not every item benefits from Quick Casts.

/*
Generally speaking, things like Healing Salve, Human & Elf Staffs are great on Quick Cast.
But the reason we don't want ALL item slots on Quick Cast is because of how it works in Displaced Grid:
Since Displaced Grid doesn't read memory and IS NOT A PART of the game - it can't "see" what items are being cast.
This means to achieve "Quick Cast" we send an extra left mouse click into the game. This is great when we do need it, but what if you just used a healing scroll? Or a potion?
The left click will be sent regardless, which might lead to some unwanted unit select.
So after playtesting for more than 500 hours I have not found a way to (easily) differentiate between the items, so I decided to differentiate between the slots.
*/

; item slot #1 (top-left)
; item slot #2 (top-right)
; item slot #3 (middle-left)
; item slot #4 (middle-right)
; item slot #5 (bottom-left)
; item slot #6 (bottom-right)

Item1.quickcast				:=	True
Item2.quickcast				:=	True
Item3.quickcast				:=	False
Item4.quickcast				:=	False
Item5.quickcast				:=	False
Item6.quickcast				:=	False
	

;-----------------------------------------
; 8. Where is the Portrait UI element located on YOUR screen?
;
; This is required for the "Cast On Yourself" module.
; Because Displaced Grid NEEDS to "know" where your Portait UI element is located on YOUR screen.
;
; The following works for 1920x1080
; 
; You can easily find the coordinates using the Windows Paint app, like so:
; https://etofok.github.io/Displaced-Grid-for-Warcraft-III/web/assets/images/pixelhuntsetup.mp4
;
; Find one pixel of your portrait element, so the app knows where to click.
;-----------------------------------------


PortraitUI.x := 700
PortraitUI.y := 900

; That's it!
; etofok






;-----------------------------------------

Global b_EventLog	 		:= True 	
; This is a debugging overlay used for troubleshooting. 
; You can switch it on if you're curious but it's not for gameplay.