/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Loads sectors data from save.
	Starts monitoring sectors and spawns / despawns them accordingly

Parameters:
	NONE

Usage: [] spawn FRLN_fnc_monitorSectors;

Returns: Nothing
*/

if !(isServer) exitWith {};

FRLN_sectorStatus = missionProfileNamespace getVariable ["savedSectorStatus", createHashmap];

// When loading a save, don't load any sectors as active or contested
{
	if (_y == "Contested" || _y == "Active") then {FRLN_sectorStatus set [_x, "Inactive"]};
} forEach FRLN_sectorStatus;
["FRLN_sectorStatus"] call FRLN_fnc_broadcast;

FRLN_sectorUnits = createHashMap;
["FRLN_sectorUnits"] call FRLN_fnc_broadcast;

while {true} do {
	private _allPlayers = (allPlayers - (entities "HeadlessClient_F"));
	{
		_x params [
			["_sectorName", "", [""]],
			["_sectorPos", [0,0,0], [[]]],
			["_sectorType", "NameVillage", [""]]
		];

		private _sectorStatus = FRLN_sectorStatus getOrDefault [_sectorName, "Inactive", true];
		private _playersNear = (_allPlayers findIf {(_x distance2D _sectorPos) <= 2000} isNotEqualTo -1);
		private _leastLoadedHC = [] call FRLN_fnc_getLeastLoadedHC;

		// There are players near by
		if (_playersNear) then {
			// Players near and sector hasn't been activated yet
			if (_sectorStatus == "Inactive") then {
				[_sectorName, _sectorPos, _sectorType] remoteExecCall ["FRLN_fnc_spawnSector", _leastLoadedHC, false];
			} else {
				// Players near and sector has been activated and the sector isn't in cooldown or cooling down
				if (_sectorStatus == "Active" && _sectorStatus != "Cooldown" && _sectorStatus != "Cooling") then {
					[_sectorName, _sectorPos, _sectorType] remoteExec ["FRLN_fnc_sectorContested", _leastLoadedHC, false];
				};
			};
		} else {
			// No players near and sector has been activated
			if (_sectorStatus == "Active") then {
				[_sectorName, _sectorPos, _sectorType] remoteExecCall ["FRLN_fnc_despawnSector", _leastLoadedHC, false];
			};
		};

		// Sector is marked for cooldown.
		// Start "cooling it down" for 20 minutes.
		if (_sectorStatus == "Cooldown") then {
			[_sectorName] spawn {
				FRLN_sectorStatus set [_sectorName, "Cooling"];
				["FRLN_sectorStatus"] call FRLN_fnc_broadcast;
				sleep (20*60);
				FRLN_sectorStatus set [_sectorName, "Active"];
				["FRLN_sectorStatus"] call FRLN_fnc_broadcast;
			};
		};

		// Sector marker handling
		switch (_sectorStatus) do {
			case "Captured": {_sectorName setMarkerColor "ColorWEST"};
			case "Contested": {_sectorName setMarkerColor "ColorUNKNOWN"};
			case "Cooling": {_sectorName setMarkerColor "ColorGrey"};
			default {_sectorName setMarkerColor "ColorEAST"};
		};
	} forEach FRLN_allSectors;
	uiSleep 30;
};
