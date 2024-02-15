/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Finds an empty position with given params
	Unlike the command version, always returns something

Parameters:
	"_center" - Search center
	"_areaRadius" - Minimum area to be empty
	"_maxDistance" - Maximum search distance
	"_vehicleType" - Vehicle to accomodate

Usage: ["Hello World!"] call FRLN_fnc_writeToLog;

Returns: Array - Empty position
*/

params [
	["_center", [0, 0, 0], [[]]],
	["_areaRadius", 0, [0]],
	["_maxDistance", 1, [0]],
	["_vehicleType", "", [""]]
];

// First attempt a straight up search
// _vehicleType is not allowed to be an empty string
private _firstAttempt = [];
if (_vehicleType isEqualTo "") then {
	_firstAttempt = _center findEmptyPosition [_areaRadius, _maxDistance];
} else {
	_firstAttempt = _center findEmptyPosition [_areaRadius, _maxDistance, _vehicleType];
};
if (_firstAttempt isNotEqualTo []) exitWith {_firstAttempt};

// Try to find any position
// _vehicleType is not allowed to be an empty string
private _secondAttempt = [];
if (_vehicleType isEqualTo "") then {
	_secondAttempt = _center findEmptyPosition [0, _maxDistance];
} else {
	_secondAttempt = _center findEmptyPosition [0, _maxDistance, _vehicleType];
};
if (_secondAttempt isNotEqualTo []) exitWith {_secondAttempt};

diag_log format ["Frontlines: fn_findEmptyPosition: Failed to find an empty position at %1!", _center];

// Didn't find anything. Return center
_center
