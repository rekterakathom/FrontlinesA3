/*
Author: ThomasAngel
Steam: https://steamcommunity.com/id/Thomasangel/
Github: https://github.com/rekterakathom

Description:
	Writes to the local RPT file
	Useful for remote logging

Parameters:
	"_messageToLog" - The message to log

Usage: ["Hello World!"] call FRLN_fnc_writeToLog;

Returns: Boolean - success
*/

if !(params [
	["_messageToLog", "", [""]]
]) exitWith {};

diag_log _messageToLog;

true
