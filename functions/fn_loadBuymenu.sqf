#include "..\dialog\defines.hpp"
params [["_title", ""], ["_cargospace", objNull], ["_baseConfigName", ""]];

missionNamespace setVariable ["grad_lbm_currentCargospace", _cargospace];

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
