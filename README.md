# GRAD List-Buymenu
A simple interface to buy stuff.

## Dependencies
The [CBA_A3](https://github.com/CBATeam/CBA_A3) mod is required.

## Installation

### Manually
1. Create a folder in your mission root folder and name it `modules`. Then create one inside there and call it `grad-listbuymenu`.
2. Download the contents of this repository ( there's a download link at the side ) and put it into the directory you just created.
3. see step 3 below in the npm part

### Via `npm`
_for details about what npm is and how to use it, look it up on [npmjs.com](https://www.npmjs.com/)_

1. Install package `grad-listbuymenu` : `npm install --save grad-listbuymenu`
2. Prepend your mission's `description.ext` with `#define MODULES_DIRECTORY node_modules`
3. Append the following lines of code to the `description.ext`:

```sqf
#define MODULES_DIRECTORY node_modules
#include "node_modules\grad-listBuymenu\grad_listBuymenu.hpp"

class CfgFunctions {
    #include "node_modules\grad-listBuymenu\grad_listBuymenu.hpp"
};
```

## Usage
To add the ACE-Interaction to open the buymenu, use `grad_lbm_fnc_addInteraction`:

| Parameter                     | Explanation                                                                                             |
|-------------------------------|---------------------------------------------------------------------------------------------------------|
| object                        | Object - The object that the interaction will be attached to.                                           |
| buyables set                  | String - The buyables set that this buymenu will get its items from.                                    |
| cargospace                    | Object - An object with an inventory, that bought items will be placed in, in case player has no space. |
| vehiclespawn                  | Object or Position - Bought vehicles and units will try to spawn here. Can be the same as parameter 0.  |
| shopname (optional)           | String  - Name of this buymenu. Displayed in title bar. Default is empty.                               |
| action description (optional) | String - Display name of this action. Default is "Buy Gear".                                            |
| condition (optional)          | Code - Condition for the action to be displayed.                                                        |


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

### Category Attributes
| Option      | Explanation                                                                      |
|-------------|----------------------------------------------------------------------------------|
| `kindOf`      | Sets type of category. (see below)                                               |
| `displayName` | Sets display name of category (optional). Category classname is used by default. |

### Item Attributes
| Option      | Explanation                                                                                                                             |
|-------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| `displayName` | Sets display name of item. (*not* optional here)                                                                                        |
| `description` | Sets description of item. Supports structured text.                                                                                     |
| `price`       | Sets price of (one set of) this item.                                                                                                   |
| `stock`       | Sets total amount of this item that can be bought.                                                                                      |
| `amount`      | Sets amount of this item that buyer gets per click of buy button (optional). Default is 1. Only available for type `"Items"` and `"Units"`. |
| `code`        | Sets code that is executed when item is bought (optional). (see below)                                                                  |
| `picture`     | Path to custom picture for this item (optional). By default the UI picture, that most objects in Arma have, is used.                      |
| `kindOf`      | Overwrites category type for this item (optional).                                                                                        |
| `muzzleItem`      | Sets muzzle item (i.e. suppressor) that is included with this item (optional). Only available for type `"Weapons"`                         |
| `opticsItem`      | Sets optics item (i.e. red dot) that is included with this item (optional). Only available for type `"Weapons"`                            |
| `pointerItem`     | Sets pointer item (i.e. gunlight) that is included with this item (optional). Only available for type `"Weapons"`                          |
| `underbarrelItem` | Sets underbarrel item (i.e. bipod) that is included with this item (optional). Only available for type `"Weapons"`                         |
| `spawnEmpty`      | Sets if a vehicle will spawn with empty inventory (optional). Default is `false`. Only available for type `"Vehicles"`                    |
| `previewScale`    | Sets scale factor for 3D object preview in case this item displays too small/big (optional). Only available for type `"Vehicles"`         |

### Category Types
Because different types of items require different spawn routines, the type of a category needs to be defined. Available types are:
* `"Weapons"` (for any type of weapon - primary, handgun or launcher)
* `"Items"` (for any inventory item including magazines, grenades, etc.)
* `"Apparel"` (for uniforms, vests, backpacks, helmets)
* `"Vehicles"` (for cars, trucks, helicopters, tanks, etc.)
* `"Units"` (for AI units)
* `"Other"` (for anything else - nothing will spawn, only `code` will be called)

### Code
The script saved in `code` is called when an item is bought. Locality and passed parameters are dependent on category type.

Called on server when type is:
* `"Units"`
* `"Vehicles"`
* `"Other"`

Called on client when type is:
* `"Weapons"`
* `"Items"`
* `"Apparel"`

| Type                           | Passed Parameters                                    |
|--------------------------------|------------------------------------------------------|
| `"Weapons"`, `"Items"`, `"Apparel"`, `"Other"` | [buyer, item class name]                             |
| `"Vehicles"`                       | [buyer, vehicle class name, vehicle, spawn position] |
| `"Units"`                          | [buyer, unit class name, group, spawn position]      |


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
[aHumvee,"AmericanStuff",aHumvee,aHelipad,"American Store", "Buy American Things",{side player == WEST}] call grad_lbm_fnc_addInteraction;

//interaction for Russians:
[aRadioTruck,"RussianStuff",aBoxNearTheTruck,"Russian Store", "Buy Russian Things",{side player == EAST}] call grad_lbm_fnc_addInteraction;
```
