params ["_unit", ["_funds",0]];

if (typeName _unit == "OBJECT") then {
    _unit setVariable ["grad_lbm_myFunds",_funds,true];
} else {
    switch (_unit) do {
        case (WEST): {missionNamespace setVariable ["grad_lbm_teamFunds_WEST",_funds,true]};
        case (EAST): {missionNamespace setVariable ["grad_lbm_teamFunds_EAST",_funds,true]};
        case (INDEPENDENT): {missionNamespace setVariable ["grad_lbm_teamFunds_INDEPENDENT",_funds,true]};
        case (CIVILIAN): {missionNamespace setVariable ["grad_lbm_teamFunds_CIVILIAN",_funds,true]};
    };
};
