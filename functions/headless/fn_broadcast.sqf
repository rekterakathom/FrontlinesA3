/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Reliably broadcasts a variable to the server and all -
	headless clients

Parameters:
	"_varToBroadcast" - The name of the variable to broadcast

Usage: ["FRLN_sectorData"] call FRLN_fnc_broadcast;

Returns: Boolean - success
*/

if !(params [
	["_varToBroadcast", "", [""]]
]) exitWith {false};

if !(isNil "frln_hc_1") then {(owner frln_hc_1) publicVariableClient _varToBroadcast};
if !(isNil "frln_hc_2") then {(owner frln_hc_2) publicVariableClient _varToBroadcast};

publicVariableServer _varToBroadcast;

true
