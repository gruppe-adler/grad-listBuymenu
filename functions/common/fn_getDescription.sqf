params ["_itemClass"];

_description = [configfile >> "CfgWeapons" >> _itemClass >> "descriptionShort", "text", ""] call CBA_fnc_getConfigEntry;
if (_description == "") then {
    _description = [configfile >> "CfgMagazines" >> _itemClass >> "descriptionShort", "text", ""] call CBA_fnc_getConfigEntry;
};

_description
