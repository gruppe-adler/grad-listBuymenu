#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\ui_toolkit.hpp"
#include "..\..\defines_tracking.hpp"

params ["_categoryDropdown","_curSelIndex"];

private _display = ctrlParent _categoryDropdown;
private _data = if (_curSelIndex >= 0) then {call compile (_categoryDropdown lbData _curSelIndex)} else {[]};
asdasd = _data;
private _maxAmount = [_data] call grad_lbm_tracking_fnc_getMax;
private _mainGroup = _display displayCtrl MAIN_IDC;
private _mainBG = _display displayCtrl MAIN_BG_IDC;
private _barIDC = BAR_STARTING_IDC;
private _textIDC = BAR_TEXT_STARTING_IDC;
private _linesIDC = MAIN_LINES_IDC;
private _numbersIDC = MAIN_NUMBERS_IDC;


//CLEAR ========================================================================
while {!isNull (_display displayCtrl _barIDC)} do {
    ctrlDelete (_display displayCtrl _barIDC);
    _barIDC = _barIDC + 1;
};

while {!isNull (_display displayCtrl _textIDC)} do {
    ctrlDelete (_display displayCtrl _textIDC);
    _textIDC = _textIDC + 1;
};

while {!isNull (_display displayCtrl _linesIDC)} do {
    ctrlDelete (_display displayCtrl _linesIDC);
    _linesIDC = _linesIDC + 1;
};

while {!isNull (_display displayCtrl _numbersIDC)} do {
    ctrlDelete (_display displayCtrl _numbersIDC);
    _numbersIDC = _numbersIDC + 1;
};


//CREATE BARS ==================================================================
private _previousAmount = 0;
private _previousIndex = 0;
{
    _x params ["",["_keys",[]],["_values",[]]];
    _previousAmount = _previousAmount + _previousIndex;
    _categoryIndex = if (count _data == 1) then {(_curSelIndex-1) max 0} else {_forEachIndex};
    {
        _barColorRGBA = BARCOLORS_RGBA select (_categoryIndex mod (count BARCOLORS_RGBA));
        _barColor = _barColorRGBA apply {_x/255};

        _key = _x;
        _value = _values select _forEachIndex;
        _value params ["_amount","_displayName"];

        _barY = BAR_STARTING_Y + BAR_DISTANCE_Y*(_forEachIndex+_previousAmount) + BAR_H*(_forEachIndex+_previousAmount);
        _barW = if (_amount > 0) then {BAR_MAX_W * (_amount/(_maxAmount max 1))} else {BAR_MAX_W * 0.01};

        _bar = _display ctrlCreate ["RscBackground",BAR_STARTING_IDC + (_forEachIndex+_previousAmount),_mainGroup];
        _bar ctrlSetPosition [BAR_X, _barY, _barW, BAR_H];
        _bar ctrlSetBackgroundColor _barColor;
        _bar ctrlSetTooltip format ["%1\n%2\nAmount: %3",_key,_displayName,_amount];
        _bar ctrlCommit 0;

        _text = _display ctrlCreate ["RscBackground",BAR_TEXT_STARTING_IDC + (_forEachIndex+_previousAmount),_mainGroup];
        _text ctrlSetPosition [BAR_TEXT_X, _barY, BAR_TEXT_W, BAR_H];
        _text ctrlSetText _displayName;
        _text ctrlSetBackgroundColor [0,0,0,0];
        _text ctrlSetFontHeight (0.04 * TEXT_SCALE);
        _text ctrlSetTextColor [0,0,0,1];
        _text ctrlCommit 0;

        _previousIndex = _forEachIndex;
    } forEach _keys;
    _previousIndex = _previousIndex + 1;

    false
} forEach _data;


//CREATE DIVISIONS =============================================================
private _maxNumberOfDivisions = 14;
private _numberOfDivisions = 4;
private _minMod = 100;
for [{_i=_numberOfDivisions}, {_i<=_maxNumberOfDivisions}, {_i=_i+1}] do {
    if (_maxAmount mod _i < _minMod) then {
        _xStepTest = floor (_maxAmount/_i);

        if (
            _xStepTest mod 2 == 0 ||
            _xStepTest mod 5 == 0 ||
            _xStepTest mod 10 == 0
        ) then {
            _numberOfDivisions = _i; _minMod = _maxAmount mod _i
        };
    };
};
_numberOfDivisions = (_numberOfDivisions min _maxAmount);

private _xStep = (floor (_maxAmount/(_numberOfDivisions max 1))) max 1;
private _xStepW = BAR_MAX_W / ((_maxAmount / _xStep) max 1);

for [{_i=0}, {_i <= _numberOfDivisions}, {_i=_i+1}] do {

    _xPercentage = _xStep * _i;

    _line = _display ctrlCreate ["RscBackground",MAIN_LINES_IDC+_i];
    _line ctrlSetPosition [MAIN_X + BAR_X - (LINE_W/2) + (_i * _xStepW),LINE_Y,LINE_W,LINE_H];
    _line ctrlSetBackgroundColor LINECOLOR;
    _line ctrlCommit 0;

    _number = _display ctrlCreate ["RscTextNoShadow",MAIN_NUMBERS_IDC+_i];
    _number ctrlSetPosition [MAIN_X + BAR_X - (NUMBER_W/2) + (_i * _xStepW),NUMBER_Y,NUMBER_W,NUMBER_H];
    _number ctrlSetTextColor NUMBERCOLOR;
    _number ctrlSetText str (_i * _xStep);
    _number ctrlCommit 0;
};
