#include "..\..\dialog\defines.hpp"
params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_price"];
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
_buyCtrl = _dialog displayCtrl grad_lbm_BUYBUTTON;

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
