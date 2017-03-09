#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\defines_tracking.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

params ["_editBox",["_DIK",28]];

if !(_DIK in [DIK_RETURN,DIK_NUMPADENTER]) exitWith {};


private _display = ctrlParent _editBox;
private _inputText = [ctrlText _editBox] call BIS_fnc_filterString;


if (_inputText == "") exitWith {};


private _didReceiveVarName = format ["%1_received",_inputText];
private _dataVarName = format ["grad_lbm_tracking_receivedData_%1",_inputText];
[player,_inputText,_dataVarName] remoteExec ["grad_lbm_tracking_fnc_requestData",2,false];
missionNamespace setVariable [_didReceiveVarName,false];


private _mainCenterText = _display displayCtrl MAIN_CENTERTEXT_IDC;
_mainCenterText ctrlSetText "REQUESTING DATA FROM SERVER...";
_mainCenterText ctrlSetTextColor TAGTEXTCOLOR_SUCCESS;


[{missionNamespace getVariable [_this select 0,false]},{
    params ["_didReceiveVarName","_inputText","_display","_dataVarName","_editBox","_mainCenterText"];

    missionNamespace setVariable [_didReceiveVarName,nil];
    _data = missionNamespace getVariable [_dataVarName,[]];

    if !([_data] call CBA_fnc_isHash) then {
        _mainCenterText ctrlSetText (format ["NO DATA FOR %1",toUpper _inputText]);
        _mainCenterText ctrlSetTextColor TAGTEXTCOLOR_FAILURE;
        _editBox ctrlSetTextColor TAGTEXTCOLOR_FAILURE;
    } else {
        _mainCenterText ctrlSetText "";
        _editBox ctrlSetTextColor TAGTEXTCOLOR_SUCCESS;
    };

    [_data,_display,_inputText,_editBox] call grad_lbm_tracking_fnc_updateSidebar;

},[_didReceiveVarName,_inputText,_display,_dataVarName,_editBox,_mainCenterText],5,{ERROR_1("Data for tag %1 not received within 5 seconds.",_this select 0)}] call CBA_fnc_waitUntilAndExecute;
