#define PREFIX GRAD
#define COMPONENT lbm
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

private _tag = [(missionConfigFile >> "CfgGradBuymenu" >> "trackingTag"), "text", ""] call CBA_fnc_getConfigEntry;
if (_tag == "") exitWith {INFO("Not tracking purchases.")};

INFO_1("Tracking purchases under tag %1.",_tag);

_tag = [_tag] call BIS_fnc_filterString;
grad_lbm_trackingTag = format ["mcd_lbm_tracking_%1",_tag];

if (isNil {profileNamespace getVariable grad_lbm_trackingTag}) then {
    profileNamespace setVariable [grad_lbm_trackingTag,[[],false] call CBA_fnc_hashCreate];
};
