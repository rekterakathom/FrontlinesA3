// Handle HC connection here
if !(hasInterface) exitWith {};

// Workaround for initPlayerServer.sqf sucking
0 spawn {
	waitUntil {!isNull player};
	[player, didJIP] remoteExec ["FRLN_fnc_initPlayerServer", 2];

	[player, true] call FRLN_fnc_setPlayerRank;
};

// If ace is loaded then add the healedhandler
if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then {
	private _healedHandler = ["ace_treatmentSucceded", FRLN_fnc_healedHandler] call CBA_fnc_addEventHandler;
};

[] spawn FRLN_fnc_hudLoop;
call compileScript ["diaryEntries.sqf"]; // compileScript instead of function - we don't want this to stay in memory

// addActions
enlisting_board addAction ["Infantry", {[player, "infantry", false] call FRLN_fnc_setPlayerBranch}];
enlisting_board addAction ["Recon", {[player, "recon", false] call FRLN_fnc_setPlayerBranch}];
enlisting_board addAction ["Support", {[player, "support", false] call FRLN_fnc_setPlayerBranch}];
