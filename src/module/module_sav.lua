--<<sav v0.3 doc>>--
-- 2010-05-06 by 白枫
--[存档系统]--

value = {};	-- 系统用变量
event = {};	-- 事件用标记

pub_event = {};
pub_value = {};

TABLE_VALUE_MAX = 256;
TABLE_EVENT_MAX = 1024;
TABLE_SYS_MAX = 128;

SYSTEM_GAME_NAME = "AMP DEMO";

--=========================================================

function GAMENAME(nm)
	SYSTEM_GAME_NAME = nm;
end

function CHAPTER(cp)
	Print("章节设置已然无效\n");
end

function GetPubValueFilePath()
	local path;
	if AMWIN then
		path = SYSTEM_GAME_NAME .. ".sys";
	elseif AMPSP then
		path = "ms0:/psp/" .. SYSTEM_GAME_NAME .. ".sys";
	end
	return path;
end

function sysValueInit()
	local i;
	for i=1,TABLE_VALUE_MAX do
		value[i] = 0;
		pub_value[i] = 0;
	end
	for i=1,TABLE_EVENT_MAX do
		event[i] = 0;
		pub_event[i] = 0;
	end
	i = nil;

	uservalueinit();
end

--=========================================================

function sys_value_to_lua_value()
	local i;
	for i=1,TABLE_VALUE_MAX do
		value[i] = getvalue(i);
	end
	i = nil;
end

function lua_value_to_sys_value()
	local i;
	for i=1,TABLE_VALUE_MAX do
		setvalue(i,value[i]);
	end
	i = nil;
end

function sys_event_to_lua_event()
	local i;
	for i=1,TABLE_EVENT_MAX do
		event[i] = getevent(i);
	end
	i = nil;
end

function lua_event_to_sys_event()
	local i;
	for i=1,TABLE_EVENT_MAX do
		setevent(i,event[i]);
	end
	i = nil;
end

--==========================================

function sys_pubvalue_to_lua_pubvalue()
	local i;
	for i=1,TABLE_VALUE_MAX do
		pub_value[i] = getpubvalue(i);
	end
	i = nil;
end

function lua_pubvalue_to_sys_pubvalue()
	local i;
	for i=1,TABLE_VALUE_MAX do
		setpubvalue(i,pub_value[i]);
	end
	i = nil;
end

function sys_pubevent_to_lua_pubevent()
	local i;
	for i=1,TABLE_EVENT_MAX do
		pub_event[i] = getpubevent(i);
	end
	i = nil;
end

function lua_pubevent_to_sys_pubevent()
	local i;
	for i=1,TABLE_EVENT_MAX do
		setpubevent(i,pub_event[i]);
	end
	i = nil;
end



--=========================================================
--=========================================================

