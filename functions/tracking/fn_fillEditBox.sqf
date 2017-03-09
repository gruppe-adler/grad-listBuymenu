#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\defines_tracking.hpp"

params ["_editBox","_config"];

lbClear _editBox;
private _allCategories = "true" configClasses _config;
{
    _config = _x;
    _configName = configName _x;
    _displayName = [(_config >> "displayName"), "text", _configName] call CBA_fnc_getConfigEntry;

    _editBox lbAdd _displayName;
    _editBox lbSetData [_forEachIndex, _configName];
} forEach _allCategories;

if (lbSize _editBox > 0) then {_editBox lbSetCursel 0};
