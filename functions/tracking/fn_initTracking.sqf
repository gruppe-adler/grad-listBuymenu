#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

private ["_trackHash"];

grad_lbm_trackingTag = [] call grad_lbm_tracking_fnc_getTrackingTag;
if (grad_lbm_trackingTag == "") exitWith {INFO("Not tracking purchases.")};

if (isNil {profileNamespace getVariable grad_lbm_trackingTag}) then {
    INFO_1("Creating tracking data for tag %1.",grad_lbm_trackingTag);
    _trackHash = [[],false] call CBA_fnc_hashCreate;
    profileNamespace setVariable [grad_lbm_trackingTag,_trackHash];
};

private _trackHash = profileNamespace getVariable grad_lbm_trackingTag;
[_trackHash] call grad_lbm_tracking_fnc_trackHashCleanup;
[_trackHash] call grad_lbm_tracking_fnc_trackHashUpdate;

["lbmstats", {
    [] call grad_lbm_tracking_fnc_openDialog;
}, "adminLogged"] call CBA_fnc_registerChatCommand;

INFO("Tracking initialized.");

_trackHash
