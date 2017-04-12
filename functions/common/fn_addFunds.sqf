params ["_account", ["_funds",0]];

if (typeName _account == "OBJECT") then {
    if (!local _account) then {
        [_account,_funds] remoteExec ["grad_lbm_fnc_addFunds",_account,false];
    } else {
        _account setVariable ["grad_lbm_myFunds", ((_account getVariable ["grad_lbm_myFunds",0]) + _funds) max 0, true];
    };
} else {
    if (isServer) then {
        switch (_account) do {
            case (WEST): {missionNamespace setVariable ["grad_lbm_teamFunds_WEST",(missionNamespace getVariable ["grad_lbm_teamFunds_WEST",0]) + _funds,true]};
            case (EAST): {missionNamespace setVariable ["grad_lbm_teamFunds_EAST",(missionNamespace getVariable ["grad_lbm_teamFunds_EAST",0]) + _funds,true]};
            case (INDEPENDENT): {missionNamespace setVariable ["grad_lbm_teamFunds_INDEPENDENT",(missionNamespace getVariable ["grad_lbm_teamFunds_INDEPENDENT",0]) + _funds,true]};
            case (CIVILIAN): {missionNamespace setVariable ["grad_lbm_teamFunds_CIVILIAN",(missionNamespace getVariable ["grad_lbm_teamFunds_CIVILIAN",0]) + _funds,true]};
        };
    } else {
        [_account,_funds] remoteExec ["grad_lbm_fnc_addFunds",2,false];
    };
};
