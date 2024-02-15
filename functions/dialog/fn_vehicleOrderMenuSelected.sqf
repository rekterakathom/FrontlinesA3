params ["_control", "_lbCurSel", "_lbSelection"];

private _indexData = uiNamespace getVariable ["FRLN_vehOrderListIndexes", []];
private _vehClassname = (_indexData # _lbCurSel) # 0;

private _descriptionControl = (findDisplay 71684) displayCtrl 71688;
_descriptionControl ctrlSetText ((getText (configFile >> "CfgVehicles" >> _vehClassname >> "displayName")) + format [" - %1WP", (_indexData # _lbCurSel) # 1]);

private _pictureControl = (findDisplay 71684) displayCtrl 71689;
_pictureControl ctrlSetText (getText (configFile >> "CfgVehicles" >> _vehClassname >> "editorPreview"));

uiNamespace setVariable ["FRLN_vehOrderSelected", _lbCurSel];