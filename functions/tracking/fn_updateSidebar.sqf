#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\defines_tracking.hpp"

params ["_data","_display","_inputText","_editBox"];

if (isNull _display) exitWith {};

[_data,_display] call GRAD_lbm_tracking_fnc_updateBuyablesDropdown;
