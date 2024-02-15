/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
    Returns the machine ID of the least loaded headless client
    For use with remoteExec

Parameters:
	NONE

Usage: [] call FRLN_fnc_getLeastLoadedHC;

Returns: The machine ID of the least loaded headless client
*/

#define SERVER 2

// No headless clients - exit with server
if (isNil "frln_hc_1" && isNil "frln_hc_2") exitWith {SERVER};

private _hcArray = [];
{
    private _hc = _x;
    _hcArray pushBack [count (allUnits select {(owner _x) isEqualTo (owner _hc)}), _hc];
} forEach (entities "HeadlessClient_F");

if (_hcArray isNotEqualTo []) then {
    _hcArray sort true;
    owner ((_hcArray # 0) # 1)
} else {
    SERVER
};
