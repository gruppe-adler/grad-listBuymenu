/*  Spawns vehicle
*
*/

params ["_buyer","_price","_code","_baseConfigName","_categoryConfigName","_itemConfigName","_vehiclespawn"];

_spawnEmpty = ([(missionConfigFile >> "CfgGradBuymenu" >> _baseConfigName >> _categoryConfigName >> _itemConfigName >> "spawnEmpty"), "number", 0] call CBA_fnc_getConfigEntry) == 1;
_minDistance = 0;

//vehiclespawn is object
if (_vehiclespawn isEqualType objNull) then {
    _minDistance = 15;
    _vehiclespawn = getPos _vehiclespawn;
};

//find spawn position
_spawnPosition = [];
for "_i" from 1 to 20 do {
    _spawnPosition = _vehiclespawn findEmptyPosition [_minDistance, 15 + 5*_i, _itemConfigName];
    if (str _spawnPosition != "[]") exitWith {};
};
if (str _spawnPosition == "[]") exitWith {[_buyer, _price, "No vehicle spawn position found. You got your money back."] remoteExec ["grad_lbm_fnc_reimburse",0,false];};

//spawn vehicle
_vehicle = _itemConfigName createVehicle _spawnPosition;
if (_spawnEmpty) then {
    clearBackpackCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
};

[_buyer,_itemConfigName,_vehicle,_spawnPosition] call _code;
