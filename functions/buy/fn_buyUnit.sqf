params ["_buyer","_price","_code","_baseConfigName","_categoryConfigName","_itemConfigName","_vehiclespawn"];

_amount = [(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "amount"), "number", 1] call CBA_fnc_getConfigEntry;

//vehiclespawn is object
if (_vehiclespawn isEqualType objNull) then {
    _vehiclespawn = getPos _vehiclespawn;
};

//find spawn position
_spawnPosition = [];
for "_i" from 1 to 20 do {
    _spawnPosition = _vehiclespawn findEmptyPosition [0, 10 + 5*_i, _itemConfigName];
    if (str _spawnPosition != "[]") exitWith {};
};
if (str _spawnPosition == "[]") exitWith {[_buyer, _price, "No unit spawn position found. You got your money back."] remoteExec ["grad_lbm_fnc_reimburse",0,false]};

//spawn units
_group = createGroup side _buyer;
for "_i" from 1 to _amount do {
    _itemConfigName createUnit [_spawnPosition, _group];
};

[_buyer,_itemConfigName,_group,_spawnPosition] call _code;
