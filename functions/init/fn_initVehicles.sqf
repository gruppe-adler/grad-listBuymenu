/*  Gets bounding box size of all buyable vehicles
*
*/

if (!isServer) exitWith {};

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
{
    _type = _x;
    _vehicle = _type createVehicleLocal [0,0,0];
    _dimensions = _vehicle call BIS_fnc_boundingBoxDimensions;
    _dimensions params ["_h","_l","_w"];
    _size = sqrt(_h*_h + _l*_l + _w*_w);

    //static weapons tend to be a little too small
    if (_type isKindOf "StaticWeapon") then {_size = _size*1.2};

    [GRAD_LBM_VEHICLESIZES, _type, _size] call CBA_fnc_hashSet;

    deleteVehicle _vehicle;
} forEach _types;

publicVariable "GRAD_LBM_VEHICLESIZES";
