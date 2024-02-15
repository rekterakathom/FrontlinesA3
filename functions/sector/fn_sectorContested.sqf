/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Runs the sector contesting logic

Parameters:
	"_sectorName" - Name of the sector
	"_sectorPos" - The position of the sector
	"_sectorType" - The type of the sector

Usage: ["Town McTownFace", [0, 0, 0], "NameVillage"] call FRLN_fnc_sectorContested;

Returns: Boolean - success
*/

if !(params [
	["_sectorName", "", [""]],
	["_sectorPos", [0,0,0], [[]]],
	["_sectorType", "", [""]]
]) exitWith {["Invalid parameters passed!"] call BIS_fnc_error; false};

private _eastUnitsNumber = 0;

private _playerUnitsNumber = {[_x] call FRLN_fnc_combatReady} count (["players", _sectorPos, 500] call FRLN_fnc_unitsInRadius);
if !(_playerUnitsNumber > 0) exitWith {};

waitUntil {
	sleep 10;
	_playerUnitsNumber = {[_x] call FRLN_fnc_combatReady} count (["players", _sectorPos, 500] call FRLN_fnc_unitsInRadius);
	_eastUnitsNumber = {[_x] call FRLN_fnc_combatReady} count (["east", _sectorPos, 500] call FRLN_fnc_unitsInRadius);

	((_eastUnitsNumber < _playerUnitsNumber) || _playerUnitsNumber == 0);
};

if (_playerUnitsNumber isEqualTo 0) exitWith {[format ["Frontlines: Sector %1 (%2) no players left to contest.", _sectorName, _sectorPos]] remoteExec ["FRLN_fnc_writeToLog", 2, false]; false};

FRLN_sectorStatus set [_sectorName, "Contested"];
["FRLN_sectorStatus"] call FRLN_fnc_broadcast;
[format ["Frontlines: Starting counter attack at Sector %1 (%2)", _sectorName, _sectorPos]] remoteExec ["FRLN_fnc_writeToLog", 2, false];

// Find furthest sector within 2000m
private _distance = 100;
private _furthestFound = [0, 0, 0];
{
	private _currentSectorName = _x # 0;
	private _currentSectorPos = _x # 1;

	if ((_sectorPos distance _currentSectorPos) < 2000 && {(_sectorPos distance _currentSectorPos) > _distance && (FRLN_sectorStatus get _currentSectorName) != "Contested"}) then {
		_furthestFound = _currentSectorPos;
	};
} forEach FRLN_allSectors;

// Spawn the counter-attack force on found location
private _directionToTarget = _furthestFound getDir _sectorPos;

// Recon guys spawn 300 meters closer
private _reconTeamUnits = [(_furthestFound getPos [300, _directionToTarget] findEmptyPosition [5, 30, "Land_HelipadSquare_F"]), FRLN_reconTeam] call FRLN_fnc_spawnFormation;
private _reconTeam = group (_reconTeamUnits # 0);
_reconTeam allowFleeing 0.35;
private _reconWP = _reconTeam addWaypoint [_sectorPos, 0];
_reconWP setWaypointType "MOVE";

private _mechTeamUnits = [_furthestFound findEmptyPosition [5, 30, "Land_HelipadSquare_F"], FRLN_mechSection] call FRLN_fnc_spawnFormation;
private _mechTeam = group (_mechTeamUnits # 0);
_mechTeam allowFleeing 0.35;
private _mechWP = _mechTeam addWaypoint [_sectorPos, 0];
_mechWP setWaypointType "MOVE";

private _infantryTeamUnits = [_furthestFound findEmptyPosition [5, 30, "Land_HelipadSquare_F"], FRLN_section] call FRLN_fnc_spawnFormation;
private _infantryTeam = group (_infantryTeamUnits # 0);
_infantry allowFleeing 0.35;
private _infantryWP = _infantryTeam addWaypoint [_sectorPos, 0];
_infantryWP setWaypointType "MOVE";

private _playerCount = 0;
waitUntil {
	sleep 10;
	_playerCount = {[_x] call FRLN_fnc_combatReady} count (["players", _sectorPos, 500] call FRLN_fnc_unitsInRadius);
	private _reconCount = {[_x] call FRLN_fnc_combatReady} count (units _reconTeam);
	private _mechCount = {[_x] call FRLN_fnc_combatReady} count (units _mechTeam);
	private _infantryCount = {[_x] call FRLN_fnc_combatReady} count (units _infantryTeam);

	(((_reconCount + _mechCount + _infantryCount) < _playerCount) || _playerCount == 0)
};

if (_playerCount == 0) exitWith {
	FRLN_sectorStatus set [_sectorName, "Cooldown"];
	["FRLN_sectorStatus"] call FRLN_fnc_broadcast;
	[format ["Frontlines: Sector capture failed at Sector %1 (%2)", _sectorName, _sectorPos]] remoteExec ["FRLN_fnc_writeToLog", 2, false];
};

FRLN_sectorStatus set [_sectorName, "Captured"];
["FRLN_sectorStatus"] call FRLN_fnc_broadcast;
[format ["Frontlines: Sector %1 (%2) has been captured by BLUFOR", _sectorName, _sectorPos]] remoteExec ["FRLN_fnc_writeToLog", 2, false];

// Reward all players who took part in the capture
private _playersInRadius = ["players", _sectorPos, 500] call FRLN_fnc_unitsInRadius;
{
	private _capturedSectors = _x getVariable ["FRLN_capturedSectorCount", 0];
	_x setVariable ["FRLN_capturedSectorCount", _capturedSectors + 1, true];
	[_x] call FRLN_fnc_savePlayerData;
} forEach _playersInRadius;

missionProfileNamespace setVariable ["savedSectorStatus", FRLN_sectorStatus];

true
