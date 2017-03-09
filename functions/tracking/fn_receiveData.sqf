#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_data","_inputText","_dataVarName"];

missionNamespace setVariable [_dataVarName,_data];

private _didReceiveVarName = format ["%1_received",_inputText];
missionNamespace setVariable [_didReceiveVarName,true];
