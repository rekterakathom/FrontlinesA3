/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Spawn a new artillery installation

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

if (_deployPosition isEqualTo []) exitWith {diag_log "Frontlines: Failed to spawn artillery installation"; false};

private _artillery = createVehicle [FRLN_artillery, _deployPosition, [], 0, "NONE"];
private _artilleryCrew = createVehicleCrew _artillery;
[_artilleryCrew] call lambs_wp_fnc_taskArtilleryRegister;
FRLN_OPFOR_artilleryList pushBack _artillery;

[_artillery] call FRLN_fnc_faceBluforSector;

// Guard units are AA to protect the arty from aerial threats
private _guardUnits = [_deployPosition getPos [50, random 360], FRLN_AA_fireTeam] call FRLN_fnc_spawnFormation;

_artillery setVariable ["FRLN_crew", _artilleryCrew];
_artillery setVariable ["FRLN_guard", _guardUnits];

true
