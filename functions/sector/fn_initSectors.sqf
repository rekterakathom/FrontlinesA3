/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Finds every sector, adds markers to them and returns arrays of sectors.

Parameters:
	NONE

Usage: [] call LIB_fnc_initSectors;

Returns: List of towns in type:
	[Name, position, type]
*/


if (!isServer) exitWith {[]};

private _worldSizeHalf = worldSize / 2;
private _size = (sqrt((_worldSizeHalf^2)*2));
private _centerCoord = [_worldSizeHalf, _worldSizeHalf];

private _townArray = nearestlocations [_centerCoord, ["NameVillage", "NameCity", "NameCityCapital"], _size]; // Every village on map
private _townNameArray = [];
{
	private _current = [];
	_current pushBack (className _x);
	private _pos2D = (locationPosition _x); _pos2D set [2,0];
	_current pushBack _pos2D;
	_current pushBack (type _x);
	_townNameArray pushBack _current;
} forEach _townArray;

{
	private _name = _x # 0;
	private _pos = _x # 1;
	private _type = _x # 2;
	private _marker = createMarkerLocal [_name, _pos];
	_marker setMarkerColorLocal "ColorEAST";
	private _areaMarker = createMarkerLocal [_name + "area", _pos];
	_areaMarker setMarkerColorLocal "ColorEAST";
	_areaMarker setMarkerShape "ELLIPSE";
	_areaMarker setMarkerBrush "SolidBorder";
	_areaMarker setMarkerSize [500, 500];
	_areaMarker setMarkerAlpha 0.33;
	switch (_type) do {
		case "NameVillage": {_marker setMarkerType "n_unknown"};
		case "NameCity": {_marker setMarkerTypeLocal "n_art"; _marker setMarkerSize [1.25, 1.25]};
		case "NameCityCapital": {_marker setMarkerTypeLocal "n_uav"; _marker setMarkerSize [1.50, 1.50]};
		case "Hill": {_marker setMarkerType "loc_transmitter"};
	};
} forEach _townNameArray;

// Preload empty positions to reduce lagspikes later on
[_townNameArray] spawn {
	params ["_townNameArray"];
	diag_log "Frontlines: Starting zone preloading.";
	private _startTime = diag_tickTime;
	{
		_x params [
			["_sectorName", "", [""]],
			["_sectorPos", [0,0,0], [[]]],
			["_sectorType", "NameVillage", [""]]
		];

		_sectorPos findEmptyPositionReady [0, 100];
	} forEach _townNameArray;
	diag_log format ["Frontlines: Finished zone preloading in %1", diag_tickTime - _startTime];
};

_townNameArray
