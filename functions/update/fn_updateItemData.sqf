/*  Updates stock, description in buy menu
*
*/

#include "..\..\dialog\defines.hpp"
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
if (isNull _dialog) exitWith {};

_descCtrl = _dialog displayCtrl grad_lbm_DESCRIPTION;
_listCtrl = _dialog displayCtrl grad_lbm_ITEMLIST;

_selIndex = lnbCurSelRow _listCtrl;

(call compile (_listCtrl lnbData [_selIndex,0])) params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_displayName", "_price", "_description", "_code", "_picturePath"];

//set description
_stock = [_baseConfigName, _categoryConfigName, _itemConfigName] call grad_lbm_fnc_getStock;
_categoryDescription = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "description"),"text",""] call CBA_fnc_getConfigEntry;
_inStockText = if (_stock > 0) then {format ["IN STOCK: %1<br/><br/>", _stock]} else {"<t color='#FF0000'>OUT OF STOCK</t><br/><br/>"};
_descCtrl ctrlSetStructuredText parseText (_inStockText + _categoryDescription + _description);

//disable buy button if out of stock
[_baseConfigName, _categoryConfigName, _itemConfigName, _price] call grad_lbm_fnc_updateBuyButton;
