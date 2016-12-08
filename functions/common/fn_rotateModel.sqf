/*  Rotates 3D Model while dialog is open
*
*/

params ["_modelCtrl"];
_modelCtrl ctrlSetModelDirAndUp [[0,1,0.08],[0,0,1]];

[{
    params ["_modelCtrl", "_handle"];
    if (isNull _modelCtrl) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    (ctrlModelDirAndUp _modelCtrl) params ["_currentDir"];
    _currentDir params ["_x", "_y","_z"];

    ([[_x,_y], 1] call BIS_fnc_rotateVector2D) params ["_newX","_newY"];

    _modelCtrl ctrlSetModelDirAndUp [[_newX,_newY,_z],[0,0,1]];
    _modelCtrl ctrlCommit 0;
} , 0.03, _modelCtrl] call CBA_fnc_addPerFrameHandler;
