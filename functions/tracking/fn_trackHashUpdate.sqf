#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_hash"];

private _allBaseSets = "true" configClasses (missionConfigFile >> "CfgGradBuymenu");
{
    _baseConfigName = configName _x;
    _allCategories = "true" configClasses _x;
    {
        _categoryConfigName = configName _x;
        _allItems = "true" configClasses _x;
        {
            _itemConfigName = configName _x;
            ([_baseConfigName,_categoryConfigName,_itemConfigName,0,false] call grad_lbm_tracking_fnc_trackPurchase) params ["_itemDisplayName","_itemAmount"];
            if (_itemAmount == 0 && _itemDisplayName != "") then {INFO_3("New item: %1 >> %2 >> %3.",_baseConfigName,_categoryConfigName,_itemConfigName)};
            false
        } count _allItems;
        false
    } count _allCategories;
    false
} count _allBaseSets;
