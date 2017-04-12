params ["_baseConfigName","_categoryConfigName","_itemConfigName"];

_modulePermissionLevel = [(missionConfigFile >> "CfgGradBuymenu" >> "permissionLevel"), "number", -1] call CBA_fnc_getConfigEntry;
_basePermissionLevel = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> "permissionLevel"), "number", -1] call CBA_fnc_getConfigEntry;
_categoryPermissionLevel = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> "permissionLevel"), "number", -1] call CBA_fnc_getConfigEntry;
_itemPermissionLevel = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "permissionLevel"), "number", -1] call CBA_fnc_getConfigEntry;

_permissionLevel = switch (true) do {
    case (_itemPermissionLevel != -1): {_itemPermissionLevel};
    case (_categoryPermissionLevel != -1): {_categoryPermissionLevel};
    case (_basePermissionLevel != -1): {_basePermissionLevel};
    case (_modulePermissionLevel != -1): {_modulePermissionLevel};
    default {0};
};

_permissionLevel
