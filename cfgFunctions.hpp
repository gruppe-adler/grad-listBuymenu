#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_lbm {
    class common {
        file = MODULES_DIRECTORY\grad-listBuymenu\functions\common;
        class addInteraction {};
        class checkCargoSpace {};
        class getModuleRoot {};
        class getPermissionLevel {};
        class getPicturePath {};
        class getStock {};
        class isVehicle {};
        class loadBuymenu {};
        class rotateModel {};
        class setPermissionLevel {};
    };

    class buy {
        file = MODULES_DIRECTORY\grad-listBuymenu\functions\buy;
        class buyClient {};
        class buyItem {};
        class buyServer {};
        class buyUnit {};
        class buyVehicle {};
        class buyWeapon {};
        class buyWearable {};
        class reimburse {};
        class vehicleMarker {};
    };

    class init {
        file = MODULES_DIRECTORY\grad-listBuymenu\functions\init;
        class initClient {
            postInit = 1;
        };
        class initStocks {
            postInit = 1;
        };
        class initVehicles {
            postInit = 1;
        };
    };

    class update {
        file = MODULES_DIRECTORY\grad-listBuymenu\functions\update;
        class updateBuyButton {};
        class updateCategories {};
        class updateFunds {};
        class updateItemData {};
        class updateList {};
        class updatePicture {};
    };
};
