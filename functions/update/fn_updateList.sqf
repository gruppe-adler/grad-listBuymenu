#include "..\..\dialog\defines.hpp"
params ["_categoryCtrl", "_selIndex"];
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
_listCtrl = _dialog displayCtrl grad_lbm_ITEMLIST;

(call compile (_categoryCtrl lbData _selIndex)) params ["_baseConfigName", "_categoryConfigName"];

_allCategories = "true" configClasses (missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName);
lbClear _listCtrl;
{
    _config = _x;

    _itemConfigName = configName _config;
    _displayName = [(_config >> "displayName"), "text", "UNDEFINED NAME"] call CBA_fnc_getConfigEntry;
    _price = [(_config >> "price"), "number", 999999] call CBA_fnc_getConfigEntry;
    _description = [(_config >> "description"), "text", ""] call CBA_fnc_getConfigEntry;
    _code = compile ([(_config >> "code"), "text", ""] call CBA_fnc_getConfigEntry);
    _picturePath = [(_config >> "picture"), "text", ""] call CBA_fnc_getConfigEntry;

    _listCtrl lbAdd format ["%1 Cr - %2",_price,_displayName];

    _data = str [_baseConfigName, _categoryConfigName, _itemConfigName, _displayName, _price, _description, _code, _picturePath];
    _listCtrl lbSetData [_forEachIndex, _data];
} forEach _allCategories;

if (lbSize _listCtrl > 0) then {_listCtrl lbSetCurSel 0};
