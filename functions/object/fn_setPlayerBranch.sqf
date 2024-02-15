/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Gives the player the requested branch along with its perks and insignia

Parameters:
	"_playerUnit" - The player unit to set the branch for
	"_branch" - The name of the branch to give
	"_silent" - Display a notification

Usage: [player, "infantry"] call FRLN_fnc_setPlayerBranch;

Returns: Boolean - Successful
*/

params [
	["_unit", objNull, [objNull]],
	["_branch", "", [""]],
	["_silent", true, [true]]
];

// Enforce lower case
_branch = toLowerANSI _branch;

// Reset perks
_unit setUnitTrait ["audibleCoef", 1];
_unit setUnitTrait ["camouflageCoef", 1];
_unit setUnitTrait ["loadCoef", 1];
_unit setUnitTrait ["engineer", false];
_unit setUnitTrait ["medic", false];
_unit setUnitTrait ["explosiveSpecialist", false];
_unit setUnitTrait ["UAVHacker", false];

if (_branch == "") exitWith {};

// Set insignia
// Custom insignias would be great
private _insignia = "";
switch (_branch) do {
	case "infantry": {_insignia = "AAF_1stRegiment"};
	case "recon": {_insignia = "EAF_5thRegiment"};
	case "support": {_insignia = "AAF_3rdRegiment"};
};
[_unit, _insignia] call BIS_fnc_setUnitInsignia;

// Give perks
private _abilities = switch (_branch) do {
	case "infantry": {
		// Can carry more, but less stealthy
		_unit setUnitTrait ["loadCoef", ((_unit getUnitTrait "loadCoef") * 0.8)];
		_unit setUnitTrait ["audibleCoef", ((_unit getUnitTrait "audibleCoef") * 1.1)];
		_unit setUnitTrait ["camouflageCoef", ((_unit getUnitTrait "camouflageCoef") * 1.1)];
		"<br/>-Weight impacts your stamina less<br/>-You are easier to see and hear";
	};
	case "recon": {
		// More stealthy
		_unit setUnitTrait ["audibleCoef", ((_unit getUnitTrait "audibleCoef") * 0.8)];
		_unit setUnitTrait ["camouflageCoef", ((_unit getUnitTrait "camouflageCoef") * 0.8)];
		"<br/>-You are harder to see and hear";
	};
	case "support": {
		// Everything useful
		_unit setUnitTrait ["engineer", true];
		_unit setUnitTrait ["medic", true];
		_unit setUnitTrait ["explosiveSpecialist", true];
		_unit setUnitTrait ["UAVHacker", true];
		"<br/>-Engineer training<br/>-Explosive specialist training<br/>-Medic training<br/>-UAV hacker training";
	};
};

// Set variable
_unit setVariable ["FRLN_branch", _branch];

// Tell player that their branch has changed
if !(_silent) then {
	private _cfgInsignia = [["CfgUnitInsignia", _insignia], configNull] call BIS_fnc_loadClass;
	private _insigniaPicture = getText (_cfgInsignia >> "texture");
	hint parseText format ["<img size=4 image='%1'/><br/><t size='2'>You are now in %2</t><t size='1'>%3</t>", _insigniaPicture, _branch, _abilities];
};

true