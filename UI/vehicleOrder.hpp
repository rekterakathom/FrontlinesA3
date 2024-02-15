class FRLN_orderVehicleGUI
{
	idd = 71684;
	onLoad = "";
	duration = 1e+6;
	fadeIn = 1;
	fadeOut = 1;
	class Controls
	{
		class FRLN_vehicle_order_combo: RscCombo
		{
			onLBSelChanged = "_this call FRLN_fnc_vehicleOrderMenuSelected";
			idc = 71685;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 14.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class FRLN_vehicle_order_frame: RscFrame
		{
			shadow = 2;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			idc = 71686;
			x = 12.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 14.5 * GUI_GRID_W;
			h = 14 * GUI_GRID_H;
		};
		class FRLN_vehicle_order_button: RscButton
		{
			onButtonClick = "_this call FRLN_fnc_vehicleOrderButtonClicked";
			text = "Request";
			shadow = 1;
			idc = 71687;
			x = 18 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class FRLN_vehicle_order_description: RscStructuredText
		{
			shadow = 1;
			idc = 71688;
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class FRLN_vehicle_order_picture: RscPicture
		{
			shadow = 1;
			idc = 71689;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 8 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 5 * GUI_GRID_H;
		};
	};
};
