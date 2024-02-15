// Initialize game & load save
FRLN_allSectors = [] call FRLN_fnc_initSectors;
["FRLN_allSectors"] call FRLN_fnc_broadcast;
FRLN_playerData = missionProfileNamespace getVariable ["playerData", createHashmap];
["FRLN_playerData"] call FRLN_fnc_broadcast;
FRLN_supplies = missionProfileNamespace getVariable ["supplies", 0];
["FRLN_supplies"] call FRLN_fnc_broadcast;
FRLN_bases = missionProfileNamespace getVariable ["bases", []];
["FRLN_bases"] call FRLN_fnc_broadcast;

[] call compileScript ["presets\OPFOR_3CB_SEPARATIST.sqf", true];
[] call compileScript ["presets\BLUFOR_VEH_RHSUSAF.sqf", true];
[] spawn FRLN_fnc_monitorSectors;
[] spawn FRLN_fnc_autoSaveLoop;
[] spawn FRLN_fnc_opforBrain;

// If there are no bases, add functionality to FOB box.
if (FRLN_bases isEqualTo []) then {
	frln_fobcrate addAction ["Establish a FOB", frln_fnc_createBase];
} else {
	deleteVehicle frln_fobcrate;
};

createMarkerLocal ["respawn_west", [0, 0, 0]];
"respawn_west" setMarkerAlpha 0;

private _killedEventHandler = addMissionEventHandler ["EntityKilled", FRLN_fnc_deathHandler];
private _connectionEventHandler = addMissionEventHandler ["PlayerConnected", FRLN_fnc_playerConnected];
private _disconnectEventHandler = addMissionEventHandler ["PlayerDisconnected", FRLN_fnc_playerDisconnected];
private _buildingHandler = ["Building", "Dammaged", FRLN_fnc_buildingDamagedHandler] call CBA_fnc_addClassEventHandler;

