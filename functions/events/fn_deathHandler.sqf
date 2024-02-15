/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Handles all entity deaths

Parameters:
	"_unit", // The entity that was killed
	"_killer", // The killer (vehicle or person)
	"_instigator", // The entity that pulled the trigger
	"_useEffects" // See setDamage

Usage: [] call FRLN_fnc_deathHandler;

Returns: Boolean - success
*/

params [
	["_unit", objNull],
	["_killer", objNull],
	["_instigator", objNull],
	["_useEffects", true]
];

if (
	(isNull _unit)
	|| {isNull _killer}
) exitWith {diag_log "Frontlines: fn_deathHandler - null unit(s) passed"};

// Only handle the deaths of people
if !(_unit isKindOf "CAManBase") exitWith {};

// Ensure that instigator is defined
if (isNull _instigator) then {_instigator = (UAVControl (vehicle _killer)) # 0}; // UAV/UGV player operated road kill
if (isNull _instigator) then {_instigator = driver _killer}; // player driven vehicle road kill

// Handle blufor death
if (side _unit == west) then {
	private _bluforCasualties = missionProfileNamespace getVariable ["FRLN_bluforDeaths", 0];
	missionProfileNamespace setVariable ["FRLN_bluforDeaths", _bluforCasualties + 1];

	if (side _instigator == west) then {
		private _friendliesKilled = _instigator getVariable ["FRLN_friendliesKilled", 0];
		_instigator setVariable ["FRLN_bluforDeaths", _friendliesKilled + 1];
		[format ["Frontlines: Friendly killed by %1", _instigator]] remoteExec ["FRLN_fnc_writeToLog", 2, false];
	};
};

// Handle opfor death
if (side _unit == east) then {
	private _opforCasualties = missionProfileNamespace getVariable ["opforDeaths", 0];
	missionProfileNamespace setVariable ["opforDeaths", _opforCasualties + 1];

	if (side _instigator == west) then {
		private _enemiesKilled = _instigator getVariable ["FRLN_enemiesKilled", 0];
		_instigator setVariable ["FRLN_enemiesKilled", _enemiesKilled + 1];
	};
};

// Add to garbage collector
[_unit] spawn {
	params [["_unit", objNull]];
	sleep 15*60;
	waitUntil {
		sleep 30;
		if (isNil "_unit" || {isNull _unit}) exitWith {};
		((["players", getPosASL _unit, 300] call FRLN_fnc_unitsInRadius) isEqualTo []);
	};
	if (isNil "_unit" || {isNull _unit}) exitWith {};
	[_unit] call FRLN_fnc_cleanupUnit;;
};

true
