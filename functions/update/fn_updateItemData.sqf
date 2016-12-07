#include "..\..\dialog\defines.hpp"
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
if (isNull _dialog) exitWith {};

_descCtrl = _dialog displayCtrl grad_lbm_DESCRIPTION;
_listCtrl = _dialog displayCtrl grad_lbm_ITEMLIST;
_pictureCtrl = _dialog displayCtrl grad_lbm_PICTURE;

_selIndex = lbCursel _listCtrl;

(call compile (_listCtrl lbData _selIndex)) params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_displayName", "_price", "_description", "_code", "_picturePath"];

//set description
_stock = [_baseConfigName, _categoryConfigName, _itemConfigName] call grad_lbm_fnc_getStock;
_inStockText = if (_stock > 0) then {format ["IN STOCK: %1<br/><br/>", _stock]} else {"<t color='#FF0000'>OUT OF STOCK</t><br/><br/>"};
_descCtrl ctrlSetStructuredText parseText (_inStockText + _description);

//set picture
if (_picturePath == "") then {
    _picturePath = [_itemConfigName] call grad_lbm_fnc_getPicturePath;
};
if (_picturePath == "") then {
    _picturePath = (missionNamespace getVariable ["grad_lbm_moduleRoot", [] call grad_lbm_fnc_getModuleRoot]) + "\data\questionmark.paa";
};
_pictureCtrl ctrlSetText _picturePath;

//disable buy button if out of stock
[_baseConfigName, _categoryConfigName, _itemConfigName, _price] call grad_lbm_fnc_updateBuyButton;
