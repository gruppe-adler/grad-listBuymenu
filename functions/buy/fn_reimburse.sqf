/*  Reimburses player in case something went wrong
*
*/

params ["_target", "_account", "_price", "_message"];
if (!hasInterface) exitWith {};
if (player != _target) exitWith {};

systemChat _message;

[_account,_price] call grad_lbm_fnc_addFunds;
