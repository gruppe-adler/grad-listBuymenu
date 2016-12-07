params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_buyer", "_price", "_vehiclespawn"];

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
    };

    case ("ITEMS"): {
        [_buyer,_price,_code,_baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["grad_lbm_fnc_buyItem",0,false];
    };

    case ("WEARABLES"): {
        [_buyer,_price,_code,_baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["grad_lbm_fnc_buyWearable",0,false];
    };

    case ("VEHICLES"): {
        [_buyer,_price,_code,_baseConfigName,_categoryConfigName,_itemConfigName,_vehiclespawn] call grad_lbm_fnc_buyVehicle;
    };

    case ("UNITS"): {
        [_buyer,_price,_code,_baseConfigName,_categoryConfigName,_itemConfigName,_vehiclespawn] call grad_lbm_fnc_buyUnit;
    };

    default {
        [_buyer, _price, "Unknown item type. You got your money back."] remoteExec ["grad_lbm_fnc_reimburse",0,false];
    };
};
