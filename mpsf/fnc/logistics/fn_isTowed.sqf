/*
	Author: Eightysix

	Description:
	checks if an object is loaded

	Syntax:
	[<object>,<target>] call mpsf_fnc_isLoaded

	Returns: BOOLEAN
*/
private["_checkObject","_checkTarget","_return"];

_checkObject = (_this select 0) getVariable ["mpsf_isTowingObj",objNull];
_checkTarget = (_this select 1) getVariable ["mpsf_isTowingObj",objNull];

if( isNull _checkObject || isNull _checkTarget ) exitWith { false };

_return = if( (_this select 0) == _checkTarget && (_this select 1) == _checkObject ) then { true }else{ false };

_return;