function sys_ini_to_lua_ini()
	-- 二次数据读取
	FG_DX_A = getsysvalue(1);
	FG_DY_A = getsysvalue(2);
	FG_DY_A = getsysvalue(3);
	FG_DY_A = getsysvalue(4);
	FG_DY_A = getsysvalue(5);
	FG_DY_A = getsysvalue(6);
	FG_DY_A = getsysvalue(7);
	FG_DY_A = getsysvalue(8);
	FG_DY_A = getsysvalue(9);
	FG_DY_A = getsysvalue(10);
	FG_DY_A = getsysvalue(11);
	FG_DY_A = getsysvalue(12);

	TFG_DX_A = getsysvalue(13);
	TFG_DY_A = getsysvalue(14);
	TFG_DX_B = getsysvalue(15);
	TFG_DY_B = getsysvalue(16);
	TFG_DX_C = getsysvalue(17);
	TFG_DY_C = getsysvalue(18);
	TFG_DX_D = getsysvalue(19);
	TFG_DY_D = getsysvalue(20);
	TFG_DX_E = getsysvalue(21);
	TFG_DY_E = getsysvalue(22);
	TFG_DX_F = getsysvalue(23);
	TFG_DY_F = getsysvalue(24);

	MSG_BOX_NUM = getsysvalue(25);
	MSG_BOX_DX = getsysvalue(26);
	MSG_BOX_DY = getsysvalue(27);

	NAME_NUM = getsysvalue(28);
	NAME_DX = getsysvalue(29);
	NAME_DX = getsysvalue(30);

	-- dialog部分
	_dialog.icondx = getsysvalue(31);
	_dialog.icondy = getsysvalue(32);
	DIALOG_ICON_SPEED = getsysvalue(33);

	-- 标题部分
	TITLE_DX = getsysvalue(34);
	TITLE_DY = getsysvalue(35);
	TITLE_ICON_DX = getsysvalue(36);
	TITLE_ICON_DY = getsysvalue(37);
	_title.icon_stepx = getsysvalue(38);
	_title.icon_stepy = getsysvalue(39);
	_title.item = getsysvalue(40);

	-- 分支部分
	SELECT_BUTTON_DX = getsysvalue(41);
	SELECT_BUTTON_DY = getsysvalue(42);
	SELECT_ICON_DX = getsysvalue(43);
	SELECT_ICON_DY = getsysvalue(44);
	_select.stepx = getsysvalue(45);
	_select.stepy = getsysvalue(46);
	_select.bgmode = getsysvalue(47);
	SELECT_BG_DX = getsysvalue(48);
	SELECT_BG_DY = getsysvalue(49);

	-- 菜单部分
	MENU_BG_DX = getsysvalue(50);
	MENU_BG_DY = getsysvalue(51);
	MENU_ICON_DX = getsysvalue(52);
	MENU_ICON_DY = getsysvalue(53);
	MENU_STEP_DX = getsysvalue(54);
	MENU_STEP_DY = getsysvalue(55);
	MENU_ITEM_SIZE = getsysvalue(56);

	-- 调查部分
	FIND_ICON_DX = getsysvalue(57);
	FIND_ICON_DY = getsysvalue(58);

	-- 存档部分
	--_sav.gamemode = getsysvalue(59);

	-- 系统状态
	--SYSTEM_MODE = getsysvalue(60);

	uservalueload();	-- 用户数据读取
end

function lua_ini_to_sys_ini()
	-- 二次数据设置
	setsysvalue(1,FG_DX_A);
	setsysvalue(2,FG_DY_A);
	setsysvalue(3,FG_DX_B);
	setsysvalue(4,FG_DY_B);
	setsysvalue(5,FG_DX_C);
	setsysvalue(6,FG_DY_C);
	setsysvalue(7,FG_DX_D);
	setsysvalue(8,FG_DY_D);
	setsysvalue(9,FG_DX_E);
	setsysvalue(10,FG_DY_E);
	setsysvalue(11,FG_DX_F);
	setsysvalue(12,FG_DY_F);

	setsysvalue(13,TFG_DX_A);
	setsysvalue(14,TFG_DY_A);
	setsysvalue(15,TFG_DX_B);
	setsysvalue(16,TFG_DY_B);
	setsysvalue(17,TFG_DX_C);
	setsysvalue(18,TFG_DY_C);
	setsysvalue(19,TFG_DX_D);
	setsysvalue(20,TFG_DY_D);
	setsysvalue(21,TFG_DX_E);
	setsysvalue(22,TFG_DY_E);
	setsysvalue(23,TFG_DX_F);
	setsysvalue(24,TFG_DY_F);

	setsysvalue(25,MSG_BOX_NUM);
	setsysvalue(26,MSG_BOX_DX);
	setsysvalue(27,MSG_BOX_DY);

	setsysvalue(28,NAME_NUM);
	setsysvalue(29,NAME_DX);
	setsysvalue(30,NAME_DX);

	-- dialog部分
	setsysvalue(31,_dialog.icondx);
	setsysvalue(32,_dialog.icondy);
	setsysvalue(33,DIALOG_ICON_SPEED);

	-- 标题部分
	setsysvalue(34,TITLE_DX);
	setsysvalue(35,TITLE_DY);
	setsysvalue(36,TITLE_ICON_DX);
	setsysvalue(37,TITLE_ICON_DY);
	setsysvalue(38,_title.icon_stepx);
	setsysvalue(39,_title.icon_stepy);
	setsysvalue(40,_title.item);

	-- 分支部分
	setsysvalue(41,SELECT_BUTTON_DX);
	setsysvalue(42,SELECT_BUTTON_DY);
	setsysvalue(43,SELECT_ICON_DX);
	setsysvalue(44,SELECT_ICON_DY);
	setsysvalue(45,_select.stepx);
	setsysvalue(46,_select.stepy);
	setsysvalue(47,_select.bgmode);
	setsysvalue(48,SELECT_BG_DX);
	setsysvalue(49,SELECT_BG_DY);

	-- 菜单部分
	setsysvalue(50,MENU_BG_DX);
	setsysvalue(51,MENU_BG_DY);
	setsysvalue(52,MENU_ICON_DX);
	setsysvalue(53,MENU_ICON_DY);
	setsysvalue(54,MENU_STEP_DX);
	setsysvalue(55,MENU_STEP_DY);
	setsysvalue(56,MENU_ITEM_SIZE);

	-- 调查部分
	setsysvalue(57,FIND_ICON_DX);
	setsysvalue(58,FIND_ICON_DY);

	-- 存档部分
	--setsysvalue(59,_sav.gamemode);

	-- 系统状态
	--setsysvalue(60,SYSTEM_MODE);

	uservaluesave();	-- 用户数据保存
