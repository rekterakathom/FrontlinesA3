params ["_newUnit", "_oldUnit", "_respawnType", "_respawnDelay"];
[1, "BLACK", 2, 1] spawn BIS_fnc_fadeEffect;

("FRLN_rankHud_layer" call BIS_fnc_rscLayer) cutRsc ["FRLN_rankHud", "PLAIN"];
[_newUnit, true] spawn FRLN_fnc_setPlayerRank;

private _branch = _oldUnit getVariable ["FRLN_branch", ""];
[_newUnit, _branch, true] call FRLN_fnc_setPlayerBranch;

_newUnit setUnitLoadout (getUnitLoadout _oldUnit);

_newUnit allowDamage false;
_newUnit setPosASL (getPosASL default_respawn_pos);
sleep 1;
_newUnit allowDamage true;

