#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\defines_tracking.hpp"

params ["_data","_display"];

if (isNull _display) exitWith {};

private _buyablesDropdown = _display displayCtrl DROPDOWN_BUYABLES_IDC;
lbClear _buyablesDropdown;
if !([_data] call CBA_fnc_isHash) exitWith {[_buyablesDropdown,-1] call grad_lbm_tracking_fnc_updateCategoryDropdown};

if ([_data] call CBA_fnc_hashSize > 0) then {
    _dropdownIndex = _buyablesDropdown lbAdd "ALL";
    _buyablesDropdown lbSetData [_dropdownIndex,str _data];
};

private _fnc_forEachSet = {
    _value params ["_displayName","_buyablesdata"];

    _dropdownIndex = _buyablesDropdown lbAdd _displayName;
    _buyablesDropdown lbSetData [_dropdownIndex, str _buyablesdata];
};
[_data, _fnc_forEachSet] call CBA_fnc_hashEachPair;
if (lbSize _buyablesDropdown > 0) then {_buyablesDropdown lbSetCursel 0};
[_buyablesDropdown,lbCursel _buyablesDropdown] call grad_lbm_tracking_fnc_updateCategoryDropdown;
