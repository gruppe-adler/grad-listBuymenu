#define MAIN_IDC                            5001
#define MAIN_CENTERTEXT_IDC                 5002
#define DROPDOWN_BUYABLES_IDC               5003
#define DROPDOWN_CATEGORY_IDC               5004
#define MAIN_BG_IDC                         5005
#define BAR_STARTING_IDC                    5100
#define BAR_TEXT_STARTING_IDC               5400
#define MAIN_LINES_IDC                      5700
#define MAIN_NUMBERS_IDC                    6000


#define BGCOLOR                             [0.8,0.8,0.8,1]
#define DROPDOWN_BGCOLOR                    [1,1,1,1]
#define SIDEBAR_TEXTCOLOR                   [0,0,0,1]
#define TOPBAR_DIVIDER_COLOR                [1,1,1,1]
#define MAIN_BGCOLOR                        [1,1,1,1]
#define TAGTEXTCOLOR_SUCCESS                [0,0.8,0,1]
#define TAGTEXTCOLOR_FAILURE                [0.8,0,0,1]
#define LINECOLOR                           [0,0,0,1]
#define NUMBERCOLOR                         [0,0,0,1]
#define BARCOLORS_RGBA                      [[46,107,46,255],[46,46,107,255],[107,46,86,255],[107,46,46,255],[46,107,86,255],[87,107,46,255],[46,86,107,255],[107,46,46,255],[107,87,46,255],[86,46,107,255],[107,107,46,255],[46,107,107,255],[46,107,66,255],[107,46,107,255],[66,107,46,255],[107,66,46,255],[46,66,107,255],[107,46,66,255],[66,46,107,255]]
//sorted by hue:
//#define BARCOLORS_RGBA                    [[107,46,46,255],[107,66,46,255],[107,87,46,255],[107,107,46,255],[87,107,46,255],[66,107,46,255],[46,107,46,255],[46,107,66,255],[46,107,86,255],[46,107,107,255],[46,86,107,255],[46,66,107,255],[46,46,107,255],[66,46,107,255],[86,46,107,255],[107,46,107,255],[107,46,86,255],[107,46,66,255],[107,46,46,255]]


#define TOPBAR_H                            (0.025 * Y_SCALE)
#define CLOSEBUTTON_H                       (0.020 * Y_SCALE)
#define CLOSEBUTTON_W                       (0.020 * X_SCALE)
#define TOPBAR_DIVIDER_H                    (0.002 * Y_SCALE)

#define SIDEBAR_W                           (0.200 * X_SCALE)
#define SIDEBAR_DIVIDER_W                   (0.002 * X_SCALE)

#define DROPDOWN_START_Y                    (2 * TOPBAR_H)
#define DROPDOWN_W                          (0.800 * SIDEBAR_W)
#define DROPDOWN_H                          (0.025 * Y_SCALE)
#define DROPDOWN_DISTANCE                   (0.080 * Y_SCALE)
#define DROPDOWN_TEXTDISTANCE_Y             (0.025 * Y_SCALE)

#define MAIN_W                              ((safezoneW - SIDEBAR_W) * 0.95)
#define MAIN_H                              ((safezoneH - TOPBAR_H) * 0.85)
#define MAIN_BG_W                           (MAIN_W * 0.97)
#define MAIN_BG_H                           (MAIN_H * 1.05)
#define MAIN_X                              (safezoneX + SIDEBAR_W) + ((safezoneX + safezoneW - (safezoneX + SIDEBAR_W)) - MAIN_W)/2
#define MAIN_Y                              (safezoneY + TOPBAR_H + ((safezoneH - TOPBAR_H) - MAIN_BG_H)/2)
#define MAIN_CENTERTEXT_W                   (0.6 * X_SCALE)
#define MAIN_CENTERTEXT_H                   (0.3 * Y_SCALE)
#define MAIN_BG_X                           (MAIN_X + (MAIN_W - MAIN_BG_W)/2)
#define MAIN_BG_Y                           (MAIN_Y + (MAIN_H - MAIN_BG_H)/2)

#define BAR_X                               ((MAIN_W*0.07)/2)
#define BAR_STARTING_Y                      ((MAIN_H*0.0)/2)
#define BAR_DISTANCE_Y                      (0.010 * Y_SCALE)
#define BAR_H                               (0.040 * Y_SCALE)
#define BAR_MAX_W                           (MAIN_W*0.73)
#define BAR_TEXT_X                          ((BAR_X + BAR_MAX_W) * 1.05)
#define BAR_TEXT_W                          ((MAIN_W - BAR_TEXT_X)*0.9)

#define LINE_W                              (0.002 * X_SCALE)
#define LINE_H                              (0.013 * Y_SCALE)
#define LINE_Y                              (MAIN_BG_Y + MAIN_BG_H - (LINE_H/3))

#define NUMBER_W                            (0.020 * X_SCALE)
#define NUMBER_H                            (0.015 * Y_SCALE)
#define NUMBER_Y                            (LINE_Y + LINE_H * 1.3)
