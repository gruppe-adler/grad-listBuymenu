if (!hasInterface) exitWith {};

//player is client
if (!isServer) then {
    "GRAD_LBM_ITEMSTOCKS" addPublicVariableEventHandler {[] call grad_lbm_fnc_updateItemData};

//player is host
} else {
    grad_lbm_fnc_localHostPubVar = {
        params ["_oldStocks"];
        [{!(str (missionNamespace getVariable ["GRAD_LBM_ITEMSTOCKS", []]) == _this)}, {
            [] call grad_lbm_fnc_updateItemData;

            _oldStocks = str (missionNamespace getVariable ["GRAD_LBM_ITEMSTOCKS", []]);
            [_oldStocks] call grad_lbm_fnc_localHostPubVar;
        }, _oldStocks] call CBA_fnc_waitUntilAndExecute;
    };

    _oldStocks = str (missionNamespace getVariable ["GRAD_LBM_ITEMSTOCKS", []]);
    [_oldStocks] call grad_lbm_fnc_localHostPubVar;
};
