/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Returns true if unit is combat-ready

Parameters:
	"_unit" - Unit to check

Usage: [player] call FRLN_fnc_combatReady;

Returns: Boolean - Is unit capable of combat
*/

if !(params [
	["_unit", objNull, [objNull]]
]) exitWith {["Invalid parameters passed!"] call BIS_fnc_error; false};

if !(alive _unit) exitWith {false};
if (lifeState _unit == "INCAPACITATED" || {_unit getVariable ["ACE_isUnconscious", false]}) exitWith {false};
if (captive _unit || {_unit getVariable ["ACE_captives_isSurrendering", false]}) exitWith {false};

true
