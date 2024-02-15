/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Handles all building damage

Parameters:
	"_obj",
	"_selection",
	"_damage",
	"_hitIndex",
	"_hitPoint",
	"_shooter",
	"_projectile"

Usage: [] call FRLN_fnc_buildingDamagedHandler;

Returns: Boolean - success
*/

params [
	"_obj",
	"_selection",
	"_damage",
	"_hitIndex",
	"_hitPoint",
	"_shooter",
	"_projectile"
];

private _instigator = (getShotParents _projectile) # 1;
if (side _instigator != west) exitWith {};

// It's not yet destroyed
if (_damage != 1) exitWith {};

private _buildingClass = configFile >> "CfgVehicles" >> typeOf _obj >> "vehicleClass";

// It's not a civilian structure
if (_buildingClass != "Structures_Town") exitWith {};

// It was a civilian building destroyed by blufor, act accordingly
private _civBuildingsDestroyed = _instigator getVariable ["FRLN_buildingsDestroyed", 0];
_instigator setVariable ["FRLN_buildingsDestroyed", _civBuildingsDestroyed + 1];

[format ["Frontlines: Civilian building destroyed by %1", _instigator]] remoteExec ["FRLN_fnc_writeToLog", 2, false];

true
