/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Initialise the vehicle order menu

Parameters:

Usage: [] call FRLN_fnc_initVehicleOrderMenu;

Returns: 
*/

disableSerialization;

createDialog "FRLN_orderVehicleGUI";

private _vehIndexes = [];
{
	private _name = getText (configFile >> "CfgVehicles" >> (_x # 0) >> "displayName");
	private _index = lbAdd [71685, _name];
	_vehIndexes set [_index, _x];
} forEach FRLN_groundVehOrderList;

uiNamespace setVariable ["FRLN_vehOrderListIndexes", _vehIndexes];
