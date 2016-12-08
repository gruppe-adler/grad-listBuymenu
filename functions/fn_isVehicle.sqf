/*  Checks if type is vehicle
*
*/

params ["_type"];

_isVehicle = switch (true) do {
    case (_type isKindOf "Man"): {false};
    case (_type isKindOf "StaticWeapon"): {true};
    case (_type isKindOf "LandVehicle"): {true};
    case (_type isKindOf "Air"): {true};
    default {false};
};

_isVehicle
