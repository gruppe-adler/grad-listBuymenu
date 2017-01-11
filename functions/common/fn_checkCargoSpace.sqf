/*  Checks if a weaponholder needs to be spawned
*
*/

params ["_cargospace"];

_cargospacePosition = (missionNamespace getVariable ["grad_lbm_currentOwnerObject",player]) getVariable "grad_lbm_currentCargoSpacePosition";

if (typename _cargospace == "OBJECT" && {isNull _cargospace && !isNil "_cargospacePosition"}) then {
    _cargospace = createVehicle ["groundWeaponHolder", _cargospacePosition , [], 0, "can_Collide"];
    (missionNamespace getVariable ["grad_lbm_currentOwnerObject",player]) setVariable ["grad_lbm_currentCargospace", _cargospace];
};

_cargospace
