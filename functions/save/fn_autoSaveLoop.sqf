/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Starts the autosave loop

Parameters:
	NONE

Usage: [] spawn FRLN_fnc_autoSaveLoop;

Returns: Nothing
*/

while {true} do {
	sleep (15*60);
	diag_log "Frontlines: Autosave commencing";
	missionProfileNamespace setVariable ["savedSectorStatus", FRLN_sectorStatus];
	missionProfileNamespace setVariable ["playerData", FRLN_playerData];
	missionProfileNamespace setVariable ["supplies", FRLN_supplies];
	saveMissionProfileNamespace;
};