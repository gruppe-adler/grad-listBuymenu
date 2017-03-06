params ["_itemClass"];

private _displayName = "";
_displayName = [configfile >> "CfgWeapons" >> _itemClass >> "displayName", "text", ""] call CBA_fnc_getConfigEntry;

if (_displayName == "") then {
    _displayName = [configfile >> "CfgMagazines" >> _itemClass >> "displayName", "text", ""] call CBA_fnc_getConfigEntry;

    if (_displayName == "") then {
        _displayName = [configfile >> "CfgVehicles" >> _itemClass >> "displayName", "text", ""] call CBA_fnc_getConfigEntry;

        if (_displayName == "") then {
            _displayName = [configfile >> "CfgGlasses" >> _itemClass >> "displayName", "text", ""] call CBA_fnc_getConfigEntry;

            if (_displayName == "") then {
                _displayName = "UNDEFINED DISPLAYNAME";
            };
        };
    };
};

_displayName
