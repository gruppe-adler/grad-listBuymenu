/*  Sends buy request to server
*
*   executed on click of buy button in buy menu
*/

#include "..\..\dialog\defines.hpp"
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
_listCtrl = _dialog displayCtrl grad_lbm_ITEMLIST;
_selIndex = lnbCurSelRow _listCtrl;
(call compile (_listCtrl lnbData [_selIndex,0])) params ["_baseConfigName", "_categoryConfigName", "_itemConfigName", "_displayName", "_price", "_description", "_code", "_picturePath"];

if ((player getVariable ["grad_lbm_myFunds",0]) < _price) exitWith {systemChat "Not enough funds."};
player setVariable ["grad_lbm_myFunds", (player getVariable ["grad_lbm_myFunds", 0]) - _price, true];
[] call grad_lbm_fnc_updateFunds;

//buy
[_baseConfigName, _categoryConfigName, _itemConfigName, player, _price, (missionNamespace getVariable ["grad_lbm_currentOwnerObject",player]) getVariable ["grad_lbm_currentVehiclespawn", objNull]] remoteExec ["grad_lbm_fnc_buyServer",2,false];
