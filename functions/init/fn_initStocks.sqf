/*  Reads item stocks from config publishes them in a hash
*
*/

if (!isServer) exitWith {};

GRAD_LBM_ITEMSTOCKS = [] call CBA_fnc_hashCreate;

_baseConfigs = "true" configClasses (missionConfigFile >> "CfgGradBuymenu");
{
    _baseConfig = _x;
    _baseConfigName = configName _baseConfig;

    _categoryConfigs = "true" configClasses _baseConfig;
    {
        _categoryConfig = _x;
        _categoryConfigName = configName _categoryConfig;

        _itemConfigs = "true" configClasses _categoryConfig;
        {
            _itemConfig = _x;
            _itemConfigName = configName _itemConfig;

            if (isNumber (_itemConfig >> "stock")) then {
                _hashKey = format ["%1_%2_%3", _baseConfigName, _categoryConfigName, _itemConfigName];
                [GRAD_LBM_ITEMSTOCKS, _hashKey, getNumber (_itemConfig >> "stock")] call CBA_fnc_hashSet;
            };
        } forEach _itemConfigs;
    } forEach _categoryConfigs;
} forEach _baseConfigs;

publicVariable "GRAD_LBM_ITEMSTOCKS";
