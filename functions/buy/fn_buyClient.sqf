#include "..\..\dialog\defines.hpp"
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
_listCtrl = _dialog displayCtrl grad_lbm_ITEMLIST;
_selIndex = lbCurSel _listCtrl;
(call compile (_listCtrl lbData _selIndex)) params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_displayName", "_price", "_description", "_code", "_picturePath"];

//buy
[_baseConfigName, _categoryConfigName, _itemConfigName, player, _price, missionNamespace getVariable ["grad_lbm_currentVehiclespawn", objNull]] remoteExec ["grad_lbm_fnc_buyServer",2,false];

//detract funds
player setVariable ["grad_lbm_myFunds", (player getVariable ["grad_lbm_myFunds", 0]) - _price];
[] call grad_lbm_fnc_updateFunds;
