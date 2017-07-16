/*  Adds item to player/cargospace
*
*   remote executed by server
*/

params ["_buyer","_account","_price","_code","_baseConfigName", "_categoryConfigName", "_itemConfigName"];
if (player != _buyer) exitWith {};

_cargospace = (missionNamespace getVariable ["grad_lbm_currentOwnerObject",player]) getVariable ["grad_lbm_currentCargospace", objNull];
_amount = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "amount"), "number", 1] call CBA_fnc_getConfigEntry;

//add to cargospace function
_addToCargo = {
    params ["_cargospace", "_itemConfigName", "_amount"];

    _cargospace = [_cargospace] call grad_lbm_fnc_checkCargoSpace;

    if (isNil {_cargospace canAdd _itemConfigName} || {!(_cargospace canAdd _itemConfigName)}) exitWith {
        [_buyer,_account,_price,"Could not add your purchase to trader's cargo. You have been reimbursed."] call grad_lbm_fnc_reimburse;
    };

    _isMagazine = isClass (configfile >> "CfgMagazines" >> _itemConfigName);
    if (_isMagazine) then {
        _cargospace addMagazineCargoGlobal [_itemConfigName, _amount];
    } else {
        _cargospace addItemCargoGlobal [_itemConfigName, _amount];
    };

    player say "taskSucceeded";
    systemChat "Your purchase is in the trader's cargo.";
};

//add to player inventory
switch (true) do {
    case (player canAddItemToVest [_itemConfigName, _amount]): {
        for "_i" from 1 to _amount do {
            player addItemToVest _itemConfigName;
        };
    };
    case (player canAddItemToUniform [_itemConfigName, _amount]): {
        for "_i" from 1 to _amount do {
            player addItemToUniform _itemConfigName;
        };
    };
    case (player canAddItemToBackpack [_itemConfigName, _amount]): {
        for "_i" from 1 to _amount do {
            player addItemToBackpack _itemConfigName;
        };
    };

    default {
        [_cargospace, _itemConfigName, _amount] call _addToCargo;
    };
};

[_buyer,_itemConfigName] call _code;
