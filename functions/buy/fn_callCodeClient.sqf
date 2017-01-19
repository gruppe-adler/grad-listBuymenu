params ["_args","_code"];
_buyer = _args select 0;

if (player != _buyer) exitWith {};
if (isServer) exitWith {};

_args call _code;
