class grad_lbm_RscBackground {
	idc = -1;
	type = CT_STATIC;
	style = ST_HUD_BACKGROUND;
	text = "";
	colorText[] = {0, 0, 0, 0};
	font = "RobotoCondensed";
	sizeEx = 0.04 * TEXT_SCALE;
	shadow = 0;
	colorBackground[] = {0, 0, 0, 0.6};
};

class grad_lbm_RscText {

	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	colorBackground[] = { 1 , 1 , 1 , 0 };
	colorText[] = { 1 , 1 , 1 , 1 };
	font = "RobotoCondensed";
	sizeEx = 0.025;
	h = 0.25;
	text = "";
};

class grad_lbm_RscStructuredTextLeft {
	idc = -1;
	access = 0;
	type = CT_STRUCTURED_TEXT;
	style = 0;
	colorText[] = { 1 , 1 , 1 , 1 };
	colorBackground[] = {0,0,0,0.4};
	class Attributes {
		font = "RobotoCondensed";
		//color = "#e0d8a6";
		align = "left";
		shadow = 0;
	};
	text = "";
	size = 0.03921;
	shadow = 2;
};

class grad_lbm_RscPicture {
	shadow = 0;
	type = CT_STATIC;
	style = 48 + 2048;
	sizeEx = 0.023;
	font = "RobotoCondensed";
	text = "";
	colorBackground[] = {};
	colorText[] = {};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class grad_lbm_RscButton {
	access = 0;
	type = CT_BUTTON;
	style = ST_RIGHT;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.1};
	colorBackground[] = {0,0,0,0.8};
	colorFocused[] = {1,1,1,0.5};
	colorBackgroundActive[] = {1,1,1,0.8}; // hover
	colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
	colorBackgroundFocused[] = {0,0,0,0.5};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	shadow = 0;
	font = "RobotoCondensed";
	sizeEx = 0.04;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};


class grad_lbm_RscScrollbar {
	color[] = {1, 1, 1, 1};
	colorActive[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.69])", "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.75])", "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.5])", 1};
	colorDisabled[] = {};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
};

class grad_lbm_RscCombo {
	idc = -1;
	type = CT_COMBO;
	style = ST_CENTER;
	sizeEx = 0.042;
	font = "RobotoCondensed";
	rowHeight = 0.04;
	wholeHeight = 0.48;
	maxHistoryDelay = 0;
	autoScrollDelay = 5;
	autoScrollSpeed = -1;
	autoScrollRewind = 0;
	color[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	colorSelect[] = {0, 0, 0, 1};
	colorDisabled[] = {};
	colorBackground[] = {0, 0, 0, 1};
	colorSelectBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.69])", "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.75])", "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.5])", 1};
	colorSelectBackground2[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.69])", "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.75])", "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.5])", 1};
	colorScrollbar[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.69])", "(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.75])", "(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.5])", 1};
	soundSelect[] = {"\dss_sfx\Dialogs\SubSel.ogg", 0, 1};
	soundExpand[] = {"\dss_sfx\Dialogs\Hover.ogg", 0, 1};
	soundCollapse[] = {"\dss_sfx\Dialogs\Hover.ogg", 0, 1};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	class ComboScrollbar : grad_lbm_RscScrollbar {
		color[] = {1, 1, 1, 1};
		colorActive[] = {0, 0, 0, 1};
		colorDisabled[] = {};
		autoScrollEnabled = 1;
		arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
		arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class grad_lbm_RscListBox
{
	idc = -1;
	type = CT_LISTBOX;
	style = ST_MULTI;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorScrollbar[] = {1, 0, 0, 0};
	colorSelect[] = {0, 0, 0, 1};
	colorSelect2[] = {0, 0, 0, 1};
	colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground2[] = {1, 1, 1, 0.5};
	colorBackground[] = {0, 0, 0, 0.4};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect", 0.09, 1};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	colorPicture[] = {1, 1, 1, 1};
	colorPictureSelected[] = {1, 1, 1, 1};
	colorPictudeDisabled[] = {1, 1, 1, 0.25};
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
	font = "RobotoCondensed";
	sizeEx = 0.035;
	shadow = 0;
	colorShadow[] = {0, 0, 0, 0.5};
	period = 0.8;
	maxHistoryDelay = 1;
	colorPictureDisabled[] = {1, 1, 1, 1};

	class ListScrollBar
	{
		color[] = {1, 1, 1, 1};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class grad_lbm_RscListNBox
{
	access = 0;
	idc = -1;
	type = CT_LISTNBOX;
	style = ST_LEFT + LB_TEXTURES;
	default = 0;
	blinkingPeriod = 0;

	colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground2[] = {1, 1, 1, 0.5};

	sizeEx = 0.035 * TEXT_SCALE;
	font = "RobotoCondensed";
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorSelect[] = {0, 0, 0, 1};
	colorSelect2[] = {0, 0, 0, 1};
	colorShadow[] = {0,0,0,0.5};

	tooltip = "";
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};

	columns[] = {0.021,0.25};

	drawSideArrows = 0;
	idcLeft = 1000;
	idcRight = 1001;

	period = 0.8;

	rowHeight = 0;
	maxHistoryDelay = 1;

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};

	class ListScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.01;

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";

		color[] = {1,1,1,1};
	};
};
