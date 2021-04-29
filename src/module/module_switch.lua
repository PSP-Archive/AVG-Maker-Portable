
-- 2009-11-06 by 白枫
--[默认状态下对按键的处理]--

-----------------------------------------------------

-- 检测某个按键是否按下
-- key		按键,KEY_CROSS,KEY_CIRCLE,KEY_START,KEY_SELECT
-- 返回值1或0
-- KeyDown(key)
----------------------------------

-- 检测某个按键是否抬起
-- key		按键,KEY_CROSS,KEY_CIRCLE,KEY_START,KEY_SELECT
-- 返回值1或0
-- KeyUp(key)
----------------------------------

-- 初始化按键
-- KeyInit()
----------------------------------



--------------------------
-----以下为函数声明区-----
--------------------------

------------------------------------------------------

--<默认状态下被每一帧调用,未完成>--

function KeySwitch()

	showfps();	-- 帧数、内存信息
	local gamemode = GetGameMode();

	if gamemode==DEFAULT_MODULE then

		sys_call_menu();
		TextWaitKey(KEY_CIRCLE);

		MsgBoxHide();	-- 隐藏对话框

	elseif gamemode==SPEED_MODULE then
		if KeyDown(KEY_CROSS)==1 then
			SetGameMode(DEFAULT_MODULE);
		end
	elseif gamemode==BG_MODULE then
		MsgBoxUnhide();		-- 返回剧情模块
	end

	gamemode = nil;
end

function showfps()
	if DEBUG==1 then
		ShowFps();
	end
end

function callmenu()
	if TextFinish()==1 or TextWaitKeyTrue()==1 then
		if KeyDown(KEY_START)==1 then
			drawmenu();
		end
	end
end

function MsgBoxHide()
	if TextFinish()==1 or TextWaitKeyTrue()==1 then
		if KeyDown(KEY_SQUARE)==1 then
			texthide();
		end
	end
end

function MsgBoxUnhide()
	if KeyDown(KEY_CROSS)==1 then
		textunhide();
	end
end

function menu_be_hide()
	--Print("菜单呼出被隐藏.\n");
end

function callmenuon()
	sys_call_menu = callmenu;
end

function callmenuoff()
	sys_call_menu = menu_be_hide;
end

sys_call_menu = callmenu;

--------------------------------------
Print("keyswitch.lua Init success.\n");