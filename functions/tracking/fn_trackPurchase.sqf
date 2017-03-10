/*  Tracks purchase.
*
*   Hash structure:
*   Trackinghash [HASH - Basesets]
*       Basedata [BaseDisplayName,[HASH - Categories]]
*           Categorydata [CategoryDisplayName,[HASH - Items]]
*               Itemsdata [ItemDisplayName,ItemAmount]
*
*   Returns:
*   [ItemDisplayName,ItemAmount]
*/

#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\defines_tracking.hpp"

params ["_baseConfigName","_categoryConfigName","_itemConfigName",["_purchaseAmount",1],["_save",true]];

private _doTrack = [(missionConfigFile >> "CfgGradBuymenu" >>  "tracking"), "number", 0] call CBA_fnc_getConfigEntry;
_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> "tracking"), "number", _doTrack] call CBA_fnc_getConfigEntry;
_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "tracking"), "number", _doTrack] call CBA_fnc_getConfigEntry;
_doTrack = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "tracking"), "number", _doTrack] call CBA_fnc_getConfigEntry;
if (_doTrack != 1 || !(missionNamespace getVariable ["grad_lbm_tracking_enabled",true])) exitWith {["",0]};

private _trackHash = profileNamespace getVariable [grad_lbm_trackingTag,false];
if (_trackHash isEqualType false) then {_trackHash = [] call grad_lbm_fnc_tracking_initTracking};

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

_itemAmount = _itemAmount + _purchaseAmount;
_itemDisplayName = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "displayName"), "text", [_itemConfigName] call grad_lbm_fnc_getDisplayName] call CBA_fnc_getConfigEntry;
[_categoryHash,_itemConfigName,[_itemAmount,_itemDisplayName]] call CBA_fnc_hashSet;

if (_save) then {saveProfileNamespace};

[_itemDisplayName,_itemAmount]