end

function sys_pubini_to_lua_pubini()
	-- 公用二次数据设置
end

function lua_pubini_to_sys_pubini()
	-- 公用二次数据读取
end

function usersetvalue(index,v)
	if index < 1 or index > 64 then
		Print(index,"超出了给定的范围,自定义变量设置失败.\n");
		return;
	end
	setsysvalue(index+getsysvaluesize()-64,v);
end

function usergetvalue(index)
	if index < 1 or index > 64 then
		Print(index,"超出了给定的范围,自定义变量读取失败.\n");
		return nil;
	end
	return getsysvalue(index+getsysvaluesize()-64);
end

--=========================================================
--=========================================================



function amp_save(number)
	local path;
	if AMWIN then
		path = SYSTEM_GAME_NAME .. number .. ".bin";
	elseif AMPSP then
		path = "ms0:/psp/" .. SYSTEM_GAME_NAME .. number .. ".bin";
	end
	lua_value_to_sys_value();
	lua_event_to_sys_event();
	lua_ini_to_sys_ini();	-- 二次设置数据
	amEsave(path);
	--for path=1,getsysvaluesize() do
	--	Print(getsysvalue(path),"-");
	--end
	--Print("\n\n");
	path = nil;
end

function amp_load(number)
	local path;
	if AMWIN then
		path = SYSTEM_GAME_NAME .. number .. ".bin";
	elseif AMPSP then
		path = "ms0:/psp/" .. SYSTEM_GAME_NAME .. number .. ".bin";
	end
	if isfiletrue(path)==0 then
		Print("<",path,">\n","该存档文件不存在!\n\n");
		return 0;
	end
	amEload(path);
	sys_value_to_lua_value();
	sys_event_to_lua_event();
	sys_ini_to_lua_ini();	-- 还原二次数据
	--for path=1,getsysvaluesize() do
	--	Print(getsysvalue(path),"-");
	--end
	--Print("\n\n");
	path = nil;
end

function amp_pubsave()
	lua_pubvalue_to_sys_pubvalue();
	lua_pubevent_to_sys_pubevent();
	lua_pubini_to_sys_pubini();
	setGameName(SYSTEM_GAME_NAME);
	amIsave(GetPubValueFilePath());
end

function amp_pubload()
	if isfiletrue(GetPubValueFilePath())==0 then
		Print("系统公用数据文件不存在!\n");
		return 0;
	end
	amIload(GetPubValueFilePath());
	sys_pubvalue_to_lua_pubvalue();
	sys_pubevent_to_lua_pubevent();
	sys_pubini_to_lua_pubini();
end


--=========================================================

_sav = {};
_sav.saveimage = "amsav_ui.jpg";
_sav.loadimage = "amsav_ui.jpg";
_sav.bg = 0;	-- 图像引用
_sav.aplha = 0;
_sav.count = 0;
_sav.mouse = "select_icon.png";
_sav.icon = 0;
_sav.mdx = 0;
_sav.mdy = 0;
_sav.chose = 0;
_sav.gamemode = 0;
_sav.mode = 0;

_sav.sound = "sound_bi.wav";	-- 音效

_sav.item = {};	-- 选项
_sav.item.size = 5;	-- 5个选项

SAV_MOUSE_DX = 0;
SAV_MOUSE_DY = 0;

