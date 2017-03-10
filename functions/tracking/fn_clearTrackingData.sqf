#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\defines_tracking.hpp"


params [["_tag",[(missionConfigFile >> "CfgGradBuymenu" >> "trackingTag"), "text", ""] call CBA_fnc_getConfigEntry]];

if (!isServer) exitWith {};
private _trackingTag = [_tag] call grad_lbm_tracking_fnc_getTrackingTag;
if (_trackingTag == "") exitWith {false};


if (isNil {profileNamespace getVariable _tag}) exitWith {ERROR_1("Tracking data for tag %1 not found. Can't clear.",_tag); false};

profileNamespace setVariable [_tag,nil];
saveProfileNamespace;

INFO_1("Tracking data for tag %1 deleted.",_tag);
(format ["Tracking data for tag %1 deleted.",_tag]) remoteExec ["systemChat",0,false];

true
