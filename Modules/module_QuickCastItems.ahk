;-----------------------------------------
; ----- QuickCast Items
;-----------------------------------------
;
; (!) This module requires a set up to your resolution.
; You must modify the required screen coordinates in UserSettings.ahk

; For some reason QuickCast=1 in .../Documents/WarcraftIII/War3preferences.txt works for Abilities, 
; but does NOT work for Items.
; 
; This module does 3 things:
; 1. Checks that the item slot is not empty (via pixel hunting)
; 2. Checks that the item is not on cooldown (via pixel hunting)
; 3. Sends a Left Mouse click
; 
;
; (!) The reason this is not a 'true' quickcast is because the left mouse click is not connected to 'reality',
; i.e. say, we "activate" an item, but it's actually a passive item (so it can't be activated in principle).
; This module will send a Left Mouse Click regardless, 
; because while it CAN see that the slot is occupied by an item and is NOT on cooldown...
; it can't differentiate between an active and a passive item.
;
; I have not found a clever way to differentiate between active and passive Items (i.e. Orb of Fire)
; This is a very minor limitation - just don't activate passive items.
;
;-----------------------------------------
; (!) IMPORTANT: Since this is a multiclick macro that provides a clear competitive advantage, 
; you should not use this module in competitive environment, unless both parties have agreed.
;
; Having said that, I do believe this functionality SHOULD be a part of the core experience
;-----------------------------------------

;--------------------------------
; On program start...

Global m_QuickCastItems_menuLabel := "< Item Quickcast >"
Global m_QuickCastItems_menuLabel_extra := " "

; Add this module to Tray only if it has been enabled in Settings
if (m_QuickCastItems.enabled == True) {

	; turns out, in AHK v1.1 we can't use an object's property for Tray, so I have to hardcode another variable
	;m_QuickCastItems.menuLabel := m_QuickCastItems_menuLabel ; but we can store it just in case

	cnt := 0

	for index, gr in a_Items {
	    if (gr.quickcast == 1) {
	    	cnt++
	    	tmpup := gr.physicalKey

	    	StringUpper, tmpup, tmpup
	    	m_QuickCastItems_menuLabel_extra := m_QuickCastItems_menuLabel_extra . " [" . tmpup . "]"
	    }
	}


	if (cnt = 0) {
		m_QuickCastItems_menuLabel := m_QuickCastItems_menuLabel . m_QuickCastItems_menuLabel_extra . "none"
	} else {
		m_QuickCastItems_menuLabel := m_QuickCastItems_menuLabel . m_QuickCastItems_menuLabel_extra
	}

	Menu, Tray, Add, %m_QuickCastItems_menuLabel%, Toggle_m_QuickCastItems

	Control_m_QuickCastItems(1)
}

;-----------------------------------------
; QuickCastItems Module 
;-----------------------------------------

; The module assumes the item is quickcast-ables

QuickCastItem(objItem) {

	if (m_EventLog.active) {
		UpdateEventLog("--- QuickCast Item --- ")
		UpdateEventLog("Slot: " objItem.slot "; x: " objItem.x "; y: " objItem.y)	
	}
	
	; only proceed if the item slot has been set to be quickcast-able (Settings)
	if !(clientArea.height == 1080) {

		if (m_EventLog.active) {
			UpdateEventLog("Client area is not 1920x1080. Quickcast will not proceed.")
		}
		return
	}	

	; only proceed if the item slot has been set to be quickcast-able (Settings)
	if (objItem.quickcast == 0) {

		if (m_EventLog.active) {
			UpdateEventLog("Item slot " objItem.slot " is NOT QuickCast-able")
		}
		return
	}

	;-----------------------------------------
	; check if the Item slot is NOT empty to continue...
	;msgbox, % "objItem.slot: " objItem.slot

	ImageSearch, image_cdX, image_cdY, objItem.x-2, objItem.y-2, objItem.x+2, objItem.y+2, *30 %A_ScriptDir%\Modules\pixelhunt\PixelHunt_NonEmptySlot.png
/*
	if (objItem.slot == 3 || objItem.slot == 4 || objItem.slot == 5 || objItem.slot == 6) {
		ImageSearch, image_cdX, image_cdY, objItem.x, objItem.y-1, objItem.x+5, objItem.y+2, *50 %A_ScriptDir%\Modules\pixelhunt\PixelHunt_NonEmptySlot.png
	} else {

	}
	*/
	; PixelHunt_NonEmptySlot is a gray pixel indicating an item's border

	if !(image_cdX > 0) {
			
		if (m_EventLog.active) {
			UpdateEventLog("Item slot " objItem.slot " is Empty!")	
		}

		return
	}

	;-----------------------------------------
	; check if the Item is NOT on cooldown to continue...
	ImageSearch, image_cdX, image_cdY, objItem.x-2, objItem.y-2, objItem.x+2, objItem.y+2, *10 %A_ScriptDir%\Modules\pixelhunt\PixelHunt_Cooldown.png
	; PixelHunt_Cooldown is a blue pixel indicating an item's cooldown overlay

	if (image_cdX > 0) {
			
		if (m_EventLog.active) {
			UpdateEventLog("Item slot " objItem.slot " is on Cooldown!")	
		}

		return
	}

	;-----------------------------------------
	; Finally, send a Click or Shift-Click
	; I have not found a clever way to differentiate between active and passive Items (i.e. Staff of Teleportation vs Orb of Fire)
	; which means this module will send a left click as an attempt to active the item.
	; if the item is a passive item, what will happen is you'll leftclick something.
	; SOLUTION: just don't 'activate' your passive items.
	
	if (keyPressed_LShift) {

		Send {Shift Down}{Click}{Shift Up}

		if (m_EventLog.active) {
			UpdateEventLog("Item QuickCast: Shift-Click!")
		}

	} else {

		Send {Click}

		if (m_EventLog.active) {
			UpdateEventLog("Item QuickCast: Click!")
		}
	}

	if (m_RapidFire.active == 1) {
		RapidFire()
	}
}


;--------------------------------
; QuickCastItems Control
;--------------------------------

Toggle_m_QuickCastItems() {
	Control_m_QuickCastItems(not m_QuickCastItems.active)
} 


Control_m_QuickCastItems(switchTo) {

	m_QuickCastItems.active := switchTo
	
	ToggleCheckmark(m_QuickCastItems_menuLabel, switchTo)

	if (m_EventLog.active) {
		UpdateEventLog("Item QuickCast - " . switchTo)	
	}
} 