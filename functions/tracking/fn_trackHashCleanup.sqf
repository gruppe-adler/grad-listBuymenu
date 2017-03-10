#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_hash"];

if (([(missionConfigFile >> "CfgGradBuymenu" >> "trackingCleanup"), "number", 1] call CBA_fnc_getConfigEntry) == 0) exitWith {}; 

private _allBaseSets = "true" configClasses (missionConfigFile >> "CfgGradBuymenu");
private _allBaseSetNames = _allBaseSets apply {configName _x};
private _deleteBaseKeys = [];

private _fnc_forEachPair = {

    _value params ["_baseDisplayName","_categoriesHash"];
    _baseName = _key;

    if !(_baseName in _allBaseSetNames) then {_deleteBaseKeys pushBack _baseName} else {

        _allCategories = "true" configClasses (missionConfigFile >> "CfgGradBuymenu" >> _baseName);
        _allCategoryNames = _allCategories apply {configName _x};
        _deleteCategoryKeys = [];

        _fnc_forEachCategoryPair = {
            _value params ["_categoryDisplayName","_itemsHash"];
            _categoryName = _key;

            if !(_categoryName in _allCategoryNames) then {_deleteCategoryKeys pushBack _categoryName} else {

                _allItems = "true" configClasses (missionConfigFile >> "CfgGradBuymenu" >> _baseName >> _categoryName);
                _allItemNames = _allItems apply {configName _x};
                _deleteItemKeys = [];

                _fnc_forEachItemPair = {
                    _itemName = _key;

                    if !(_itemName in _allItemNames) then {_deleteItemKeys pushBack _itemName};
                };

                [_itemsHash, _fnc_forEachItemPair] call CBA_fnc_hashEachPair;
                {
                    INFO_2("%1 category no longer available - deleting from %2.",_x,_categoryDisplayName);
                    [_itemsHash,_x] call CBA_fnc_hashRem;
                    false
                } count _deleteItemKeys;
            };
        };

        [_categoriesHash, _fnc_forEachCategoryPair] call CBA_fnc_hashEachPair;
        {
            INFO_2("%1 category no longer available - deleting from %2.",_x,_baseDisplayName);
            [_categoriesHash,_x] call CBA_fnc_hashRem;
            false
        } count _deleteCategoryKeys;
    };
};

[_hash, _fnc_forEachPair] call CBA_fnc_hashEachPair;
{
    INFO_2("%1 base class no longer available - deleting from %2.",_x,grad_lbm_trackingTag);
    [_hash,_x] call CBA_fnc_hashRem;
    false
} count _deleteBaseKeys;
