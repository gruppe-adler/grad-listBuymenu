#define PREFIX GRAD
#define COMPONENT lbm
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_baseConfigName","_categoryConfigName","_itemConfigName"];

_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >>  "tracking"), "number", 0] call CBA_fnc_getConfigEntry;
_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> "tracking"), "number", _doTrack] call CBA_fnc_getConfigEntry;
_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "tracking"), "number", _doTrack] call CBA_fnc_getConfigEntry;
_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "tracking"), "number", _doTrack] call CBA_fnc_getConfigEntry;
if (_doTrack != 1) exitWith {};

_trackHash = profileNamespace getVariable [grad_lbm_trackingTag,false];
if (_trackHash isEqualType false) exitWith {ERROR_1("Tracking hash not found.")};

if !([_trackHash,_baseConfigName] call CBA_fnc_hashHasKey) then {
    [_trackHash,_baseConfigName,[[],false] call CBA_fnc_hashCreate] call CBA_fnc_hashSet;
};

_baseHash = [_trackHash,_baseConfigName] call CBA_fnc_hashGet;

if !([_baseHash,_categoryConfigName] call CBA_fnc_hashHasKey) then {
    [_baseHash,_categoryConfigName,[[],0] call CBA_fnc_hashCreate] call CBA_fnc_hashSet;
};

_categoryHash = [_baseHash,_categoryConfigName] call CBA_fnc_hashGet;
[_categoryHash,_itemConfigName,([_categoryHash,_itemConfigName] call CBA_fnc_hashGet)+1] call CBA_fnc_hashSet;

saveProfileNamespace;
