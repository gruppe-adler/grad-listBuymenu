#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_values"];

private _max = 0;
{
    _x params ["_amount"];
    if (_amount > _max) then {_max = _amount};

    false
} count _values;

_max


/*private _fnc_forEachSet = {
    _value params ["_amount"];
    if (_amount > _max) then {_max = _amount};
};
[_hash,_fnc_forEachSet] call CBA_fnc_hashEachPair;*/
/*["#CBA_HASH#",["rhs_30Rnd_545x39_AK","rhs_100Rnd_762x54mmR"],[[2,"5.45mm 30Rnd"],[1,"7.62 100Rnd Belt"]],[0,""]]*/
