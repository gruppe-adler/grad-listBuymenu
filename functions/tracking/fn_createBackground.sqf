#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\ui_toolkit.hpp"
#include "..\..\defines_tracking.hpp"

params ["_display"];

private _background = _display ctrlCreate ["RscBackground",-1];
_background ctrlSetBackgroundColor BGCOLOR;
_background ctrlSetPosition [safezoneX,safezoneY,safezoneW,safezoneH];
_background ctrlCommit 0;

private _sidebarDivider = _display ctrlCreate ["RscBackground",-1];
_sidebarDivider ctrlSetBackgroundColor [0,0,0,1];
_sidebarDivider ctrlSetPosition [safezoneX + SIDEBAR_W,safezoneY,SIDEBAR_DIVIDER_W,safezoneH];
_sidebarDivider ctrlCommit 0;

private _topbar = _display ctrlCreate ["RscText",-1];
_topbar ctrlSetBackgroundColor [(profilenamespace getvariable ['GUI_BCG_RGB_R',0]),(profilenamespace getvariable ['GUI_BCG_RGB_G',0]),(profilenamespace getvariable ['GUI_BCG_RGB_B',0]),1];
_topbar ctrlSetPosition [safezoneX,safezoneY,safezoneW,TOPBAR_H];
_topbar ctrlSetText "GRAD LISTBUYMENU STATISTICS";
_topbar ctrlCommit 0;

private _topbarDivider = _display ctrlCreate ["RscBackground",-1];
_topbarDivider ctrlSetBackgroundColor TOPBAR_DIVIDER_COLOR;
_topbarDivider ctrlSetPosition [safezoneX,safezoneY+TOPBAR_H,safezoneW,TOPBAR_DIVIDER_H];
_topbarDivider ctrlCommit 0;

private _closeButton = _display ctrlCreate ["RscButtonSmall",-1];
_closeButton ctrlSetText "X";
_closeButton ctrlSetPosition [safezoneX + safezoneW - 1.1*CLOSEBUTTON_W,safezoneY + CENTER(TOPBAR_H,CLOSEBUTTON_H),CLOSEBUTTON_W,CLOSEBUTTON_H];
_closeButton ctrlSetEventHandler ["ButtonClick","(ctrlParent (_this select 0)) closeDisplay 2"];
_closeButton ctrlCommit 0;
