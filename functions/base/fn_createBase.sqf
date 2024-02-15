/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Check conditions and establish a base if ok

Parameters:
	NONE

Usage: [] call FRLN_fnc_hudLoop;

Returns: Nothing
*/

params ["_target", "_caller", "_actionId", "_arguments"];

if (_target distance default_respawn_pos < 2000) exitWith {hint "Too close to main HQ!"};
if !(alive _target) exitWith {hint "FOB Crate is destroyed!"};