#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_data"];

private _max = 0;
{
    _x params ["",["_keys",[]],["_values",[]]];
    {
        _x params ["_amount"];
        if (_amount > _max) then {_max = _amount};

        false
    } count _values;

    false
} count _data;

_max
