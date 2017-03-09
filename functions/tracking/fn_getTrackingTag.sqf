params [["_tag",[(missionConfigFile >> "CfgGradBuymenu" >> "trackingTag"), "text", ""] call CBA_fnc_getConfigEntry]];

if (_tag == "") exitWith {""};
private _trackingTag = format ["mcd_lbm_tracking_%1",[_tag] call BIS_fnc_filterString];

_trackingTag
