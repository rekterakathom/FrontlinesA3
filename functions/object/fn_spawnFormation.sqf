/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Spawns a group in formation

Parameters:
	"_spawnPosition" - The position to spawn the group at
	"_groupComposition" - The composition of the group

Usage: [_sectorPos findEmptyPosition [5, 30, "Land_HelipadSquare_F"], FRLN_section] call FRLN_fnc_spawnFormation;

Returns: Array - The created units
*/

if !(params [
	["_spawnPosition", [0,0,0], [[]]],
	["_groupComposition", [], []]
]) exitWith {["Invalid parameters passed!"] call BIS_fnc_error; []};

private _return = [];

private _offset = 0;
private _group = createGroup [east, true];
for "_i" from 0 to ((count _groupComposition) - 1) do {
	private _unitType = _groupComposition # _i;
	private _finalPos = [
			([(_spawnPosition # 0) + _offset, (_spawnPosition # 0) - _offset] select (_i % 2 == 0)),
			(_spawnPosition # 1) - _offset,
			_spawnPosition # 2
		];
	private _createdUnit = objNull;
	if !(_unitType isKindOf "LandVehicle") then {
		_createdUnit = [_unitType, _finalPos, _group] call FRLN_fnc_createManagedUnit;
		_return pushBack _createdUnit;
	} else {
		private _createdVehicle = createVehicle [_unitType, _finalPos, [], 0, "NONE"];
		private _createdCrew = createVehicleCrew _createdVehicle;
		(units _createdCrew) joinSilent _group;
		_return append (units _createdCrew);
	};
	_return pushBack _createdUnit;
	_offset = _offset + 3;
};

_return
