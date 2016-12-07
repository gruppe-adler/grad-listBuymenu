params ["_object", "_baseConfigName", "_actionDescription", "_condition"];

_actionName = format ["grad_lbm_interaction_%1_%2", str _object, _baseConfigName];

//get icon
_functionsPath = [(missionConfigFile >> "CfgFunctions" >> "GRAD_lbm" >> "common" >> "file"), "text", ""] call CBA_fnc_getConfigEntry;
_functionsPathArray = _functionsPath splitString "\";
_functionsPathArray set [(count _functionsPathArray - 1), "data"];
_dataPath = _functionsPathArray joinString "\";
_icon = _dataPath + "\moneyIcon.paa";

_action = [_actionName,_actionDescription,_icon,{["Some Dude",_this select 2,"WEST"] call grad_lbm_fnc_loadBuymenu},_condition,{},_object] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
