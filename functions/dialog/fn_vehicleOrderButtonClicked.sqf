params ["_control"];

private _indexData = uiNamespace getVariable ["FRLN_vehOrderListIndexes", []];
private _selected = uiNamespace getVariable ["FRLN_vehOrderSelected", 0];
private _vehClassname = (_indexData # _selected) # 0;


private _veh = createVehicle [_vehClassname, FRLN_groundVehSpawn, [], -1, "NONE"];

if !(isNull _veh) then {
	_veh setDir (getDir FRLN_groundVehSpawn);

	private _vehName = (getText (configFile >> "CfgVehicles" >> _vehClassname >> "displayName"));
	[playerSide, "HQ"] commandChat format ["Request for %1 authorized, vehicle will be provided ASAP.", _vehName];
} else {
	[playerSide, "HQ"] commandChat format ["Request for %1 authorized, vehicle delivery failed.", _vehName];
};

closeDialog 1;
