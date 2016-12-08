/*  Adds ACE-interaction to open buy menu to an object
*
*/

params ["_object", "_baseConfigName", ["_cargospace", objNull], ["_vehiclespawn", objNull], ["_shopName", ""], ["_actionDescription", "Buy Gear"], ["_condition", {true}]];

_actionName = format ["grad_lbm_interaction_%1_%2", str _object, _baseConfigName];
_icon = (missionNamespace getVariable ["grad_lbm_moduleRoot", [] call grad_lbm_fnc_getModuleRoot]) + "\data\moneyIcon.paa";
_isSelfInteraction = if (player == _object) then {1} else {0};
_rootAction = if (_isSelfInteraction == 1) then {"ACE_SelfActions"} else {"ACE_MainActions"};

_action = [_actionName,_actionDescription,_icon,{

    _args = _this select 2;
    _args params ["_object","_cargospace","_vehiclespawn","_baseConfigName","_shopName"];
    [_object,_cargospace,_vehiclespawn,_baseConfigName,_shopName] call grad_lbm_fnc_loadBuymenu

},_condition,{},[_object,_cargospace,_vehiclespawn,_baseConfigName,_shopName]] call ace_interact_menu_fnc_createAction;
[_object, _isSelfInteraction, [_rootAction], _action] call ace_interact_menu_fnc_addActionToObject;
