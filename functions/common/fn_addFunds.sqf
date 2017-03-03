params ["_unit", ["_funds",0]];

if (!local _unit) exitWith {[_unit,_funds] remoteExec ["GRAD_moneymenu_fnc_addFunds",_unit,false]};

_unit setVariable ["grad_lbm_myFunds", ((_unit getVariable ["grad_lbm_myFunds",0]) + _funds) max 0, true];

_unit getVariable "grad_lbm_myFunds"
