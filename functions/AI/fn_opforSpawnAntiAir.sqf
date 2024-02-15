/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Spawn a new anti-air installation

Parameters:

Usage: 

Returns: Boolean - Successful
*/

private _worldSizeHalf = worldSize / 2;
private _size = (sqrt((_worldSizeHalf^2)*2));
private _centerCoord = [_worldSizeHalf, _worldSizeHalf];
private _dist = random [_worldSizeHalf * 0.35, _worldSizeHalf * 0.5, _worldSizeHalf * 0.65];

private _deployPosition = [];

for "_i" from 0 to 30 do {
	private _approxPos = _centerCoord getPos [_dist, random 360];
	private _testPos = _approxPos findEmptyPosition [10, 100];
	if (_testPos isNotEqualTo [] && !(surfaceIsWater _testPos) && {_testPos distance2D ([_testPos, west] call FRLN_fnc_findNearestSector) > 1500}) exitWith {_deployPosition = _testPos};
};

if (_deployPosition isEqualTo []) exitWith {diag_log "Frontlines: Failed to spawn anti-air installation"; false};

private _antiAir = createVehicle [FRLN_antiair, _deployPosition, [], 0, "NONE"];
private _antiAircrew = createVehicleCrew _antiAir;
FRLN_OPFOR_antiAirList pushBack _antiAir;

[_antiAir] call FRLN_fnc_faceBluforSector;

private _guardUnits = [_deployPosition getPos [50, random 360], FRLN_fireTeam] call FRLN_fnc_spawnFormation;

_antiAir setVariable ["FRLN_crew", _antiAircrew];
_antiAir setVariable ["FRLN_guard", _guardUnits];

true
