private["_injured","_return"];

_injured = _this select 0;
_return = if( isNull (_injured getVariable ["mpsf_injury_dragger",objNull]) ) then { false }else{ true };

_return