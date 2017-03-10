#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\ui_toolkit.hpp"
#include "..\..\defines_tracking.hpp"

params ["_buyablesDropdown","_curSelIndex"];

private _display = ctrlParent _buyablesDropdown;
private _categoryDropdown = _display displayCtrl DROPDOWN_CATEGORY_IDC;
lbClear _categoryDropdown;

if (_curSelIndex < 0) exitWith {};

private _selData = _buyablesDropdown lbData _curSelIndex;
private _selHash = call compile _selData;


private _selDataSets = if (_buyablesDropdown lbText _curSelIndex == "ALL") then {
    _dataSets = [];
    _fnc_forEachPair = {
        _value params ["_baseDisplayName","_baseHash"];
        _dataSets pushBack _baseHash;
    };
    [_selHash,_fnc_forEachPair] call CBA_fnc_hashEachPair;
    _dataSets
} else {
    [_selHash]
};


if ([_selHash] call CBA_fnc_hashSize > 0) then {
    _dropdownIndex = _categoryDropdown lbAdd "ALL";
    _allCategoryData = [];
    {
        _fnc_forEachSet = {
            _value params ["_displayName","_categoryData"];
            _allCategoryData pushBack _categoryData;
        };
        [_x,_fnc_forEachSet] call CBA_fnc_hashEachPair;

        false
    } count _selDataSets;
    _categoryDropdown lbSetData [_dropdownIndex,str _allCategoryData];
};


{
    _fnc_forEachSet = {
        _value params ["_displayName","_categoryData"];

        _dropdownIndex = _categoryDropdown lbAdd _displayName;
        _categoryDropdown lbSetData [_dropdownIndex, str [_categoryData]];
    };
    [_x,_fnc_forEachSet] call CBA_fnc_hashEachPair;
    if (lbSize _categoryDropdown > 0) then {_categoryDropdown lbSetCursel 0};

    false
} count _selDataSets;
