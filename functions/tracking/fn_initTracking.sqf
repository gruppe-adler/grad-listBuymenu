#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_enableOrPostInit"];
if (!isNil "_enableOrPostInit") then {if (_enableOrPostInit isEqualType true) then {grad_lbm_tracking_enabled = _enable}};

["lbmstats", {
    [] call grad_lbm_tracking_fnc_openDialog;
}, "adminLogged"] call CBA_fnc_registerChatCommand;
grad_lbm_tracking_lastRequest = "";
grad_lbm_tracking_lastRequestTime = 0;

if (missionNamespace getVariable ["grad_lbm_tracking_initialized",false] || !(missionNamespace getVariable ["grad_lbm_tracking_enabled",true])) exitWith {};

grad_lbm_trackingTag = [] call grad_lbm_tracking_fnc_getTrackingTag;
if (grad_lbm_trackingTag == "") exitWith {INFO("Not tracking purchases.")};
grad_lbm_tracking_initialized = true;

if (!isServer) exitWith {};

private ["_trackHash"];

if (isNil {profileNamespace getVariable grad_lbm_trackingTag}) then {
    INFO_1("Creating tracking data for tag %1.",grad_lbm_trackingTag);
    _trackHash = [[],false] call CBA_fnc_hashCreate;
    profileNamespace setVariable [grad_lbm_trackingTag,_trackHash];
};

private _trackHash = profileNamespace getVariable grad_lbm_trackingTag;
[_trackHash] call grad_lbm_tracking_fnc_trackHashCleanup;
[_trackHash] call grad_lbm_tracking_fnc_trackHashUpdate;

INFO("Tracking initialized.");

_trackHash
