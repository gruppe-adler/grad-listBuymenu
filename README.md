# GRAD List-Buymenu
A simple interface to buy stuff.

![](http://i.imgur.com/asSxvsi.jpg)

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)
* [ACE3](https://github.com/acemod/ACE3)

## Installation

### Manually
1. Create a folder in your mission root folder and name it `modules`. Then create one inside there and call it `grad-listbuymenu`.
2. Download the contents of this repository ( there's a download link at the side ) and put it into the directory you just created.
3. Append the following lines of code to the `description.ext`:

```sqf
#include "modules\grad-listBuymenu\grad_listBuymenu.hpp"

class CfgFunctions {
    #include "modules\grad-listBuymenu\cfgFunctions.hpp"
};
```


### Via `npm`
_for details about what npm is and how to use it, look it up on [npmjs.com](https://www.npmjs.com/)_

1. Install package `grad-listbuymenu` : `npm install --save grad-listbuymenu`
2. Append the following lines of code to the `description.ext`:

```sqf
#define MODULES_DIRECTORY node_modules
#include "node_modules\grad-listBuymenu\grad_listBuymenu.hpp"

class CfgFunctions {
    #include "node_modules\grad-listBuymenu\cfgFunctions.hpp"
};
```

## Usage
### Access Menu
To add the ACE-Interaction to open the buymenu, use `[object,buyables set,cargospace,vehiclespawn,shopname,action description,condition] call grad_lbm_fnc_addInteraction`:

| Parameter                     | Explanation                                                                                                                                                                                                            |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| object                        | Object - The object that the interaction will be attached to.                                                                                                                                                          |
| buyables set                  | String - The buyables set that this buymenu will get its items from.                                                                                                                                                   |
| cargospace                    | Object or PositionASL - An object with an inventory, that bought items will be placed in, in case player has no space. If position is used, items will be placed on the ground at position.                            |
| vehiclespawn                  | Object or Position - Bought vehicles and units will try to spawn here. Can be the same as parameter 0. If object is used, vehicles will spawn with a minimum distance to object (so use `getpos object` for helipads). |
| shopname (optional)           | String  - Name of this buymenu. Displayed in title bar. Default is empty.                                                                                                                                              |
| action description (optional) | String - Display name of this action. Default is "Buy Gear".                                                                                                                                                           |
| condition (optional)          | Code - Condition for the action to be displayed.                                                                                                                                                                       |
| position (optional)           | Position array, Position code or Selection Name - Position of interaction. Only relevant if custom action path is used.                                                                                                |
| distance (optional)           | Number - Interaction distance. Only relevant if custom action path is used.                                                                                                                                            |
| action path (optional)        | Array - ACE action path. Defaults to ["ACE_SelfActions"] or ["ACE_MainActions"]                                                                                                                                        |

### Add Funds
To add funds to a unit use `[unit,funds] call grad_lbm_fnc_addFunds`.  
This function has global effect. New funds total is returned.

| Parameter       | Explanation                                      |
|-----------------|--------------------------------------------------|
| unit            | Object - The unit whose funds to set.            |
| funds           | Number - The funds to add to the unit.           |

### Get Funds
To get the funds of a unit use `[unit] call grad_lbm_fnc_getFunds`.

| Parameter | Explanation                          |
|-----------|--------------------------------------|
| unit      | Object - The unit whose funds to get |

### Set Permission Level
To set a unit's permission level use `[unit, permissionLevel] call grad_lbm_fnc_setPermissionLevel`.  
This function has global effect. Unit will only be able to buy items of equal or lower permission level. If no permission level is set, unit has level 0.

| Parameter       | Explanation                                      |
|-----------------|--------------------------------------------------|
| unit            | Object - The unit whose permission level to set. |
| permissionLevel | Number - The permission level to set.            |

### View Tracking Data
There is currently no functionality to view the data. Sorry.

### Clear Tracking Data
To clear the tracking data of a mission use `[trackingTag] call grad_lbm_fnc_clearTrackingData`.
This function has to be executed on server.

| Parameter              | Explanation                                                                                |
|------------------------|--------------------------------------------------------------------------------------------|
| trackingTag (optional) | The tag that you want want to delete. Defaults to the tag of the currently loaded mission. |

## Configuration
Buyables are defined in your `description.ext`.
* CfgGradBuymenu
    * buyables set 1
        * category 1
            * item 1
            * item 2
            * ...
        * category 2
            * ...
    * buyables set 2
        * ...

### Module Attributes

| Option            | Explanation                                                                                                                             |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| `vehicleMarkers`  | 0/1 - Sets if a 3D marker will be displayed on bought vehicles and units (optional). On by default.                                     |
| `permissionLevel` | Number - Sets permission level needed to be able to buy anything (optional). Default is 0.                                              |
| `tracking`        | 0/1 - Sets if purchases will be tracked and saved in profileNamespace of server (optional). Default is 0.                               |
| `trackingTag`     | String - The tag that this missions tracking data will be saved under. Can be the same in two different missions to combine their data. |

### Buyables Set Attributes

| Option            | Explanation                                                                                                                         |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| `vehicleMarkers`  | 0/1 - Overrides module setting for this set (optional).                                                                             |
| `permissionLevel` | Number - Sets permission level needed to be able to buy from this set. Overrides module permission level (optional).                |
| `tracking`        | 0/1 - Sets if purchases will be tracked and saved in profileNamespace of server (optional). Overrides module setting. Default is 0. |

### Category Attributes

| Option            | Explanation                                                                                                                               |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| `kindOf`          | String - Sets type of category. (see below)                                                                                               |
| `displayName`     | String - Sets display name of category (optional). Category classname is used by default.                                                 |
| `permissionLevel` | Number - Sets permission level needed to be able to buy from this category. Overrides buyables set permission level (optional).           |
| `spawnEmpty`      | 0/1 - Sets if vehicles of this category will spawn with empty inventory (optional). Off by default. Only available for type `"Vehicles"`  |
| `condition`       | String - Condition for this category to be displayed (optional).                                                                          |
| `tracking`        | 0/1 - Sets if purchases will be tracked and saved in profileNamespace of server (optional). Overrides buyables set setting. Default is 0. |

### Item Attributes

| Option            | Explanation                                                                                                                                          |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| `displayName`     | String - Sets display name of item. (optional, actual displayName of item is used if it has one)                                                     |
| `description`     | String - Sets description of item. Supports structured text. (optional, for CfgWeapon items their short description is used)                         |
| `price`           | Number - Sets price of (one set of) this item.                                                                                                       |
| `stock`           | Number - Sets total amount of this item that can be bought.                                                                                          |
| `amount`          | Number - Sets amount of this item that buyer gets per click of buy button (optional). Default is 1. Only available for type `"Items"` and `"Units"`. |
| `code`            | String - Sets code that is executed when item is bought (optional). (see below)                                                                      |
| `picture`         | String - Path to custom picture for this item (optional). By default the UI picture, that most objects in Arma have, is used.                        |
| `kindOf`          | String - Overrides category type for this item (optional).                                                                                           |
| `muzzleItem`      | String - Sets muzzle item (i.e. suppressor) that is included with this item (optional). Only available for type `"Weapons"`                          |
| `opticsItem`      | String - Sets optics item (i.e. red dot) that is included with this item (optional). Only available for type `"Weapons"`                             |
| `pointerItem`     | String - Sets pointer item (i.e. gunlight) that is included with this item (optional). Only available for type `"Weapons"`                           |
| `underbarrelItem` | String - Sets underbarrel item (i.e. bipod) that is included with this item (optional). Only available for type `"Weapons"`                          |
| `previewScale`    | Number - Sets scale factor for 3D object preview in case this item displays too small/big (optional). Only available for type `"Vehicles"`           |
| `permissionLevel` | Number - Sets permission level needed to be able to buy this item. Overrides category permission level (optional).                                   |
| `spawnEmpty`      | 0/1 - Sets if this vehicle will spawn with empty inventory (optional). Overrides category setting. Only available for type `"Vehicles"`              |
| `condition`       | String - Condition for this item to be displayed (optional). Does *not* Override category condition.                                                 |
| `tracking`        | 0/1 - Sets if purchases will be tracked and saved in profileNamespace of server (optional). Overrides category setting. Default is 0.                |

### Category Types
Because different types of items require different spawn routines, the type of a category needs to be defined. Available types are:
* `"Weapons"` (for any type of weapon - primary, handgun or launcher)
* `"Items"` (for any inventory item including magazines, grenades, etc.)
* `"Wearables"` (for uniforms, vests, backpacks, helmets)
* `"Vehicles"` (for cars, trucks, helicopters, tanks, etc.)
* `"Units"` (for AI units)
* `"Other"` (for anything else - nothing will spawn, only `code` will be called)

### Code
The script saved in `code` is called when an item is bought. It will be called on server and buyer. The passed parameters depend on item type.


| Type                                             | Passed Parameters                                    |
|--------------------------------------------------|------------------------------------------------------|
| `"Weapons"`, `"Items"`, `"Wearables"`, `"Other"` | [buyer, item class name]                             |
| `"Vehicles"`                                     | [buyer, vehicle class name, vehicle, spawn position] |
| `"Units"`                                        | [buyer, unit class name, group, spawn position]      |


## Example
This is what your `description.ext` needs for grad-listbuymenu to work:
```sqf
//these are required
#define MODULES_DIRECTORY node_modules
#include "node_modules\grad-listBuymenu\grad_listBuymenu.hpp"
class CfgFunctions {
    #include "node_modules\grad-listBuymenu\cfgFunctions.hpp"
};
```

Now we configure what can be bought. This also goes into your `description.ext`:
```sqf
class CfgGradBuymenu {

    //buyables set:
    class AmericanStuff {

        //category:  
        class Weapons {
            kindOf = "Weapons";
            displayName = "Weapons";

            //items of this category:
            class rhs_weap_m240G {
                displayName = "M240G";
                description = "The M240 is a belt-fed, gas-operated general purpose machine gun firing the 7.62x51mm NATO cartridge.";
                price = 2500;
                stock = 5;
                opticsItem = optic_Aco
            };
        };

        class Units {
            displayname = "Units";
            kindOf = "Units";

            class B_Soldier_SL_F {
                displayName = "NATO Squadleader (x3)";
                description = "This is a team of NATO squad leaders.";
                price = 3000;
                amount = 3;
                stock = 5;
                code = "{_x removeWeaponGlobal (primaryWeapon _x)} forEach units (_this select 2)";
            };
        };
    };

    //a different set of buyables
    class RussianStuff {        
        class Vehicles {
            displayName = "Vehicles";
            kindOf = "Vehicles";

            class C_Hatchback_01_sport_F {
                displayName = "Hatchback (Sport)";
                description = "This thing is quick";
                price = 4000;
                stock = 10;
                picture = "myPictureFolder\sportscar.paa";  //this item uses a custom picture
                code = "(_this select 2) setFuel 0.5";  //this car will spawn with half a tank of gas                
                spawnEmpty = true;
            };
        };

        class Items {
            displayName = "Items";
            kindOf = "Items";

            class ACE_fieldDressing {
                displayName = "Bandages (x10)";
                description = "10 simple bandages in sterile packaging.";
                amount = 10;
                price = 100;
                stock = 40;     //note that a total of 400 bandages can be bought (in sets of 10)
            };
        };
    };
};
```

So we have two sets of buyables. One called "AmericanStuff" and one "RussianStuff". To add the interaction to open the buymenu, we do this:
```sqf
//interaction for Americans:
[aHumvee,"AmericanStuff",aHumvee,aHelipad,"American Store","Buy American Things",{side player == WEST}] call grad_lbm_fnc_addInteraction;

//interaction for Russians:
[aRadioTruck,"RussianStuff",aBoxNearTheTruck,[4582,1452,0],"Russian Store","Buy Russian Things",{side player == EAST}] call grad_lbm_fnc_addInteraction;
```
