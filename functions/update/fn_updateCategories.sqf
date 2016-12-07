#include "..\..\dialog\defines.hpp"
params [["_baseConfigName", ""]];
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
_categoryCtrl = _dialog displayCtrl grad_lbm_CATEGORY;

_baseConfig = missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName;
_allCategories = "true" configClasses _baseConfig;
{
    _config = _x;
    _configName = configName _config;

    _displayName = [(_config >> "displayName"), "text", ""] call CBA_fnc_getConfigEntry;
    if (_displayName == "") then {_displayName = _configName};

    _categoryCtrl lbAdd _displayName;

    _data = str [_baseConfigName, _configName];
    _categoryCtrl lbSetData [_forEachIndex, _data];
} forEach _allCategories;

if (lbSize _categoryCtrl > 0) then {_categoryCtrl lbSetCurSel 0};
