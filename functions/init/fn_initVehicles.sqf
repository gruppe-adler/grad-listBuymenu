/*  Gets bounding box size of all buyable vehicles
*
*/

#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\defines.hpp"

GRAD_LBM_VEHICLESIZES = [] call CBA_fnc_hashCreate;

//find all vehicle types
_types = [];
_baseConfigs = "true" configClasses (missionConfigFile >> "CfgGradBuymenu");
{
    _categoryConfigs = "true" configClasses _x;
    {
        _itemConfigs = "true" configClasses _x;
        {
            _item = configName _x;
            if ([_item] call grad_lbm_fnc_isVehicle) then {
                _types pushBackUnique _item;
            };
        } forEach _itemConfigs;
    } forEach _categoryConfigs;
} forEach _baseConfigs;


//check sizes
_aspectRatio = grad_lbm_Column_W/grad_lbm_Picture_H;
{
    _type = _x;
    _vehicle = _type createVehicleLocal [0,0,0];
    _dimensions = _vehicle call BIS_fnc_boundingBoxDimensions;
    _dimensions params ["_w","_l","_h"];
    _highObject = _l/_h < _aspectRatio && _w/_h < _aspectRatio;

    _size = if (_highObject) then {_h * grad_lbm_Picture_H * 8} else {(_l max _w) * grad_lbm_Column_W * 2};

    //static weapons tend to be a little too small
    if (_type isKindOf "StaticWeapon") then {_size = _size*0.8};
    if (_type isKindOf "Static") then {_size = _size*1.3};

    [GRAD_LBM_VEHICLESIZES, _type, _size] call CBA_fnc_hashSet;

    deleteVehicle _vehicle;
} forEach _types;
