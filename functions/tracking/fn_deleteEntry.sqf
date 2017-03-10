#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

params [["_path",[]],["_tag",[(missionConfigFile >> "CfgGradBuymenu" >> "trackingTag"), "text", ""] call CBA_fnc_getConfigEntry]];

if (!isServer) exitWith {};
if (count _path == 0) exitWith {};

private _trackingTag = [_tag] call grad_lbm_tracking_fnc_getTrackingTag;
if (_trackingTag == "") exitWith {false};

_path params ["_buyablesSet","_category","_item"];
private _trackHash = profileNamespace getVariable [_trackingTag,[]];
if !([_trackHash] call CBA_fnc_isHash) exitWith {ERROR_1("No data for %1. Cannot delete entry.",_tag)};

if !([_trackHash,_buyablesSet] call CBA_fnc_hashHasKey) exitWIth {ERROR_2("Buyables set %1 not found in data for %2. Cannot delete entry.",_buyablesSet,_tag)};
if (isNil "_category") exitWith {
    INFO_2("Deleting %1 from %2.",_buyablesSet,_tag);
    [_trackHash,_buyablesSet] call CBA_fnc_hashRem;
    saveProfileNamespace;
};

private _baseData = [_trackHash,_buyablesSet] call CBA_fnc_hashGet;
_baseData params ["","_categoryHash"];
if !([_categoryHash] call CBA_fnc_isHash) exitWith {ERROR_2("%1 >> %2 is apparently not a hash. Cannot delete entry.",_tag,_buyablesSet)};
if !([_categoryHash,_category] call CBA_fnc_hashHasKey) exitWIth {ERROR_3("%1 >> %2 >> %3 not found. Cannot delete entry.",_tag,_buyablesSet,_category)};
if (isNil "_item") exitWith {
    INFO_3("Deleting %1 >> %2 from %3",_buyablesSet,_category,_tag);
    [_categoryHash,_category] call CBA_fnc_hashRem;
    saveProfileNamespace;
};

private _categoryData = [_categoryHash,_category] call CBA_fnc_hashGet;
_categoryData params ["","_itemHash"];
if !([_itemHash] call CBA_fnc_isHash) exitWith {ERROR_3("%1 >> %2 >> %3 is apparently not a hash. Cannot delete entry.",_tag,_buyablesSet,_category)};
if !([_itemHash,_item] call CBA_fnc_hashHasKey) exitWIth {ERROR_4("%1 >> %2 >> %3 >> %4 not found. Cannot delete entry.",_tag,_buyablesSet,_category,_item)};

INFO_4("Deleting %1 >> %2 >> %3 from %4",_buyablesSet,_category,_item,_tag);
[_itemHash,_item] call CBA_fnc_hashRem;
saveProfileNamespace;
