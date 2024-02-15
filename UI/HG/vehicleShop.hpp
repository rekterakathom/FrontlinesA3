/*
    Author - HoverGuy
    Website - https://northernimpulse.com
*/

class HG_VehiclesShop
{
    idd = 95347;
	duration = 1e+6;
	fadeIn = 1;
	fadeOut = 1;
	enableSimulation = true;
	name = "HG_VehiclesShop";
	onUnload = "";
	
	class ControlsBackground
	{
		class ListHeader: RscText
		{
			style = "0x02";
			text = "$STR_HG_DLG_VS_TITLE_LIST";
			colorBackground[] = {0.4,0.4,0.4,1};
			x = 0.005 * safeZoneW + safeZoneX;
			y = 0.258 * safeZoneH + safeZoneY;
			w = 0.195937 * safeZoneW;
			h = 0.033 * safeZoneH;
		};
		
		class ListBackground: RscText
		{
			colorBackground[] = {0,0,0,0.5};
			x = 0.005 * safeZoneW + safeZoneX;
			y = 0.291 * safeZoneH + safeZoneY;
			w = 0.195937 * safeZoneW;
			h = 0.462 * safeZoneH;
		};
		
		class ListBackgroundFrame: RscFrame
		{
			x = 0.005 * safeZoneW + safeZoneX;
			y = 0.258 * safeZoneH + safeZoneY;
			w = 0.195937 * safeZoneW;
			h = 0.495 * safeZoneH;
		};
		
		class ListWhiteLine: RscPicture
		{
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.005 * safeZoneW + safeZoneX;
			y = 0.291 * safeZoneH + safeZoneY;
			w = 0.195937 * safeZoneW;
			h = 0.0022 * safeZoneH;
		};
		
		class TextHeader: RscText
		{
			style = "0x02";
			text = "$STR_HG_DLG_VS_TITLE_TEXT";
			colorBackground[] = {0.4,0.4,0.4,1};
			x = 0.799062 * safeZoneW + safeZoneX;
			y = 0.258 * safeZoneH + safeZoneY;
			w = 0.195937 * safeZoneW;
			h = 0.033 * safeZoneH;
		};
		
		class TextBackground: RscText
		{
			colorBackground[] = {0,0,0,0.5};
			x = 0.799062 * safeZoneW + safeZoneX;
			y = 0.291 * safeZoneH + safeZoneY;
			w = 0.195937 * safeZoneW;
			h = 0.462 * safeZoneH;
		};
		
		class TextBackgroundFrame: RscFrame
		{
			x = 0.799062 * safeZoneW + safeZoneX;
			y = 0.258 * safeZoneH + safeZoneY;
			w = 0.195937 * safeZoneW;
			h = 0.495 * safeZoneH;
		};
		
		class TextWhiteLine: RscPicture
		{
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.799062 * safeZoneW + safeZoneX;
			y = 0.291 * safeZoneH + safeZoneY;
			w = 0.195937 * safeZoneW;
			h = 0.0022 * safeZoneH;
		};
		
		class ActionBarBackground: RscText
		{
			colorBackground[] = {0.4,0.4,0.4,1};
			x = 0.29375 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.407344 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
		
		class ShopPicture: RscPicture
		{
			text = "HG\UI\Icons\car.paa";
			tooltip = "$STR_HG_DLG_TOOLTIP";
			x = 0.29375 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.0309375 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
		
		class ToGarageBtnPicture: RscPicture
		{
			text = "HG\UI\Icons\garage.paa";
			x = 0.561875 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.0309375 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
		
		class BuyBtnPicture: RscPicture
		{
			text = "HG\UI\Icons\buy.paa";
			x = 0.597969 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.0309375 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
		
		class MyCashBtnPicture: RscPicture
		{
			text = "HG\UI\Icons\mycash.paa";
			x = 0.634062 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.0309375 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
		
		class ExitBtnPicture: RscPicture
		{
			text = "HG\UI\Icons\close.paa";
			x = 0.670156 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.0309375 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
		
		class VehicleText: RscStructuredText
		{
			idc = HG_VEHICLES_TEXT_IDC;
			colorBackground[] = {0,0,0,0.5};
			x = 0.804219 * safeZoneW + safeZoneX;
			y = 0.302 * safeZoneH + safeZoneY;
			w = 0.185625 * safeZoneW;
			h = 0.374 * safeZoneH;
		};
	};
	
	class Controls
	{
		class VehicleSwitch: RscXListBox
		{
			idc = HG_VEHICLES_SWITCH_IDC;
			onLBSelChanged = "_this call HG_fnc_xVehicleSelectionChanged";
			x = 0.0101562 * safeZoneW + safeZoneX;
			y = 0.302 * safeZoneH + safeZoneY;
			w = 0.185625 * safeZoneW;
			h = 0.022 * safeZoneH;
		};
		
		class VehicleList: RscListBox
		{
			idc = HG_VEHICLES_LIST_IDC;
			style = "0x02 + 16";
			rowHeight = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onLBSelChanged = "_this call HG_fnc_vehicleSelectionChanged";
			x = 0.0101562 * safeZoneW + safeZoneX;
			y = 0.335 * safeZoneH + safeZoneY;
			w = 0.185625 * safeZoneW;
			h = 0.407 * safeZoneH;
		};
		
		class ColorsList: RscCombo
		{
			idc = HG_VEHICLES_COLORS_IDC;
			onLBSelChanged = "_this call HG_fnc_vehicleColor";
		  	x = 0.804219 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.022 * safezoneH;
		};
		
		class SpawnPointsList: RscCombo
		{
			idc = HG_VEHICLES_SP_IDC;
			x = 0.804219 * safeZoneW + safeZoneX;
			y = 0.72 * safeZoneH + safeZoneY;
			w = 0.185625 * safeZoneW;
			h = 0.022 * safeZoneH;
		};
		
		class ToGarageButton: RscButton
		{
			idc = HG_VEHICLES_TG_IDC;
			tooltip = "$STR_HG_DLG_VS_TG_TOOLTIP";
			onButtonClick = "[] call HG_fnc_buyToGarage";
			x = 0.561875 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.0309375 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
		
		class BuyButton: RscButton
		{
			idc = HG_VEHICLES_BUY_IDC;
			tooltip = "$STR_HG_DLG_VS_BUY_TOOLTIP";
			onButtonClick = "[] call HG_fnc_buyVehicle";
			x = 0.597969 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.0309375 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
		
		class MyCashButton: RscButton
		{
			idc = HG_VEHICLES_MC_IDC;
			onButtonClick = "titleText [format[(localize 'STR_HG_DLG_MC'),([(player getVariable 'HG_Cash'),true] call HG_fnc_currencyToText)],'PLAIN DOWN',0.5]";
			tooltip = "$STR_HG_DLG_MC_TOOLTIP";
			x = 0.634062 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.0309375 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
		
		class ExitButton: RscButton
		{
			tooltip = "$STR_HG_DLG_CLOSE_TOOLTIP";
			onButtonClick = "closeDialog 0";
			x = 0.670156 * safeZoneW + safeZoneX;
			y = 0.00500001 * safeZoneH + safeZoneY;
			w = 0.0309375 * safeZoneW;
			h = 0.044 * safeZoneH;
		};
	};
};