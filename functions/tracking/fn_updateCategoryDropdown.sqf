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

/*_dropdownIndex = _categoryDropdown lbAdd "ALL";
_categoryDropdown lbSetData [_dropdownIndex,_selData];*/

private _fnc_forEachSet = {
    _value params ["_displayName","_categoryData"];

    _dropdownIndex = _categoryDropdown lbAdd _displayName;
    _categoryDropdown lbSetData [_dropdownIndex, str _categoryData];
};
[_selHash,_fnc_forEachSet] call CBA_fnc_hashEachPair;
if (lbSize _categoryDropdown > 0) then {_categoryDropdown lbSetCursel 0};
