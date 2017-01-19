params ["_args","_code"];
_buyer = _args select 0;

if (!isServer) exitWith {};
if (player == _buyer) exitWith {};

_args call _code;
