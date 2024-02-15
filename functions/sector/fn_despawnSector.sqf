/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Deletes sector units and collects garbage

Parameters:
	"_sectorName" - Name of the sector
	"_sectorPos" - The position of the sector
	"_sectorType" - The type of the sector

Usage: ["Town McTownFace", [0, 0, 0], "NameVillage"] call FRLN_fnc_despawnSector;

Returns: Boolean - success
*/

if !(params [
	["_sectorName", "", [""]],
	["_sectorPos", [0,0,0], [[]]],
	["_sectorType", "", [""]]
]) exitWith {["Invalid parameters passed!"] call BIS_fnc_error; false};

private _units = FRLN_sectorUnits getOrDefault [_sectorName, []];

// Ensure proper deletion for groups, object arrays and objects alike
{
	private _current = _x;
	if (_current isEqualType grpNull) then {
		{
			if (_x isKindOf "CAManBase") then {
				[_x] call FRLN_fnc_cleanupUnit;
			} else {
				deleteVehicleCrew _x;
				deleteVehicle _x;
			};
		} forEach (units _current);
	} else {
		if (_x isEqualType []) then {
			{
				if (_x isKindOf "CAManBase") then {
					[_x] call FRLN_fnc_cleanupUnit;
				} else {
					deleteVehicleCrew _x;
					deleteVehicle _x;
				};
			} forEach _x;
		} else {
			if (_x isKindOf "CAManBase") then {
				[_x] call FRLN_fnc_cleanupUnit;
			} else {
				deleteVehicleCrew _x;
				deleteVehicle _x;
			};
		};
	};
} forEach _units;

// Remove garbage
// To-do, make this it's own function
private _list = nearestObjects [_sectorPos, ["WeaponHolder", "WeaponHolderSimulated", "GroundWeaponHolder"], 500];
{deleteVehicle _x} forEach _list;

FRLN_sectorUnits set [_sectorName, []];
["FRLN_sectorUnits"] call FRLN_fnc_broadcast;
FRLN_sectorStatus set [_sectorName, "Inactive"];
["FRLN_sectorStatus"] call FRLN_fnc_broadcast;

[format ["Frontlines: Despawned Sector %1 (%2)", _sectorName, _sectorPos]] remoteExec ["FRLN_fnc_writeToLog", 2, false];

true
