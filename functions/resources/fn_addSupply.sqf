/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Adds or reduces the amount of supplies available.

Parameters:
	

Usage: 

Returns: Boolean - success
*/

// Validate input
if !(params [
	["_supply", 0, [0]]
]) exitWith {["Invalid parameters passed!"] call BIS_fnc_error; false};

// Ensure bounds
FRLN_supplies = (0 max _supply min 1000);
["FRLN_supplies"] call FRLN_fnc_broadcast;

true
