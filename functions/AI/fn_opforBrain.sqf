/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Main OPFOR logic loop

Parameters:

Usage: 

Returns: 
*/

// List of all currently active artillery
FRLN_OPFOR_artilleryList = [];

// List of all currently active anti-air
FRLN_OPFOR_antiairList = [];

// Inline function to clean-up stuff
private _fnc_cleanup = {
	params ["_checkArray"];
	{
		private _vehicle = _x;
		private _playersPresent = ["players", getPosATL _vehicle, 1000] call FRLN_fnc_unitsInRadius;
		if (_playersPresent isNotEqualTo []) then {continue}; // Don't clean up if players are close

		private _crew = _vehicle getVariable ["FRLN_crew", []];
		private _guards = _vehicle getVariable ["FRLN_guard", []];

		{
			if (!(alive _x) || !(alive _vehicle)) then {[_x] call FRLN_fnc_cleanupUnit};
		} forEach ((units _crew) + _guards);

		if !(alive _vehicle) then {deleteVehicle _vehicle};
	} forEach _checkArray;
};

// Anti-air manager
FRLN_OPFOR_antiairManager = [_fnc_cleanup] spawn {
	params ["_fnc_cleanup"];
	while {true} do {
		// Try approx every 30 minutes
		sleep (random [20*60, 30*60, 40*60]);
		[FRLN_OPFOR_antiairList] call _fnc_cleanup;

		// Spawn a new antiair installation
		if ((count FRLN_OPFOR_antiairList) < 2) then {
			[] call FRLN_fnc_opforSpawnAntiAir;
		};
	};
};

// Artillery manager
FRLN_OPFOR_artilleryManager = [_fnc_cleanup] spawn {
	params ["_fnc_cleanup"];
	while {true} do {
		// Try approx every 40 minutes
		sleep (random [30*60, 40*60, 50*60]);
		[FRLN_OPFOR_artilleryList] call _fnc_cleanup;

		// Spawn a new artillery installation
		if ((count FRLN_OPFOR_artilleryList) < 2) then {
			[] call FRLN_fnc_opforSpawnArtillery;
		};
	};
};