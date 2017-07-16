/*  Adds weapon to player/cargospace
*
*   remote executed by server
*/

params ["_buyer","_account","_price","_code","_baseConfigName", "_categoryConfigName", "_itemConfigName"];
if (player != _buyer) exitWith {};

//add to cargospace function
_addToCargo = {
    params ["_itemConfigName", "_muzzleItem", "_opticsItem", "_pointerItem", "_underbarrelItem"];

    _cargospace = (missionNamespace getVariable ["grad_lbm_currentOwnerObject",player]) getVariable ["grad_lbm_currentCargospace", objNull];
    _cargospace = [_cargospace] call grad_lbm_fnc_checkCargoSpace;

    if (isNil {_cargospace canAdd _itemConfigName} || {!(_cargospace canAdd _itemConfigName)}) exitWith {
        [_buyer,_account,_price,"Could not add your purchase to trader's cargo. You have been reimbursed."] call grad_lbm_fnc_reimburse;
    };

    _cargospace addWeaponCargoGlobal [_itemConfigName, 1];
    _cargospace addItemCargoGlobal [_muzzleItem, 1];
    _cargospace addItemCargoGlobal [_opticsItem, 1];
    _cargospace addItemCargoGlobal [_pointerItem, 1];
    _cargospace addItemCargoGlobal [_underbarrelItem, 1];

    player say "taskSucceeded";
    systemChat "Your purchase is in the trader's cargo.";
};

//get attachments
_muzzleItem = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "muzzleItem"), "text", ""] call CBA_fnc_getConfigEntry;
_opticsItem = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "opticsItem"), "text", ""] call CBA_fnc_getConfigEntry;
_pointerItem = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "pointerItem"), "text", ""] call CBA_fnc_getConfigEntry;
_underbarrelItem = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "underbarrelItem"), "text", ""] call CBA_fnc_getConfigEntry;

//switch weapontype
_type = getNumber (configFile >> "CfgWeapons" >> _itemConfigName >> "Type");
switch (_type) do {
    //primary
    case (1): {
        if (primaryWeapon player == "") then {
            player addWeapon _itemConfigName;
            player addPrimaryWeaponItem _muzzleItem;
            player addPrimaryWeaponItem _opticsItem;
            player addPrimaryWeaponItem _pointerItem;
            player addPrimaryWeaponItem _underbarrelItem;
        } else {
            [_itemConfigName, _muzzleItem, _opticsItem, _pointerItem, _underbarrelItem] call _addToCargo;
        };
    };

    //handgun
    case (2): {
        if (handgunWeapon player == "") then {
            player addWeapon _itemConfigName;
            player addHandgunItem _muzzleItem;
            player addHandgunItem _opticsItem;
            player addHandgunItem _pointerItem;
            player addHandgunItem _underbarrelItem;
        } else {
            [_itemConfigName, _muzzleItem, _opticsItem, _pointerItem, _underbarrelItem] call _addToCargo;
        };
    };

    //launcher
    case (4): {
        if (secondaryWeapon player == "") then {
            player addWeapon _itemConfigName;
            player addSecondaryWeaponItem _muzzleItem;
            player addSecondaryWeaponItem _opticsItem;
            player addSecondaryWeaponItem _pointerItem;
            player addSecondaryWeaponItem _underbarrelItem;
        } else {
            [_itemConfigName, _muzzleItem, _opticsItem, _pointerItem, _underbarrelItem] call _addToCargo;
        };
    };

    default {
        systemChat format ["ERROR: Classname %1 not found in CfgWeapons.", _itemConfigName];
    };
};

[_buyer,_itemConfigName] call _code;
