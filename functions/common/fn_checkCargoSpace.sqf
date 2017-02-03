/*  Checks if a weaponholder needs to be spawned
*
*/

params ["_cargospace"];

_cargospacePosition = (missionNamespace getVariable ["grad_lbm_currentOwnerObject",player]) getVariable "grad_lbm_currentCargoSpacePosition";

if (typename _cargospace == "OBJECT" && {isNull _cargospace && !isNil "_cargospacePosition"}) then {
    _cargospace = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_Collide"];
    _cargospace setPosASL _cargospacePosition;
    (missionNamespace getVariable ["grad_lbm_currentOwnerObject",player]) setVariable ["grad_lbm_currentCargospace", _cargospace, true];
};

_cargospace
