#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\ui_toolkit.hpp"
#include "..\..\defines_tracking.hpp"


private _display = (findDisplay 46) createDisplay "RscDisplayEmpty";
[_display] call grad_lbm_tracking_fnc_createBackground;
private _trackingTagEdit = [_display] call grad_lbm_tracking_fnc_createSidebar;
[_display] call grad_lbm_tracking_fnc_createMain;

[_trackingTagEdit,28] call grad_lbm_tracking_fnc_onTrackingTagKeydown;
