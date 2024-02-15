/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Calculates a military rank for a player

Parameters:
	"_playerUnit" - The player unit to calculate a rank for
	"_silent" - Whether to display a notification

Usage: [player] call FRLN_fnc_setPlayerRank;

Returns: String - The given rank
*/

if !(params [
	["_playerUnit", objNull, [objNull]],
	["_silent", true, [true]]
]) exitWith {["Invalid unit passed!"] call BIS_fnc_error; "PRIVATE"};

// Get the current rank
private _playerRank = _playerUnit getVariable ["FRLN_rank", 0];

// Get a base value for rank from captured sectors
private _playerSectorCount = _playerUnit getVariable ["FRLN_capturedSectorCount", 0];
private _playerNewRank = floor (_playerSectorCount / 3);

// Add up the amount of defeated enemy units
// Every 100 enemies defeated equals a promotion
private _killedUnitCount = _playerUnit getVariable ["FRLN_enemiesKilled", 0];
_playerNewRank = _playerNewRank + (floor (_killedUnitCount / 100));

// Add the amount from medical aid
// Every 50 successful treatments of others equals a promotion
private _healedCount = _playerUnit getVariable ["FRLN_healedCount", 0];
_playerNewRank = _playerNewRank + (floor (_healedCount / 50));

// Deduct the amount from civilian destruction
// Every 5 buildings destroyed equals a demotion
private _civBuildingsDestroyed = _playerUnit getVariable ["FRLN_buildingsDestroyed", 0];
_playerNewRank = _playerNewRank + (floor (_civBuildingsDestroyed / 5));

// Deduct the amount from friendly fire
// Every 10 friendlies killed equals a demotion
private _killedFriendlyCount = _playerUnit getVariable ["FRLN_friendliesKilled", 0];
_playerNewRank = _playerNewRank - (floor (_killedFriendlyCount / 10));

// Make sure we stay in bounds
if (_playerNewRank < 0) then {_playerNewRank = 0};
if (_playerNewRank > 6) then {_playerNewRank = 6};

switch (_playerNewRank) do {
	case 1: {_playerUnit setUnitRank "CORPORAL"};
	case 2: {_playerUnit setUnitRank "SERGEANT"};
	case 3: {_playerUnit setUnitRank "LIEUTENANT"};
	case 4: {_playerUnit setUnitRank "CAPTAIN"};
	case 5: {_playerUnit setUnitRank "MAJOR"};
	case 6: {_playerUnit setUnitRank "COLONEL"};
	default {_playerUnit setUnitRank "PRIVATE"};
};

// If unit received a promotion / demotion then notify
if !(_silent) then {
	if (_playerNewRank != _playerRank) then {
		if (_playerNewRank > _playerRank) then {
			hint "Congratulations, you have been promoted!";
		} else {
			hint "You have been demoted";
		};
	};
};

// Return the new rank as a string
rank _playerUnit
