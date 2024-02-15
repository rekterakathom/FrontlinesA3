/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Handles all healing

Parameters:
	"_caller",
	"_target",
	"_selectionName",
	"_className",
	"_itemUser",
	"_usedItem"

Usage: [] call FRLN_fnc_healedHandler;

Returns: Boolean - success
*/

params [
	"_caller",
	"_target",
	"_selectionName",
	"_className",
	"_itemUser",
	"_usedItem"
];

if (_caller == _target) exitWith {false};
if !(isPlayer _caller) exitWith {false};

private _healCounter = _caller getVariable ["FRLN_healedCount", 0];
_caller setVariable ["FRLN_healedCount", _healCounter + 1];

true
