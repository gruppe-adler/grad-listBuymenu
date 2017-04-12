/*  Opens the buymenu
*
*/

#include "..\..\dialog\defines.hpp"
params [["_object", player],["_cargospace", objNull], ["_vehiclespawn", objNull],["_baseConfigName", ""],["_title", ""],["_account",player]];

if (typeName _cargospace == "OBJECT") then {
    if (isNull _cargospace) then {_cargospace = _caller};
};

if (_vehiclespawn isEqualType objNull) then {
    if (isNull _vehiclespawn) then {_vehiclespawn = _caller};
};

missionNamespace setVariable ["grad_lbm_currentAccount", _account];
missionNamespace setVariable ["grad_lbm_currentOwnerObject", _object];
_object setVariable ["grad_lbm_currentVehiclespawn", _vehiclespawn];
if (typeName _cargospace == "ARRAY") then {
    _object setVariable ["grad_lbm_currentCargoSpacePosition", _cargospace];
} else {
    _object setVariable ["grad_lbm_currentCargospace", _cargospace];
};


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
