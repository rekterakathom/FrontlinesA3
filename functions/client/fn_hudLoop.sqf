/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Updates the player HUD every second

Parameters:
	NONE

Usage: [] call FRLN_fnc_hudLoop;

Returns: Nothing
*/

waitUntil {!isNull player};
sleep 1;
private _uiVariable = uiNamespace getVariable "FRLN_rankHud";
waitUntil {
	// Rank stuff
	_uiVariable displayCtrl 1200 ctrlSetText ([player, "texture"] call BIS_fnc_rankParams);
	_uiVariable displayCtrl 1100 ctrlSetStructuredText parseText format ["<t align='center'>%1</t>", rank player];
	_uiVariable displayCtrl 1101 ctrlSetStructuredText parseText format ["<t align='left'>%1</t>", name player];

	// War level
	_uiVariable displayCtrl 1103 ctrlSetStructuredText parseText format ["<t align='left'>%1</t>", "0"];

	// War points
	_uiVariable displayCtrl 1105 ctrlSetStructuredText parseText format ["<t align='left'>%1</t>", "0"];
	sleep 1;
	false;
};