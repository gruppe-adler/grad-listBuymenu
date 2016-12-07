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

### category attributes
| Option      | Explanation                                                                      |
|-------------|----------------------------------------------------------------------------------|
| `kindOf`      | Sets type of category. (see below)                                               |
| `displayName` | Sets display name of category (optional). Category classname is used by default. |

#### category types
Because different types of items require different spawn routines, the type of a category needs to be defined. Available types are:
* `"Weapons"` (for any type of weapon - primary, handgun or launcher)
* `"Items"` (for any inventory item including magazines, grenades, etc.)
* `"Apparel"` (for uniforms, vests, backpacks, helmets)
* `"Vehicles"` (for cars, trucks, helicopters, tanks, etc.)
* `"Units"` (for AI units)
* `"Other"` (for anything else - nothing will spawn, only `code` will be called)

### item attributes
| Option      | Explanation                                                                                                                             |
|-------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| `displayName` | Sets display name of item. (*not* optional here)                                                                                        |
| `description` | Sets description of item. Supports structured text.                                                                                     |
| `price`       | Sets price of (one set of) this item.                                                                                                   |
| `stock`       | Sets total amount of this item that can be bought.                                                                                      |
| `amount`      | Sets amount of this item that buyer gets per click of buy button (optional). Default is 1. Only available for type `"Items"` and `"Units"`. |
| `code`        | Sets code that is executed when item is bought (optional). (see below)                                                                  |
| `kindOf`      | Overwrites category type for this item (optional).
| `muzzleItem`      | Sets muzzle item (i.e. suppressor) that is included with this item (optional). Only available for type `"Weapons"`                         |
| `opticsItem`      | Sets optics item (i.e. red dot) that is included with this item (optional). Only available for type `"Weapons"`                            |
| `pointerItem`     | Sets pointer item (i.e. gunlight) that is included with this item (optional). Only available for type `"Weapons"`                          |
| `underbarrelItem` | Sets underbarrel item (i.e. bipod) that is included with this item (optional). Only available for type `"Weapons"`                         |

#### code
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
