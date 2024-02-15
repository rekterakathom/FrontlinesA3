/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Spawns units for a sector

Parameters:
	"_sectorName" - Name of the sector
	"_sectorPos" - The position of the sector
	"_sectorType" - The type of the sector

Usage: ["Town McTownFace", [0, 0, 0], "NameVillage"] call FRLN_fnc_spawnSector;

Returns: Boolean - success
*/

if !(params [
	["_sectorName", "", [""]],
	["_sectorPos", [0,0,0], [[]]],
	["_sectorType", "", [""]]
]) exitWith {["Invalid parameters passed!"] call BIS_fnc_error; false};

// Create the sections
private _firstSectionPosition = [_sectorPos getPos [random [10, 20, 30], random 360], 5, 30] call FRLN_fnc_findEmptyPosition;
private _firstSectionUnits = [_firstSectionPosition, FRLN_section] call FRLN_fnc_spawnFormation;

private _secondSectionPosition = [_sectorPos getPos [random [10, 20, 30], random 360], 5, 30] call FRLN_fnc_findEmptyPosition;
private _secondSectionUnits = [_secondSectionPosition, FRLN_section] call FRLN_fnc_spawnFormation;

private _fireTeamPosition = [_sectorPos getPos [random [10, 20, 30], random 360], 5, 30] call FRLN_fnc_findEmptyPosition;
private _fireTeamUnits = [_fireTeamPosition, FRLN_fireTeam] call FRLN_fnc_spawnFormation;

private _firstSection = group (_firstSectionUnits # 0);
private _secondSection = group (_secondSectionUnits # 0);
private _fireTeam = group (_fireTeamUnits # 0);

// Give orders
[_firstSection, _sectorPos, 150, [], false, false, 4, false] call lambs_wp_fnc_taskGarrison;

// Second section will usually guard the expected enemy direction if it's known
private _nearestBluforSector = [_sectorPos, west] call FRLN_fnc_findNearestSector;
if (_nearestBluforSector isNotEqualTo [0,0,0]) then {
	private _defensiveLineSuccess = [_sectorPos getDir _nearestBluforSector, 100, _secondSection] call FRLN_fnc_defensiveLine;
	if !(_defensiveLineSuccess) then {
		// If the defensiveLine order fails, fall back to the garrison
		[_secondSection, _sectorPos, 150, [], false, false, -1, false] call lambs_wp_fnc_taskGarrison;
	};
} else {
	// Alternatively make a loose garrison
	[_secondSection, _sectorPos, 150, [], false, false, -1, false] call lambs_wp_fnc_taskGarrison;
};

[_fireTeam, 500, 60, [], _sectorPos, true, true, 2] call lambs_wp_fnc_taskHunt; // Makes the patrols unrealistic but effective
_fireTeam setVariable ["lambs_danger_enableGroupReinforce", true, true];

// Spawn the fireteam vehicle
private _sectorVehicleType = selectRandomWeighted FRLN_sectorLightVehicles;
private _vehiclePos = [_sectorPos, 10, 75, _sectorVehicleType] call FRLN_fnc_findEmptyPosition;
private _sectorVehicle = createVehicle [_sectorVehicleType, _vehiclePos, [], 0, "NONE"];
_fireTeamUnits pushBack _sectorVehicle;
//_fireTeam addVehicle _sectorVehicle; // Add the vehicle to the fireteams motorpool

// Spawn static(s)
private _staticType = selectRandom FRLN_sectorStatics;
private _staticPos = [_sectorPos, 10, 75, _staticType] call FRLN_fnc_findEmptyPosition;
private _sectorStatic = createVehicle [_staticType, _staticPos, [], 0, "NONE"];
private _staticUnits = [];
private _staticCrew = createVehicleCrew _sectorStatic;
_staticUnits append (units _staticCrew);
_staticUnits pushBack _sectorStatic;
[_sectorStatic] call FRLN_fnc_faceBluforSector;

// Check if the static is an artillery piece and if it is, register it as such
if (getNumber (configOf _sectorStatic >> "artilleryScanner") > 0) then {
	[_staticCrew] call lambs_wp_fnc_taskArtilleryRegister;
};


FRLN_sectorUnits set [_sectorName, [_firstSectionUnits, _secondSectionUnits, _fireTeamUnits, _staticUnits]];
FRLN_sectorStatus set [_sectorName, "Active"];
["FRLN_sectorUnits"] call FRLN_fnc_broadcast;
["FRLN_sectorStatus"] call FRLN_fnc_broadcast;

[format ["Frontlines: Spawned Sector %1 (%2)", _sectorName, _sectorPos]] remoteExec ["FRLN_fnc_writeToLog", 2, false];

true
