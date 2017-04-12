/*  Processes buy request sent by client
*
*   remote executed by client
*/

params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_buyer", "_price", "_vehiclespawn","_account"];

//detract from account
private _notEnoughMoney = if (typeName _account == "SIDE") then {
    if ([_account] call grad_lbm_fnc_getFunds < _price) then {
        "Teamaccount did not have enough money. Purchase canceled." remoteExec ["systemChat",_buyer,false];
        true
    } else {
        [_account,-_price] call grad_lbm_fnc_addFunds;
        [] remoteExec ["grad_lbm_fnc_updateFunds",_buyer,false];
        false
    };
} else {
    false
};
diag_log [_account,_notEnoughMoney,_price];
if (_notEnoughMoney) exitWith {};

//check if in stock
_stock = [_baseConfigName, _categoryConfigName, _itemConfigName] call grad_lbm_fnc_getStock;
if (_stock <= 0) exitWith {
    [_buyer, _price, "Item out of stock. You got your money back."] remoteExec ["grad_lbm_fnc_reimburse",0,false];
};

//detract 1 from stock
_hashKey = format ["%1_%2_%3", _baseConfigName, _categoryConfigName, _itemConfigName];
[GRAD_LBM_ITEMSTOCKS, _hashKey, _stock - 1] call CBA_fnc_hashSet;
publicVariable "GRAD_LBM_ITEMSTOCKS";

//get code
_code = compile ([(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "code"), "text", ""] call CBA_fnc_getConfigEntry);

//do different stuff based on category type
_type = toUpper ([(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "kindOf"), "text", ""] call CBA_fnc_getConfigEntry);
if (_type == "") then {_type = toUpper ([(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "kindOf"), "text", ""] call CBA_fnc_getConfigEntry)};
switch (_type) do {
    case ("WEAPONS"): {
        [_buyer,_price,_code,_baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["grad_lbm_fnc_buyWeapon",0,false];
        [[_buyer,_itemConfigName],_code] call grad_lbm_fnc_callCodeServer;
    };

    case ("ITEMS"): {
        [_buyer,_price,_code,_baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["grad_lbm_fnc_buyItem",0,false];
        [[_buyer,_itemConfigName],_code] call grad_lbm_fnc_callCodeServer;
    };

    case ("WEARABLES"): {
        [_buyer,_price,_code,_baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["grad_lbm_fnc_buyWearable",0,false];
        [[_buyer,_itemConfigName],_code] call grad_lbm_fnc_callCodeServer;
    };

    case ("VEHICLES"): {
        [_buyer,_price,_code,_baseConfigName,_categoryConfigName,_itemConfigName,_vehiclespawn] call grad_lbm_fnc_buyVehicle;
    };

    case ("UNITS"): {
        [_buyer,_price,_code,_baseConfigName,_categoryConfigName,_itemConfigName,_vehiclespawn] call grad_lbm_fnc_buyUnit;
    };

    case ("OTHER"): {
        [_buyer,_itemConfigName] call _code;
        [[_buyer,_itemConfigName],_code] remoteExec ["grad_lbm_fnc_callCodeClient",0,false];
    };

    default {
        [_buyer, _price, "Unknown item type. You got your money back."] remoteExec ["grad_lbm_fnc_reimburse",0,false];
    };
};

//track
if (missionNamespace getVariable  ["grad_lbm_trackingTag",""] != "") then {
    [_baseConfigName,_categoryConfigName,_itemConfigName] call GRAD_lbm_tracking_fnc_trackPurchase;
};
