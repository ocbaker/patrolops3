if(mpsfCLI) exitWith {};

_unitScrubber = {
	if( count([_this,1000,[east,west,resistance],["CAManBase","LandVehicle","Air"]] call mpsf_fnc_getNearbyPlayers) > 0 ) ExitWith{};
	mpsf_active_units = mpsf_active_units - [_this];
	_grp = group _this;
	hidebody _this;
	sleep 3;
	deleteVehicle _this;
	if( count (units _grp) == 0 ) then {
		deleteGroup _grp;
	};
};

_vehicleScrubber = {
	if( count([_this,1000,[east,west,resistance],["CAManBase","LandVehicle","Air"]] call mpsf_fnc_getNearbyPlayers) > 0 ) ExitWith{};
	if( {alive _x} count (crew _this) > 0 ) ExitWith{};
	mpsf_active_units = mpsf_active_units - [_this];
	_this setDamage 1;
	sleep 60;
	deleteVehicle _this;
};

while { true } do {
	{
		switch (true) do {
			case (_x isKindOf "MAN") :		{ if( !(alive _x) && mpsf_param_removevehiclebodies) then { _x spawn _unitScrubber }; };
			case (_x isKindOf "Air");
			case (_x isKindOf "Ship");
			case (_x isKindOf "LandVehicle") :	{ if( !(canMove _x) && mpsf_param_removeVehicleWrecks) then { _x spawn _vehicleScrubber }; };
		};
	}forEach mpsf_active_units;
	sleep 90;
};