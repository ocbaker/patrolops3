/*
	Author: Community & Eightysix

	Description:
	Not to be called Directly!

*/
private ["_type","_side","_position","_dir","_radius","_vehicle","_grp","_sim","_crewtype","_max","_unit"];

if(!mpsfSRV && !mpsfHLC) exitWith {};

_counThis	= count _this;
_type		= _this select 1;
_dir		= if(_counThis > 2) then { _this select 2 }else{ random 360 };
_radius		= if(_counThis > 3) then { _this select 3 }else{ 0 };
_side		= if(_counThis > 4) then { _this select 4 }else{ nil };
_fillCargo	= if(_counThis > 5) then { if( toupper(typename (_this select 5)) == "STRING" ) then { (_this select 5) call mpsf_fnc_getpreDefinedSquads }else{ _this select 5 } }else{ [] };
_state		= if(_counThis > 6) then { _this select 6 }else{ "NONE" };
_position	= [(_this select 0),_radius,_dir,true,20] call mpsf_fnc_getPos;

_state = switch (toUpper _state) do {
	case "AIR";
	case "AIRBORNE";
	case "FLY";
	case "FLYING" : { "FLY" };
	default { "NONE" };
};

if( _state == "FLY" && !isNil "_side" ) then { _position set [2, (_position select 2) + 100 ] };

_vehicle = createVehicle [_type, _position, [], 0, _state];
_vehicle setDir _dir;

if(isNil "_side") exitWith{
	if( mpsfHLC ) then {
		mpsf_HLC_CLI__SPAWNER = _vehicle;
		publicVariableServer "mpsf_HLC_CLI__SPAWNER";
	};

	["fnc_Create_Vehicle",format["Vehicle %1 Created at %2",_vehicle,_position] ] call mpsf_fnc_log;
	_vehicle;
};

_sim = getText(configFile >> "CfgVehicles" >> _type >> "simulation");
_crewtype = if(mpsf_a3) then {
	[getText(configFile >> "CfgVehicles" >> _type >> "crew")]
}else{
	getArray (configFile >> "CfgVehicles" >> _type >> "typicalCargo");
};

if( count(_crewtype - ["Soldier"]) == 0 ) then{
	_crewtype = switch (_side) do {
		case west :		{ [mpsf_CfgSpawner_DefaultCrewTypes select 0] };
		case east :		{ [mpsf_CfgSpawner_DefaultCrewTypes select 1] };
		case resistance :	{ [mpsf_CfgSpawner_DefaultCrewTypes select 2] };
		default			{ [mpsf_CfgSpawner_DefaultCrewTypes select 0] };
	};
};

_max = (count _crewtype) - 1;
_grp = createGroup _side;

if( (_vehicle emptyPositions "commander") > 0 ) then {
	_unit = _grp createUnit [_crewtype select (round random _max), _position, [], _radius, "NONE"];
	_unit setSkill mpsf_param_ai_skill;
	_unit allowFleeing 0;
	_unit moveinCommander _vehicle;
};

if( ( _vehicle emptyPositions "gunner") > 0 ) then {
	_unit = _grp createUnit [_crewtype select (round random _max), _position, [], _radius, "NONE"];
	_unit setSkill mpsf_param_ai_skill;
	_unit allowFleeing 0;
	_unit moveinGunner _vehicle;
};

if( ( _vehicle emptyPositions "driver") > 0 ) then {
	_unit = _grp createUnit [_crewtype select (round random _max), _position, [], _radius, "NONE"];
	_unit setSkill mpsf_param_ai_skill;
	_unit allowFleeing 0;
	_unit moveinDriver _vehicle;
};

_grp addVehicle _vehicle;
if( _state == "FLY" && _sim IN ["airplane","airplanex"] ) then {
	_vehicle setVelocity [130 * (sin _dir), 100 * (cos _dir), 0];
};

if( count _fillCargo > 0 ) then {
	{
		if !(( _vehicle emptyPositions "cargo") > 0) exitWith { [format[true,"HINTS","%1 is full and cannot hold any more infantry!",_vehicle]] call mpsf_fnc_hint };
		_unit = _grp createUnit [_fillCargo select _ForEachIndex, _position, [], _radius, "NONE"];
		_unit setSkill mpsf_param_ai_skill;
		_unit allowFleeing 0;
		_unit moveInCargo _vehicle;
	}forEach _fillCargo;
};

if(mpsf_param_ai_easyKill) then { (units _grp) spawn mpsf_fnc_setDamageEH_AI; };

["fnc_Create_Vehicle",format["Vehicle %1 Created at %2 with crew %3",_vehicle,_position,crew _vehicle] ] call mpsf_fnc_log;

mpsf_active_units = mpsf_active_units + (units _grp) + [_vehicle];

if( mpsfHLC ) then {
	mpsf_HLC_CLI__SPAWNER = [_grp,_vehicle];
	publicVariableServer "mpsf_HLC_CLI__SPAWNER";
};

[_grp,_vehicle]