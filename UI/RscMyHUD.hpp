class FRLN_rankHud
{
	idd = 6781;
	onLoad = "uiNamespace setVariable ['FRLN_rankHud', _this select 0];";
	duration = 1e+6;
	fadeIn = 1;
	fadeOut = 1;
	class Controls
	{
		class FRLN_Rank_Picture_1200: RscPicture
		{
			idc = 1200;
			text = "";
			x = 6.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 1.5 * GUI_GRID_CENTER_W;
			h = 1.5 * GUI_GRID_CENTER_H;
			shadow = 2;
		};
		class FRLN_Rank_Name_1100: RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 8 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 4 * GUI_GRID_CENTER_W;
			h = 1.5 * GUI_GRID_CENTER_H;
			shadow = 2;
		};
		class FRLN_Player_Name_1101: RscStructuredText
		{
			idc = 1101;
			text = "";
			x = 11.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 5.5 * GUI_GRID_CENTER_W;
			h = 1.5 * GUI_GRID_CENTER_H;
			shadow = 2;
		};

		class FRLN_War_Level_1102: RscStructuredText
		{
			idc = 1102;
			text = "<t align='right'>War Level:</t>";
			x = 16 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 6 * GUI_GRID_CENTER_W;
			h = 1.5 * GUI_GRID_CENTER_H;
			shadow = 2;
		};
		class FRLN_War_Level_Number_1103: RscStructuredText
		{
			idc = 1103;
			text = "";
			x = 22 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3 * GUI_GRID_CENTER_W;
			h = 1.5 * GUI_GRID_CENTER_H;
			shadow = 2;
		};

		class FRLN_Scrip_1104: RscStructuredText
		{
			idc = 1104;
			text = "<t align='right'>Warpoints:</t>";
			x = 26 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.75 * GUI_GRID_CENTER_W;
			h = 1.5 * GUI_GRID_CENTER_H;
			shadow = 2;
		};
		class FRLN_Scrip_Number_1105: RscStructuredText
		{
			idc = 1105;
			text = "";
			x = 29.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
			y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
			w = 3.5 * GUI_GRID_CENTER_W;
			h = 1.5 * GUI_GRID_CENTER_H;
			shadow = 2;
		};
	};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Rekter, v1.063, #Xasako)
////////////////////////////////////////////////////////
/*
class FRLN_Rank_Picture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 1.5 * GUI_GRID_CENTER_W;
	h = 1.5 * GUI_GRID_CENTER_H;
};
class FRLN_Rank_Name_1100: RscStructuredText
{
	idc = 1100;
	text = "";
	x = 6.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 3 * GUI_GRID_CENTER_W;
	h = 1.5 * GUI_GRID_CENTER_H;
};
class FRLN_Player_Name_1101: RscStructuredText
{
	idc = 1101;
	text = "";
	x = 9.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 5.5 * GUI_GRID_CENTER_W;
	h = 1.5 * GUI_GRID_CENTER_H;
};
class FRLN_War_Level_1102: RscStructuredText
{
	idc = 1102;
	text = "War Level:";
	x = 16 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 6 * GUI_GRID_CENTER_W;
	h = 1.5 * GUI_GRID_CENTER_H;
};
class FRLN_War_Level_Number_1103: RscStructuredText
{
	idc = 1103;
	text = "";
	x = 22 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 3 * GUI_GRID_CENTER_W;
	h = 1.5 * GUI_GRID_CENTER_H;
};
class FRLN_Scrip_1104: RscStructuredText
{
	idc = 1104;
	text = "Scrip:";
	x = 26 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 3.5 * GUI_GRID_CENTER_W;
	h = 1.5 * GUI_GRID_CENTER_H;
};
class FRLN_Scrip_Number_1105: RscStructuredText
{
	idc = 1105;
	text = "";
	x = 29.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
	y = -10 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
	w = 3.5 * GUI_GRID_CENTER_W;
	h = 1.5 * GUI_GRID_CENTER_H;
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
