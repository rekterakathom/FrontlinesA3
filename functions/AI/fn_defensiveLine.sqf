/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Forms an edge-of-field defensive line as well as they can

Parameters:
	"_defenseDir" - Direction to defend from
	"_defenseDist" - Distance to defend at
	"_group" - Group doing the defending

Usage: 

Returns: Boolean - success
*/

params [
	["_defenseDir", 0],
	["_defenseDist", 100],
	["_group", grpNull]
];

if (isNull _group) exitWith {diag_log "Frontlines: fn_defensiveLine: Null group passed!"; false};

private _fieldLookUp = (leader _group) getPos [_defenseDist, _defenseDir];

// Get the most open and deadly place possible
// Use the distance as the radius minus 15 so the start pos can't be included
private _openField = selectBestPlaces [_fieldLookUp, 50, "2*meadow * deadBody * (1-houses) * (1-forest)", 25, 1];

if (_openField isEqualTo []) exitWith {diag_log "Frontlines: fn_defensiveLine: Failed to find _openField!"; false};

// This is where we will set up shop so we can shoot into the field
// The killzone size (accuracy of previous check) is 50 meters and the accuracy of this one is 20 meters, so move 70 meters to avoid overlap
// This way we are at "the edge of the field"
private _fieldEdge = selectBestPlaces [((_openField # 0 # 0) getPos [50, ((_openField # 0 # 0) getDir (leader _group))]), 10, "3*trees * forest * (1-deadBody) * (1-houses)", 5, 1];

if (_fieldEdge isEqualTo []) exitWith {diag_log "Frontlines: fn_defensiveLine: Failed to find _fieldEdge!"; false};

_group setFormation "LINE"; // Line formation to fire into the field
_group move ((_fieldEdge # 0) # 0);

// Crouch please
{
	_x setUnitPos "MIDDLE";
} forEach (units _group);

// Give them 30 seconds to move to target
[(_fieldEdge # 0 # 0) getDir (_openField # 0 # 0), _group] spawn {
	params ["_faceDir", "_group"];
	sleep 45;
	_group setFormDir _faceDir;
};

true