SAV_ITEM_DX = 0;
SAV_ITEM_DY = 0;
SAV_ITEM_STEPX = 0;
SAV_ITEM_STEPY = 25;

sav_load_data = 1;
sav_save_data = 2;

function savinit(flag)
	_sav.mdx = SAV_MOUSE_DX;
	_sav.mdy = SAV_MOUSE_DY;
	_sav.chose = 1;
	_sav.alpha = 0;
	_sav.count = 0;
	_sav.mode = 1;
	_sav.gamemode = SYSTEM_MODE;
	if flag==sav_load_data then
		_sav.bg = LoadImage(_sav.loadimage,8888);
	elseif flag==sav_save_data then
		_sav.bg = LoadImage(_sav.saveimage,8888);
	end
	_sav.icon = LoadImage(_sav.mouse,4444);
end

function savfini()
	if _sav.bg > 0 then
		FreeImage(_sav.bg);
		_sav.bg = 0;
	end
	if _sav.icon > 0 then
		FreeImage(_sav.icon);
		_sav.icon = 0;
	end
	buttonnull(2);
end

function savsetloadimage(file)
	_sav.loadimage = file;
end

function savsetsaveimage(file)
	_sav.saveimage = file;
end

function savseticon(file)
	_sav.mouse = file;
end

function savseticonxy(dx,dy)
	SAV_MOUSE_DX = dx;
	SAV_MOUSE_DY = dy;
end

function savsetitemxy(dx,dy)
	SAV_ITEM_DX = dx;
	SAV_ITEM_DY = dy;
end

function savsetitemstep(stepx,stepy)
	SAV_ITEM_STEPX = stepx;
	SAV_ITEM_STEPY = stepy;
end

function savsetsound(file)
	_sav.sound = file;
end

function savplaysound()
	playfile(_sav.sound,4);
end

function savstopsound()
	stopfile(_sav.sound,4);
end

function savbgfadein()
	_sav.count = _sav.count + 1;
	if _sav.count >= 2 then
		_sav.alpha = _sav.alpha + 50;
		_sav.count = 0;
		if _sav.alpha >= 255 then
			_sav.alpha = 255;
			_sav.mode = 2;
		end
	end
	if _sav.bg > 0 then
		DrawImage(_sav.bg,0,0,_sav.alpha);
	end
end

function savbgfadeout()
	_sav.count = _sav.count + 1;
	if _sav.count >= 2 then
		_sav.alpha = _sav.alpha - 50;
		_sav.count = 0;
		if _sav.alpha <= 0 then
			_sav.alpha = 0;
		end
	end
	if _sav.bg > 0 then
		DrawImage(_sav.bg,0,0,_sav.alpha);
	end
end

function saviteminit()
	local item = {};
	local i;

	for i=1, _sav.item.size do
		local path;
		if AMWIN then
			path = SYSTEM_GAME_NAME .. i .. ".bin";
		elseif AMPSP then
			path = "ms0:/psp/" .. SYSTEM_GAME_NAME .. i .. ".bin";
		end

		local year,month,day,hour,minute,second = amDget(path);

		if year < 0 then
			item[i] = "???? / ???? / ?? / ?? / ?? / ?? / ??";
		else
			item[i] = SYSTEM_GAME_NAME .. "/" .. year .. "年/" .. month .. "月/" .. day .. "日/" .. hour .. "点/" .. minute .. "分/" .. second .. "秒";
		end

		year = nil;
		month = nil;
		day = nil;
		hour = nil;
		minute = nil;
		second = nil;
		path = nil;
	end

	button(2,item[1],item[2],item[3],item[4],item[5]);

	item = nil;

	for i=1, _sav.item.size do
		_sav.item[i] = button_get_imagetext(2,i);
	end

	i = nil;
end

function userload()
	if _sav.mode==1 then
		savbgfadein();
	elseif _sav.mode==2 then
		-- 初始化项目
		saviteminit();
		savrender();
		_sav.mode = 3;
	elseif _sav.mode==3 then
		-- 选择
		savLupdate();
		savrender();
	elseif _sav.mode==4 then
		-- 淡出
		savbgfadeout();
		if _sav.alpha <= 0 then
			savfini();
			sysMode(_sav.gamemode);
		end
	end
end

