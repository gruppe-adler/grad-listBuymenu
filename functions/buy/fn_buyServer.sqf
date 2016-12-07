params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_buyer", "_price"];

//check if in stock
_stock = [_baseConfigName, _categoryConfigName, _itemConfigName] call grad_lbm_fnc_getStock;
if (_stock <= 0) exitWith {
    [_buyer, _price, "Item out of stock. You got your money back."] remoteExec ["grad_lbm_fnc_reimburse",0,false];
};

//detract 1 from stock
_hashKey = format ["%1_%2_%3", _baseConfigName, _categoryConfigName, _itemConfigName];
[GRAD_LBM_ITEMSTOCKS, _hashKey, _stock - 1] call CBA_fnc_hashSet;
publicVariable "GRAD_LBM_ITEMSTOCKS";

//do different stuff based on category type
_type = toUpper ([(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "kindOf"), "text", ""] call CBA_fnc_getConfigEntry);
switch (_type) do {
    case ("WEAPONS"): {
        [_buyer,_baseConfigName, _categoryConfigName, _itemConfigName] remoteExec ["grad_lbm_fnc_buyWeapon",0,false];
    };
};
