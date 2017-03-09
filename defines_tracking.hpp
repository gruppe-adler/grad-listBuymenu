#define MAIN_IDC                            5001
#define MAIN_CENTERTEXT_IDC                 5002
#define DROPDOWN_BUYABLES_IDC               5003
#define DROPDOWN_CATEGORY_IDC               5004


#define BGCOLOR                             [0.8,0.8,0.8,1]
#define DROPDOWN_BGCOLOR                    [1,1,1,1]
#define SIDEBAR_TEXTCOLOR                   [0,0,0,1]
#define MAIN_BGCOLOR                        [1,1,1,1]
#define TAGTEXTCOLOR_SUCCESS                [0,0.8,0,1]
#define TAGTEXTCOLOR_FAILURE                [0.8,0,0,1]

#define TOPBAR_H                            (0.025 * Y_SCALE)
#define CLOSEBUTTON_H                       (0.023 * Y_SCALE)
#define CLOSEBUTTON_W                       (0.023 * X_SCALE)

#define SIDEBAR_W                           (0.200 * X_SCALE)
#define SIDEBAR_DIVIDER_W                   (0.002 * X_SCALE)

#define DROPDOWN_START_Y                    (2 * TOPBAR_H)
#define DROPDOWN_W                          (0.800 * SIDEBAR_W)
#define DROPDOWN_H                          (0.025 * Y_SCALE)
#define DROPDOWN_DISTANCE                   (0.080 * Y_SCALE)
#define DROPDOWN_TEXTDISTANCE_Y             (0.025 * Y_SCALE)

#define MAIN_W                              ((safezoneW - SIDEBAR_W) * 0.95)
#define MAIN_H                              ((safezoneH - TOPBAR_H) * 0.9)
#define MAIN_X                              (safezoneX + SIDEBAR_W) + ((safezoneX + safezoneW - (safezoneX + SIDEBAR_W)) - MAIN_W)/2
#define MAIN_Y                              safezoneY + ((safezoneY + safezoneH - (safezoneY + TOPBAR_H)) - MAIN_H)/2
#define MAIN_CENTERTEXT_W                   (0.6 * X_SCALE)
#define MAIN_CENTERTEXT_H                   (0.3 * Y_SCALE)