function usersave()
	if _sav.mode==1 then
		savbgfadein();
	elseif _sav.mode==2 then
		-- 初始化项目
		saviteminit();
		savrender();
		_sav.mode = 3;
	elseif _sav.mode==3 then
		-- 选择
		savSupdate();
		savrender();
	elseif _sav.mode==4 then
		-- 淡出
		savbgfadeout();
		if _sav.alpha <= 0 then
			savfini();
			sysMode(_sav.gamemode);
		end
	end
end

function savLupdate()

	if KeyDown(KEY_UP)==1 then
		_sav.mdx = _sav.mdx - SAV_ITEM_STEPX;
		_sav.mdy = _sav.mdy - SAV_ITEM_STEPY;
		_sav.chose = _sav.chose - 1;
		if _sav.chose <= 0 then
			_sav.mdx = SAV_MOUSE_DX + (_sav.item.size-1)*SAV_ITEM_STEPX;
			_sav.mdy = SAV_MOUSE_DY + (_sav.item.size-1)*SAV_ITEM_STEPY;
			_sav.chose = _sav.item.size;
		end
		savplaysound();
	end

	if KeyDown(KEY_DOWN)==1 then
		_sav.mdx = _sav.mdx + SAV_ITEM_STEPX;
		_sav.mdy = _sav.mdy + SAV_ITEM_STEPY;
		_sav.chose = _sav.chose + 1;
		if _sav.chose > _sav.item.size then
			_sav.mdx = SAV_MOUSE_DX;
			_sav.mdy = SAV_MOUSE_DY;
			_sav.chose = 1;
		end
		savplaysound();
	end

	if KeyDown(KEY_CROSS)==1 then
		_sav.mode = 4;
		savplaysound();
	end

	if KeyDown(KEY_CIRCLE)==1 then
		local i = amp_load(_sav.chose);
		if i~=0 then
			-- 初始一下信息
			selectinit();
			sysMode(LOAD_MODE);
			_sav.gamemode = EVENT_MODE;
		end
		i = nil;
		_sav.mode = 4;
		savplaysound();
	end

end

function savSupdate()

	if KeyDown(KEY_UP)==1 then
		_sav.mdx = _sav.mdx - SAV_ITEM_STEPX;
		_sav.mdy = _sav.mdy - SAV_ITEM_STEPY;
		_sav.chose = _sav.chose - 1;
		if _sav.chose <= 0 then
			_sav.mdx = SAV_MOUSE_DX + (_sav.item.size-1)*SAV_ITEM_STEPX;
			_sav.mdy = SAV_MOUSE_DY + (_sav.item.size-1)*SAV_ITEM_STEPY;
			_sav.chose = _sav.item.size;
		end
		savplaysound();
	end

	if KeyDown(KEY_DOWN)==1 then
		_sav.mdx = _sav.mdx + SAV_ITEM_STEPX;
		_sav.mdy = _sav.mdy + SAV_ITEM_STEPY;
		_sav.chose = _sav.chose + 1;
		if _sav.chose > _sav.item.size then
			_sav.mdx = SAV_MOUSE_DX;
			_sav.mdy = SAV_MOUSE_DY;
			_sav.chose = 1;
		end
		savplaysound();
	end

	if KeyDown(KEY_CROSS)==1 then
		_sav.mode = 4;
		savplaysound();
	end

	if KeyDown(KEY_CIRCLE)==1 then
		sound_systemfini();	-- 消除所有音效
		amp_save(_sav.chose);
		amp_pubsave();
		_sav.mode = 4;
		savplaysound();
	end

end

function savrender()
	if _sav.bg > 0 then
		ImageToScene(_sav.bg,0,0);
	end
	local i;
	local dx = SAV_ITEM_DX;
	local dy = SAV_ITEM_DY;
	for i=1,_sav.item.size do
		if _sav.item[i] > 0 then
			ImageToScene(_sav.item[i],dx,dy);
		end
		dx = dx + SAV_ITEM_STEPX;
		dy = dy + SAV_ITEM_STEPY;
	end
	dx = nil;
	dy = nil;
	if _sav.icon > 0 then
		ImageToScene(_sav.icon,_sav.mdx,_sav.mdy);
	end
end

--=========================================================
Print("sav.lua Init success.\n");