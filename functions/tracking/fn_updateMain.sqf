#define PREFIX GRAD
#define COMPONENT lbm_tracking
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\ui_toolkit.hpp"
#include "..\..\defines_tracking.hpp"

params ["_categoryDropdown","_curSelIndex"];

private _display = ctrlParent _buyablesDropdown;
private _selData = call compile (_categoryDropdown lbData _curSelIndex);

/*diag_log str _selData;*/
