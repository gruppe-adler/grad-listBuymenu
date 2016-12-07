#include "..\..\dialog\defines.hpp"
disableSerialization;

_dialog = findDisplay grad_lbm_DIALOG;
if (isNull _dialog) exitWith {};

_myfundsCtrl = _dialog displayCtrl grad_lbm_MYFUNDS;
_myfundsCtrl ctrlSetText format ["CREDITS: %1",(player getVariable ["grad_lbm_myFunds", 0])];
