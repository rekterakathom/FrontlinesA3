/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Saves data for a specific player

Parameters:
	"_playerUnit" - The unit to save data of

Usage: [player] call FRLN_fnc_savePlayerData;

Returns: Boolean - success
*/

if !(params [
	["_playerUnit", objNull, [objNull]]
]) exitWith {["Invalid unit passed!"] call BIS_fnc_error};

private _saveData = createHashMap;

{
	// Only save FRLN variables that aren't nil
	if (!(isNil {_playerUnit getVariable _x}) && _x == "frln") then {
		_saveData set [_x, _playerUnit getVariable _x];
	};
} forEach allVariables _playerUnit;

FRLN_playerData set [hashValue (name _playerUnit), _saveData];
["FRLN_playerData"] call FRLN_fnc_broadcast;
missionProfileNamespace setVariable ["playerData", FRLN_playerData];

true
