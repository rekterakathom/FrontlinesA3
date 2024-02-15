/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Find the position of the nearest sector

Parameters:
	"_searchPos" - Pos to search from
	"_searchSide" - Which side the sector needs to belong to

Usage: 

Returns: Position of the closest sector that meets conditions
*/

params [
	["_searchPos", [0,0,0]],
	["_searchSide", civilian] // This way we'll include all sectors
];

if (_searchPos isEqualTo [0,0,0]) exitWith {diag_log "Frontlines: fn_findNearestSector: Invalid position argument!"; [0,0,0]};
if (_searchPos isEqualType objNull) then {_searchPos = getPosASL _searchPos}; // Ensure that it's a position array so we can use vectorDistance
 _searchPos set [2,0]; // Make sure it's 2D

private _closestDistance = 999999;
private _closest = [0,0,0];

{
	_x params [
		["_sectorName", "", [""]],
		["_sectorPos", [0,0,0], [[]]],
		["_sectorType", "NameVillage", [""]]
	];

	private _sectorStatus = FRLN_sectorStatus getOrDefault [_sectorName, "Inactive", true];

	if (_searchSide isEqualTo west && _sectorStatus != "Captured") then {continue};
	if (_searchSide isEqualTo east && _sectorStatus == "Captured") then {continue};

	if ((_sectorPos vectorDistance _searchPos) < _closestDistance) then {
		_closest = _sectorPos;
		_closestDistance = _sectorPos vectorDistance _searchPos;
	};
} forEach FRLN_allSectors;

_closest
