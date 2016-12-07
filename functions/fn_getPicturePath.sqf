params ["_configName", "_picturePath"];


if (_picturePath == "") then {
  //item is a weapon
  if (isClass (configFile >> "CfgWeapons" >> _configName)) then {
    _picturePath = getText (configFile >> "CfgWeapons" >> _configName >> "picture");
    if (_picturePath == "") then {
      _picturePath = getText (configFile >> "CfgWeapons" >> _configName >> "uipicture");
    };

  //item is a magazine
  } else {
    _picturePath = getText (configFile >> "CfgMagazines" >> _configName >> "picture");
    if (_picturePath == "") then {
      _picturePath = getText (configFile >> "CfgMagazines" >> _configName >> "uipicture");
    };
  };
};

_picturePath
