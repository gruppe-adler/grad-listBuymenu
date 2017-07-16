/*  Adds wearable to player/cargospace
*
*   remote executed by server
*/

params ["_buyer","_account","_price","_code","_baseConfigName", "_categoryConfigName", "_itemConfigName"];
if (player != _buyer) exitWith {};

_cargospace = (missionNamespace getVariable ["grad_lbm_currentOwnerObject",player]) getVariable ["grad_lbm_currentCargospace", objNull];

//add to cargospace function
_addToCargo = {
    params ["_cargospace", "_itemConfigName", "_type"];

    _cargospace = [_cargospace] call grad_lbm_fnc_checkCargoSpace;

    if (isNil {_cargospace canAdd _itemConfigName} || {!(_cargospace canAdd _itemConfigName)}) exitWith {
        [_buyer,_account,_price,"Could not add your purchase to trader's cargo. You have been reimbursed."] call grad_lbm_fnc_reimburse;
    };

    if (_type == "BACKPACK") then {
        _cargospace addBackpackCargoGlobal [_itemConfigName, 1];
    } else {
        _cargospace addItemCargoGlobal [_itemConfigName, 1];
    };

    player say "taskSucceeded";
    systemChat "Your purchase is in the trader's cargo.";
};

//get type
_type = switch (true) do {
    case ("Uniform_Base" in ([(configfile >> "CfgWeapons" >> _itemConfigName), true] call BIS_fnc_returnParents)): {"UNIFORM"};
    case ((getText (configfile >> "CfgWeapons" >> _itemConfigName >> "ItemInfo" >> "_generalMacro")) == "HeadgearItem"): {"HELMET"};
    case ((getText (configfile >> "CfgWeapons" >> _itemConfigName >> "ItemInfo" >> "_generalMacro")) == "VestItem"): {"VEST"};
    case ((getNumber (configfile >> "CfgVehicles" >> _itemConfigName >> "isBackpack")) == 1): {"BACKPACK"};
    default  {"UNKNOWN"};
};

//switch type
switch (_type) do {
    case ("UNIFORM"): {
        if (uniform player == "") then {
            player forceAddUniform _itemConfigName;
        } else {
            [_cargospace, _itemConfigName, _type] call _addToCargo;
        };
    };
    case ("HELMET"): {
        if (headgear player == "") then {
            player addHeadgear _itemConfigName;
        } else {
            [_cargospace, _itemConfigName, _type] call _addToCargo;
        };
    };
    case ("VEST"): {
        if (vest player == "") then {
            player addVest _itemConfigName;
        } else {
            [_cargospace, _itemConfigName, _type] call _addToCargo;
        };
    };
    case ("BACKPACK"): {
        if (backpack player == "") then {
            player addBackpack _itemConfigName;
        } else {
            [_cargospace, _itemConfigName, _type] call _addToCargo;
        };
    };
    default {
        [_cargospace, _itemConfigName, _type] call _addToCargo;
    };
};

[_buyer,_itemConfigName] call _code;
