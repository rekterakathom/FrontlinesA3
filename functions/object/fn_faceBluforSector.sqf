/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Turn object towards the nearest blufor sector.
	Useful because often times it's better to face towards the enemy

Parameters:
	"_object" - Object to face

Usage: [bobsCar] call FRLN_fnc_faceBluforSector

Returns: Boolean - Successful
*/

params [
	["_object", objNull, [objNull]]
];

if (isNull _object) exitWith {diag_log "Frontlines: Null object passed to fn_faceBluforSector."; false};

private _nearestBluSector = [(getPosATL _object), west] call FRLN_fnc_findNearestSector;
if (_nearestBluSector isNotEqualTo []) then {
	_object setDir (_object getDir _nearestBluSector);
	true
} else {
	false
};
