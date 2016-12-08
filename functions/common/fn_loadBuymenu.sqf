/*  Opens the buymenu
*
*/

#include "..\..\dialog\defines.hpp"
params [["_caller", player],["_cargospace", objNull], ["_vehiclespawn", objNull],["_baseConfigName", ""],["_title", ""]];

if (isNull _cargospace) then {_cargospace = _caller};
if (_vehiclespawn isEqualType objNull) then {
    if (isNull _vehiclespawn) then {_vehiclespawn = _caller};
};

missionNamespace setVariable ["grad_lbm_currentCargospace", _cargospace];
missionNamespace setVariable ["grad_lbm_currentVehiclespawn", _vehiclespawn];

//create dialog
disableSerialization;
createDialog "grad_lbm";
_dialog = findDisplay grad_lbm_DIALOG;
_dialog setVariable ["grad_lbm_currentBaseConfig", _baseConfigName];

//update titlebar
_titleCtrl = _dialog displayCtrl grad_lbm_TITLE;
_titleCtrl ctrlSetText toUpper _title;
[] call grad_lbm_fnc_updateFunds;

//update categories
[_baseConfigName] call grad_lbm_fnc_updateCategories;
