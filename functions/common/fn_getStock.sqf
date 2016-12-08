/*  Gets stock of an item from public hash
*
*/

params ["_baseConfigName", "_categoryConfigName", "_itemConfigName"];
_hashKey = format ["%1_%2_%3", _baseConfigName, _categoryConfigName, _itemConfigName];

if (isNil "GRAD_LBM_ITEMSTOCKS") exitWith {systemChat "Stocks hash is nil."; -1};
if !([GRAD_LBM_ITEMSTOCKS, _hashKey] call CBA_fnc_hashHasKey) exitWith {systemChat format ["%1 is not a stock hash key.", _hashKey]; -1};

_stock = [GRAD_LBM_ITEMSTOCKS, _hashKey] call CBA_fnc_hashGet;

_stock
