/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Checks if a given side or players are present at given area

Parameters:
	"_side" - The side to check the presence of
	"_position" - The position to check
	"_radius" - The radius to check

Usage: ["players", _sectorPos, 500] call FRLN_fnc_unitsInRadius;

Returns: Array - Units in radius
*/

// Validate input
if !(params [
	["_side", "west", [""]],
	["_position", [0, 0, 0], [[]], [2, 3]],
	["_radius", 0, [0]]
]) exitWith {["Invalid parameters passed!"] call BIS_fnc_error; []};

private _allUnits = switch (toLowerANSI _side) do {
	case "players": {allPlayers - entities "HeadlessClient_F"};
	case "west": {units west};
	case "east": {units east};
	case "civilian": {units civilian};
	case "resistance": {units resistance};
	default {[]};
};

private _unitsInRadius = [];
{
	if (alive _x && (_x distance2D _position) < _radius) then {
		_unitsInRadius pushBack _x;
	};
} forEach _allUnits;

_unitsInRadius
