#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\ui_toolkit.hpp"
#include "..\..\defines_tracking.hpp"

params ["_display"];

private _sidebarGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars",-1];
_sidebarGroup ctrlSetPosition [safezoneX,safezoneY+TOPBAR_H,SIDEBAR_W,safezoneH-TOPBAR_H];
_sidebarGroup ctrlCommit 0;

private _trackingTagText = _display ctrlCreate ["RscBackground",-1,_sidebarGroup];
_trackingTagText ctrlSetPosition [CENTER(SIDEBAR_W,DROPDOWN_W)*0.7,(DROPDOWN_START_Y + 0*DROPDOWN_DISTANCE)-DROPDOWN_TEXTDISTANCE_Y,DROPDOWN_W,DROPDOWN_H];
_trackingTagText ctrlSetText "TRACKING TAG";
_trackingTagText ctrlSetBackgroundColor [0,0,0,0];
_trackingTagText ctrlSetFontHeight (0.04 * TEXT_SCALE);
_trackingTagText ctrlSetTextColor SIDEBAR_TEXTCOLOR;
_trackingTagText ctrlCommit 0;

private _trackingTagEdit = _display ctrlCreate ["RscEdit",-1,_sidebarGroup];
_trackingTagEdit ctrlSetPosition [CENTER(SIDEBAR_W,DROPDOWN_W),DROPDOWN_START_Y + 0*DROPDOWN_DISTANCE,DROPDOWN_W,DROPDOWN_H];
_trackingTagEdit ctrlSetBackgroundColor DROPDOWN_BGCOLOR;
_trackingTagEdit ctrlSetTextColor TAGTEXTCOLOR_SUCCESS;
_trackingTagEdit ctrlSetEventHandler ["KillFocus","_this call grad_lbm_tracking_fnc_onTrackingTagKeydown"];
_trackingTagEdit ctrlSetEventHandler ["KeyDown","_this call grad_lbm_tracking_fnc_onTrackingTagKeydown"];
_trackingTagEdit ctrlCommit 0;
_trackingTagEdit ctrlSetText ([(missionConfigFile >> "CfgGradBuymenu" >> "trackingTag"), "text", ""] call CBA_fnc_getConfigEntry);
_trackingTagEdit ctrlCommit 0;

private _buyablesText = _display ctrlCreate ["RscBackground",-1,_sidebarGroup];
_buyablesText ctrlSetPosition [CENTER(SIDEBAR_W,DROPDOWN_W)*0.7,(DROPDOWN_START_Y + 1*DROPDOWN_DISTANCE)-DROPDOWN_TEXTDISTANCE_Y,DROPDOWN_W,DROPDOWN_H];
_buyablesText ctrlSetText "BUYABLES SET";
_buyablesText ctrlSetBackgroundColor [0,0,0,0];
_buyablesText ctrlSetFontHeight (0.04 * TEXT_SCALE);
_buyablesText ctrlSetTextColor SIDEBAR_TEXTCOLOR;
_buyablesText ctrlCommit 0;

private _buyablesDropdown = _display ctrlCreate ["RscCombo",DROPDOWN_BUYABLES_IDC,_sidebarGroup];
_buyablesDropdown ctrlSetPosition [CENTER(SIDEBAR_W,DROPDOWN_W),DROPDOWN_START_Y + 1*DROPDOWN_DISTANCE,DROPDOWN_W,DROPDOWN_H];
_buyablesDropdown ctrlSetBackgroundColor DROPDOWN_BGCOLOR;
_buyablesDropdown ctrlSetTextColor [0,0,0,1];
_buyablesDropdown ctrlSetEventHandler ["LBSelChanged", "_this call grad_lbm_tracking_fnc_updateCategoryDropdown"];
_buyablesDropdown ctrlCommit 0;

private _categoryText = _display ctrlCreate ["RscBackground",-1,_sidebarGroup];
_categoryText ctrlSetPosition [CENTER(SIDEBAR_W,DROPDOWN_W)*0.7,(DROPDOWN_START_Y + 2*DROPDOWN_DISTANCE)-DROPDOWN_TEXTDISTANCE_Y,DROPDOWN_W,DROPDOWN_H];
_categoryText ctrlSetText "CATEGORY";
_categoryText ctrlSetBackgroundColor [0,0,0,0];
_categoryText ctrlSetFontHeight (0.04 * TEXT_SCALE);
_categoryText ctrlSetTextColor SIDEBAR_TEXTCOLOR;
_categoryText ctrlCommit 0;

private _categoryDropdown = _display ctrlCreate ["RscCombo",DROPDOWN_CATEGORY_IDC,_sidebarGroup];
_categoryDropdown ctrlSetPosition [CENTER(SIDEBAR_W,DROPDOWN_W),DROPDOWN_START_Y + 2*DROPDOWN_DISTANCE,DROPDOWN_W,DROPDOWN_H];
_categoryDropdown ctrlSetBackgroundColor DROPDOWN_BGCOLOR;
_categoryDropdown ctrlSetTextColor [0,0,0,1];
_categoryDropdown ctrlSetEventHandler ["LBSelChanged", "_this call grad_lbm_tracking_fnc_updateMain"];
_categoryDropdown ctrlCommit 0;

_trackingTagEdit
