/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Calculates the difficulty scaled for player count
	and broadcasts it

Parameters:
	-

Usage: [] call FRLN_fnc_difficultyScaling;

Returns: Scalar - The new difficulty
*/

private _playerCount = count ([] call CBA_fnc_players);

// 0.1 * (4*log(2x)))where x is players divided by a 100
// Failsafe so it never goes above 0.9 skill. That would require 50 players on the server.
FRLN_aiDifficultyAddition = (0.1 * (4 + log(2 * (_playerCount / 100)))) min 0.9;

["FRLN_aiDifficultyAddition"] call FRLN_fnc_broadcast;

FRLN_aiDifficultyAddition
