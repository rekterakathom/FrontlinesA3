/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Player has joined the mission EH

Parameters:
	id: Number - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
    uid: String - getPlayerUID of the joining client. The same as Steam ID (same as _uid param)
    name: String - profileName of the joining client (same as _name param)
    jip: Boolean - didJIP of the joining client (same as _jip param)
    owner: Number - owner id of the joining client (same as _owner param)
    idstr: String - same as id but in string format, so could be exactly compared to user marker ids

Usage: ;

Returns: Boolean - success
*/

params [
	"_id",
	"_uid",
	["_name", "", [""]],
	["_jip", false, [false]],
	"_owner",
	"_idstr"
];

if (_jip) then {
	// Someone joined, recalculate the difficulty
	[] call FRLN_fnc_difficultyScaling;

	diag_log format ["Frontlines: Handled joining of %1", _name];
};