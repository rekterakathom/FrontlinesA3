params [
	["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {diag_log "Frontlines: Tried to delete a null unit"};

// objectParent is more reliable than vehicle, see biki.
private _unitObjectParent = objectParent _unit;

// Unit is not in a vehicle and can be deleted.
if (isNull _unitObjectParent) exitWith {
	deleteVehicle _unit;
	true;
};

// Unit is in a local vehicle and can be deleted.
if (local _unitObjectParent) exitWith {
	_unitObjectParent deleteVehicleCrew _unit;
	true;
};

// Vehicle isn't local, execute where it is.
[_unit] remoteExecCall ["FRLN_fnc_cleanupUnit", _unitObjectParent, false];
false