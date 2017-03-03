/*  Reimburses player in case something went wrong
*
*/

params ["_target", "_price", "_message"];
if (!hasInterface) exitWith {};
if (player != _target) exitWith {};

systemChat _message;
player setVariable ["grad_lbm_myFunds", (player getVariable ["grad_lbm_myFunds", 0]) + _price, true];
[] call grad_lbm_fnc_updateFunds;
