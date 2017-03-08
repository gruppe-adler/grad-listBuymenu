/*  Tracks purchase.
*
*   Hash structure:
*   Trackinghash [HASH - Basesets]
*       Basehash [BaseDisplayName,[HASH - Categories]]
*           Categoryhash [CategoryDisplayName,[HASH - Items]]
*               Itemshash [ItemDisplayName,ItemAmount]
*
*   Returns:
*   [ItemDisplayName,ItemAmount]
*/

#define PREFIX GRAD
#define COMPONENT lbm
#include "..\..\defines_tracking.hpp"
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_baseConfigName","_categoryConfigName","_itemConfigName"];

private _doTrack = [(missionConfigFile >> "CfgGradBuymenu" >>  "tracking"), "number", 0] call CBA_fnc_getConfigEntry;
_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> "tracking"), "number", _doTrack] call CBA_fnc_getConfigEntry;
_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "tracking"), "number", _doTrack] call CBA_fnc_getConfigEntry;
_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "tracking"), "number", _doTrack] call CBA_fnc_getConfigEntry;
if (_doTrack != 1) exitWith {};

private _trackHash = profileNamespace getVariable [grad_lbm_trackingTag,false];
if (_trackHash isEqualType false) then {_trackHash = [] call grad_lbm_fnc_initTracking};

if !([_trackHash,_baseConfigName] call CBA_fnc_hashHasKey) then {
    [_trackHash,_baseConfigName,[_baseConfigName,[[],false] call CBA_fnc_hashCreate]] call CBA_fnc_hashSet;
};

private _baseHash = ([_trackHash,_baseConfigName] call CBA_fnc_hashGet) select 1;

if !([_baseHash,_categoryConfigName] call CBA_fnc_hashHasKey) then {
    _categoryConfigDisplayName = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "displayName"), "text", _categoryConfigName] call CBA_fnc_getConfigEntry;
    [_baseHash,_categoryConfigName,[_categoryConfigDisplayName,[[],[0,""]] call CBA_fnc_hashCreate]] call CBA_fnc_hashSet;
};

private _categoryHash = ([_baseHash,_categoryConfigName] call CBA_fnc_hashGet) select 1;

([_categoryHash,_itemConfigName] call CBA_fnc_hashGet) params ["_itemAmount","_itemDisplayName"];

_itemAmount = _itemAmount + 1;
_itemDisplayName = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "displayName"), "text", [_itemConfigName] call grad_lbm_fnc_getDisplayName] call CBA_fnc_getConfigEntry;
[_categoryHash,_itemConfigName,[_itemAmount,_itemDisplayName]] call CBA_fnc_hashSet;

saveProfileNamespace;

[_itemDisplayName,_itemAmount]
