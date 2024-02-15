/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Creates an unit of any side to OPFOR

Parameters:
	"_unitClass" - Classname of the unit

Usage: ["soldier_F"] call FRLN_fnc_createManagedUnit

Returns: Object - The created unit
*/

params [
	["_unitClass", "", [""]],
	["_unitPosition", [0,0,0], []],
	["_unitGroup", grpNull, [grpNull]]
];

if (
	_unitClass isEqualTo ""
	|| isNull _unitGroup
	|| _unitPosition isEqualTo [0,0,0]
) exitWith {objNull};

// A temporary group is created to hold the unit -
// So it can be later given to the appropiate side
private _tempGroup = createGroup civilian;
private _createdUnit = _tempGroup createUnit [_unitClass, _unitPosition, [], 0, "NONE"];
[_createdUnit] joinSilent _unitGroup;
deleteGroup _tempGroup;

// Mission-side unit skill
_createdUnit setSkill (0.5 + FRLN_aiDifficultyAddition);

_createdUnit
