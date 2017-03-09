#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\ui_toolkit.hpp"
#include "..\..\defines_tracking.hpp"

params ["_display"];

private _mainBG = _display ctrlCreate ["RscBackground",MAIN_BG_IDC];
_mainBG ctrlSetPosition [MAIN_BG_X,MAIN_BG_Y,MAIN_BG_W,MAIN_BG_H];
_mainBG ctrlSetBackgroundColor MAIN_BGCOLOR;
_mainBG ctrlCommit 0;

private _mainGroup = _display ctrlCreate ["RscControlsGroupNoHScrollbars",MAIN_IDC];
_mainGroup ctrlSetPosition [MAIN_X,MAIN_Y,MAIN_W,MAIN_H];
_mainGroup ctrlCommit 0;

private _mainCenterText = _display ctrlCreate ["RscTextNoShadow",MAIN_CENTERTEXT_IDC,_mainGroup];
_mainCenterText ctrlSetText "";
_mainCenterText ctrlSetTextColor [0.8,0,0,1];
_mainCenterText ctrlSetFontHeight (TEXT_SCALE * 0.06);
_mainCenterText ctrlSetPosition [(MAIN_W/2)-(MAIN_CENTERTEXT_W/2),(MAIN_H/2)-(MAIN_CENTERTEXT_H/2),MAIN_CENTERTEXT_W,MAIN_CENTERTEXT_H];
_mainCenterText ctrlCommit 0;
