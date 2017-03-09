#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_caller","_inputText","_dataVarName"];

private _trackingTag = [_inputText] call grad_lbm_tracking_fnc_getTrackingTag;
_data = profileNamespace getVariable [_trackingTag,[]];

[_data,_inputText,_dataVarName] remoteExec ["grad_lbm_tracking_fnc_receiveData",_caller,false];
