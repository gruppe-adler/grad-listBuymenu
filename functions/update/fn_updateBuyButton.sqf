/*  Updates (enables/disables) the buy button
*
*/

#include "..\..\dialog\defines.hpp"
params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_price"];
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
_buyCtrl = _dialog displayCtrl grad_lbm_BUYBUTTON;

//no permission
systemChat str _baseConfigName;

_c1 = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> "needPermission"), "number", 0] call CBA_fnc_getConfigEntry;
_c2 = [(missionConfigFile >> "CfgGradBuymenu" >> "needPermission"), "number", 0] call CBA_fnc_getConfigEntry;

systemChat str _c1;
systemChat str _c2;

_needPermission = switch (true) do {
    case (_c1 == 1): {true};
    case (_c2 == 1): {true};
    default {false};
};

systemChat str _needPermission;

if (_needPermission && !(player getVariable ["grad_lbm_canBuy", false])) exitWith {
    _buyCtrl ctrlEnable false;
    _buyCtrl ctrlSetText "NO PERMISSION";
};

//not enough money
if ((player getVariable ["grad_lbm_myFunds", 0]) < _price) exitWith {
    _buyCtrl ctrlEnable false;
    _buyCtrl ctrlSetText "NOT ENOUGH CREDITS";
};

//out of stock
_stock = [_baseConfigName, _categoryConfigName, _itemConfigName] call grad_lbm_fnc_getStock;
if (_stock <= 0) exitWith {
    _buyCtrl ctrlEnable false;
    _buyCtrl ctrlSetText "OUT OF STOCK";
};

//all is well
_buyCtrl ctrlEnable true;
_buyCtrl ctrlSetText "BUY";
