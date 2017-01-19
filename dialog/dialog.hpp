class grad_lbm {
    idd = grad_lbm_DIALOG;
    movingEnable = true;
    enableSimulation = true;

    class ControlsBackground {
        class MainBackground: grad_lbm_RscBackground {
            x = grad_lbm_BG_X;
            y = grad_lbm_BG_Y;
            w = grad_lbm_BG_W;
            h = grad_lbm_BG_H;
        };

        class TopBar: grad_lbm_RscBackground {
            moving = true;

            x = grad_lbm_BG_X;
            y = grad_lbm_TopBar_Y;
            w = grad_lbm_BG_W;
            h = grad_lbm_Item_H;

            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R', 0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",
                1
            };
        };

        class DialogTitleText: grad_lbm_RscText {
            idc = grad_lbm_TITLE;
            text = "NAME OF VENDOR";
            sizeEx = 0.04 * TEXT_SCALE;

            x = grad_lbm_BG_X;
            y = grad_lbm_TopBar_Y;
            w = grad_lbm_BG_W;
            h = grad_lbm_Item_H;
        };

        class MyFunds: grad_lbm_RscText {
            idc = grad_lbm_MYFUNDS;
            text = "MY FUNDS";
            sizeEx = 0.04 * TEXT_SCALE;
            style = ST_RIGHT;

            x = grad_lbm_BG_X;
            y = grad_lbm_TopBar_Y;
            w = grad_lbm_BG_W;
            h = grad_lbm_Item_H;
        };

        class ItemListBG: grad_lbm_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,0.4};

            x = grad_lbm_Column1_X;
            y = grad_lbm_BG_Y + grad_lbm_Padding_Y + grad_lbm_Item_H + grad_lbm_ItemSpace_Y;
            w = grad_lbm_Column_W;
            h = grad_lbm_Itemlist_H;
        };

        class PreviewPictureBG: grad_lbm_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,0.4};

            x = grad_lbm_Column2_X;
            y = grad_lbm_BG_Y + grad_lbm_Padding_Y;
            w = grad_lbm_Column_W;
            h = grad_lbm_Picture_H;
        };

        class PreviewPicture: grad_lbm_RscPicture {
            idc = grad_lbm_PICTURE;
            colorBackground[] = {0,0,0,0.4};

            x = grad_lbm_Column2_X;
            y = grad_lbm_BG_Y + grad_lbm_Padding_Y;
            w = grad_lbm_Column_W;
            h = grad_lbm_Picture_H;
        };

        class Description: grad_lbm_RscStructuredTextLeft {
            idc = grad_lbm_DESCRIPTION;
            text = "";

            x = grad_lbm_Column2_X;
            y = grad_lbm_BG_Y + grad_lbm_Padding_Y + grad_lbm_Picture_H + grad_lbm_ItemSpace_Y;
            w = grad_lbm_Column_W;
            h = grad_lbm_Description_H;
        };
    };

    class Controls {
        class Category: grad_lbm_RscCombo {
            idc = grad_lbm_CATEGORY;

            x = grad_lbm_Column1_X;
            y = grad_lbm_BG_Y + grad_lbm_Padding_Y;
            w = grad_lbm_Column_W;
            h = grad_lbm_Item_H;

            onLBSelChanged = "_this call grad_lbm_fnc_updateList";
        };

        class ItemList: grad_lbm_RscListNBox {
            idc = grad_lbm_ITEMLIST;

            x = grad_lbm_Column1_X;
            y = grad_lbm_BG_Y + grad_lbm_Padding_Y + grad_lbm_Item_H + grad_lbm_ItemSpace_Y;
            w = grad_lbm_Column_W;
            h = grad_lbm_Itemlist_H;

            onLBSelChanged = "_this call grad_lbm_fnc_updateItemData; _this call grad_lbm_fnc_updatePicture";
        };

        class BuyButton: grad_lbm_RscButton {
            idc = grad_lbm_BUYBUTTON;
            text = "BUY";
            action = "[] call grad_lbm_fnc_buyClient";

            x = grad_lbm_BG_X + grad_lbm_BG_W - grad_lbm_Button_W;
            y = grad_lbm_BG_Y + grad_lbm_BG_H + grad_lbm_ItemSpace_Y;
            w = grad_lbm_Button_W;
            h = grad_lbm_Item_H;
        };
    };

    class Objects {
        class previewModel {
            idc = grad_lbm_3DMODEL;
            type = 82;
            model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
            scale = 0.05;

            direction[] = {-0.40, 0.35, 0.65};
			up[] = {0, 0.65, -0.35};

            x = grad_lbm_Column2_X + 0.5*grad_lbm_Column_W;
            y = grad_lbm_BG_Y + grad_lbm_Padding_Y + 0.5*grad_lbm_Picture_H;
            z = 0.2;

            xBack = grad_lbm_Column2_X + 0.55*grad_lbm_Column_W;
            yBack = grad_lbm_BG_Y + grad_lbm_Padding_Y + 0.5*grad_lbm_Picture_H;
            zBack = 1.2;

            inBack = 1;
            enableZoom = 0;
            zoomDuration = 0.001;
            onLoad = "ctrlShow [_this, false]; _this call grad_lbm_fnc_rotateModel;";
        };
    };
};
