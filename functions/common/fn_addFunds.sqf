params ["_unit", ["_funds",0]];

_unit setVariable ["grad_lbm_myFunds", ((_unit getVariable ["grad_lbm_myFunds",0]) + _funds) max 0, true];

_unit getVariable "grad_lbm_myFunds"
