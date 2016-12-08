/*  Displays 3D marker on bought vehicle.
*
*/

params ["_buyer", "_vehicle", "_baseConfigName", "_categoryConfigName", "_itemConfigName"];

if (!hasInterface) exitWith {};
if (player != _buyer) exitWith {};

_displayName = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "displayName"), "text", "Vehicle"] call CBA_fnc_getConfigEntry;



_function = {
    params ["_args", "_handle"];
    _args params ["_vehicle", "_displayName"];

    drawIcon3D ["a3\ui_f\data\gui\Rsc\RscDisplayIntel\azimuth_ca.paa", [1,1,1,1], (getPosATL _vehicle) vectorAdd [0,0,1], 1, 1, 45, format ["%1 (%2m)", _displayName, round (player distance _vehicle)], 1, 0.04, "PuristaMedium"];
};
_handle = [_function, 0, [_vehicle, _displayName]] call CBA_fnc_addPerFrameHandler;

[{
    params ["_handle"];
    [_handle] call CBA_fnc_removePerFrameHandler;
}, _handle, 15] call CBA_fnc_waitAndExecute;
