params ["_configName"];
private ["_picturePath"];

switch (true) do {
    case (isClass (configFile >> "CfgWeapons" >> _configName)): {
        _picturePath = getText (configFile >> "CfgWeapons" >> _configName >> "picture");
        if (_picturePath == "") then {
            _picturePath = getText (configFile >> "CfgWeapons" >> _configName >> "uipicture");
        };
    };

    case (isClass (configFile >> "CfgVehicles" >> _configName)): {
        _picturePath = getText (configFile >> "CfgVehicles" >> _configName >> "picture");
        if (_picturePath == "") then {
            _picturePath = getText (configFile >> "CfgVehicles" >> _configName >> "uipicture");
        };
    };

    case (isClass (configFile >> "CfgMagazines" >> _configName)): {
        _picturePath = getText (configFile >> "CfgMagazines" >> _configName >> "picture");
        if (_picturePath == "") then {
            _picturePath = getText (configFile >> "CfgMagazines" >> _configName >> "uipicture");
        };
    };

    default {
        _picturePath = "";
    };
};

_picturePath
