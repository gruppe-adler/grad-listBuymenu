params [["_enable",true]];

grad_lbm_tracking_enabled = _enable;
if (grad_lbm_tracking_enabled && !(missionNamespace getVariable ["grad_lbm_tracking_initialized",false])) then {
    [true] remoteExec ["grad_lbm_tracking_fnc_initTracking",0,true];
};
