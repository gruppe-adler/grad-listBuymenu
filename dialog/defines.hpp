//CONTROLS BACKGROUND ==========================================================
#define grad_lbm_DIALOG         2000
#define grad_lbm_TITLE          2001
#define grad_lbm_MYFUNDS        2002
#define grad_lbm_PICTURE        2003
#define grad_lbm_DESCRIPTION    2004
#define grad_lbm_3DMODEL        2005

//CONTROLS =====================================================================
#define grad_lbm_CATEGORY       3001
#define grad_lbm_ITEMLIST       3002
#define grad_lbm_BUYBUTTON      3003

//DIMENSIONS AND POSITIONS =====================================================
#define grad_lbm_textSize       (0.04 * TEXT_SCALE)

#define grad_lbm_Item_H         (0.025 * Y_SCALE)
#define grad_lbm_Item_W         (0.025 * X_SCALE)
#define grad_lbm_ItemSpace_Y    (0.0025 * SZ_SCALE)

#define grad_lbm_Padding_Y      (0.5 * grad_lbm_Item_H)
#define grad_lbm_Padding_X      (0.5 * grad_lbm_Item_W)

#define grad_lbm_Column_W       (0.35 * X_SCALE)
#define grad_lbm_Column_H       (0.4 * Y_SCALE)

#define grad_lbm_Column1_X      (grad_lbm_BG_X + grad_lbm_Padding_X)
#define grad_lbm_Column2_X      (grad_lbm_Column1_X + grad_lbm_Column_W + grad_lbm_Padding_X)

#define grad_lbm_Itemlist_H     (grad_lbm_Column_H - grad_lbm_Item_H - grad_lbm_ItemSpace_Y)
#define grad_lbm_Picture_H      (0.4* (grad_lbm_Column_H-grad_lbm_ItemSpace_Y))
#define grad_lbm_Description_H  (0.6* (grad_lbm_Column_H-grad_lbm_ItemSpace_Y))

#define grad_lbm_BG_W           (3*grad_lbm_Padding_X + 2*grad_lbm_Column_W)
#define grad_lbm_BG_H           (2*grad_lbm_Padding_Y + grad_lbm_Column_H)
#define grad_lbm_BG_X           CENTER(1, grad_lbm_BG_W)
#define grad_lbm_BG_Y           CENTER(1, grad_lbm_BG_H)

#define grad_lbm_Button_W       (0.2 * X_SCALE)

#define grad_lbm_CloseButton_W  (grad_lbm_Item_H - (2 * grad_lbm_ItemSpace_Y))
#define grad_lbm_TopBar_Y       (grad_lbm_BG_Y - grad_lbm_Item_H * 1.1)
