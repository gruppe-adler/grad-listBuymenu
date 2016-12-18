/*  Updates category combolistbox
*
*/

#include "..\..\dialog\defines.hpp"
params [["_baseConfigName", ""]];
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
_categoryCtrl = _dialog displayCtrl grad_lbm_CATEGORY;

_baseConfig = missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName;
_allCategories = "true" configClasses _baseConfig;
_categoryIndex = 0;
{
    _config = _x;
    _condition = [(_config >> "condition"), "text", "true"] call CBA_fnc_getConfigEntry;

    if (call compile _condition) then {
        _configName = configName _config;

        _displayName = [(_config >> "displayName"), "text", ""] call CBA_fnc_getConfigEntry;
        if (_displayName == "") then {_displayName = _configName};

        _categoryCtrl lbAdd _displayName;

        _data = str [_baseConfigName, _configName];
        _categoryCtrl lbSetData [_categoryIndex, _data];

        _categoryIndex = _categoryIndex + 1;
    };
} forEach _allCategories;

if (lbSize _categoryCtrl > 0) then {
    _selection = (player getVariable ["grad_lbm_lastSelectedCategoryIndex",0]);
    if (_selection > (lbSize _categoryCtrl - 1)) then {_selection = 0};
    _categoryCtrl lbSetCurSel _selection;
};
