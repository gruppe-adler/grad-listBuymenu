#define PREFIX GRAD
#define COMPONENT lbm
#include "..\..\defines_tracking.hpp"
#include "\x\cba\addons\main\script_macros_mission.hpp"

params [["_tag",[(missionConfigFile >> "CfgGradBuymenu" >> "trackingTag"), "text", ""] call CBA_fnc_getConfigEntry]];

if (!isServer) exitWith {};
if (_tag == "") exitWith {false};
_tag = [_tag] call BIS_fnc_filterString;
_tag = format ["mcd_lbm_tracking_%1",_tag];

if (isNil {profileNamespace getVariable _tag}) exitWith {ERROR_1("Tracking data for tag %1 not found. Can't clear.",_tag); false};

profileNamespace setVariable [_tag,nil];
saveProfileNamespace;

INFO_1("Tracking data for tag %1 deleted.",_tag);
(format ["Tracking data for tag %1 deleted.",_tag]) remoteExec ["systemChat",0,false];

true
