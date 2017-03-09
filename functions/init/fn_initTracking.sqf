#define PREFIX GRAD
#define COMPONENT lbm
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

private ["_trackHash"];

grad_lbm_trackingTag = [] call grad_lbm_tracking_fnc_getTrackingTag;
if (grad_lbm_trackingTag == "") exitWith {INFO("Not tracking purchases.")};
INFO("Tracking purchases.");

if (isNil {profileNamespace getVariable grad_lbm_trackingTag}) exitWith {
    INFO_1("Creating tracking data for tag %1.",grad_lbm_trackingTag);
    _trackHash = [[],false] call CBA_fnc_hashCreate;
    profileNamespace setVariable [grad_lbm_trackingTag,_trackHash];

    _trackHash
};

nil
