/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Server-side initialization of a joining player

Parameters:
	"_playerUnit" - The player unit

Usage: [player] call FRLN_fnc_initPlayerServer;

Returns: Boolean - success
*/

if !(params [
	["_playerUnit", objNull, [objNull]]
]) exitWith {["Invalid unit passed!"] call BIS_fnc_error; false};

private _playerData = FRLN_playerData getOrDefault [hashValue _playerUnit, createHashMap];

{
	// Double check that we are only working with FRLN variables
	if ((toLowerANSI _x) select [0, 3] == "frln") then {
		_playerUnit setVariable [_x, _y, true];
	};
} forEach _playerData;

true
