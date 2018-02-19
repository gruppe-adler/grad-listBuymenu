params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", ["_newStock",0]];

private _currentStock = _this call grad_lbm_fnc_getStock;
if (_currentStock < 0) exitWith {systemChat "Stock could not be set."; -1};

private _hashKey = format ["%1_%2_%3", _baseConfigName, _categoryConfigName, _itemConfigName];
[GRAD_LBM_ITEMSTOCKS,_hashKey,_newStock] call CBA_fnc_hashSet;

publicVariable "GRAD_LBM_ITEMSTOCKS";

_newStock
