class po3_screentext {
	idd = -1;
	movingEnable = 0;
	duration = 1e+011;
	fadein = 0;
	fadeout = 0;
	name = "po3_screentext";
	onload = "uinamespace setvariable ['po3_screentext',_this select 0];";
	onUnload = "uinamespace setvariable ['po3_screentext',nil];";

	class controls {
		class PO3_Title_Banner : 86RStructuredText {
			idc = MPSFCNTRL_08;
			text = "";
			size = "( ( ( ( (safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = "safeZoneXAbs";
			y = "0.445 * safezoneH + safezoneY";
			w = "safezoneWAbs";
			h = "0.099 * safezoneH";
			class Attributes {
				align = "Center";
				font = GUI_FONT_MONO;
				shadow = 0;
			};
		};
	};
};