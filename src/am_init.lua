
dofile("game.ini");

Include("sys_callback.lua");
Include("sys_graphic.lua");
Include("sys_io.lua");
Include("sys_media.lua");
Include("sys_script.lua");
Include("sys_setting.lua");
Include("sys_stage.lua");
Include("sys_text.lua");
Include("sys_fairy.lua");

Include("module_switch.lua");
Include("module_select.lua");
Include("select_plus.lua");
Include("module_find.lua");
Include("module_menu.lua");
Include("module_title.lua");
Include("module_sav.lua");

--================================================================


--================--
-- <系统变量声明> --
-- {

	-- 立绘坐标
	FG_DX_A = 0;
	FG_DY_A = 0;
	FG_DX_B = 0;
	FG_DY_B = 0;
	FG_DX_C = 0;
	FG_DY_C = 0;
	FG_DX_D = 0;
	FG_DY_D = 0;
	FG_DX_E = 0;
	FG_DY_E = 0;
	FG_DX_F = 0;
	FG_DY_F = 0;

	-- 文字立绘坐标
	TFG_DX_A = 0;
	TFG_DY_A = 0;
	TFG_DX_B = 0;
	TFG_DY_B = 0;
	TFG_DX_C = 0;
	TFG_DY_C = 0;
	TFG_DX_D = 0;
	TFG_DY_D = 0;
	TFG_DX_E = 0;
	TFG_DY_E = 0;
	TFG_DX_F = 0;
	TFG_DY_F = 0;

	-- 对话框的立绘号码,坐标
	MSG_BOX_NUM = 10;
	MSG_BOX_DX = 0;
	MSG_BOX_DY = 185;

	-- 名字坐标,文字立绘号码
	NAME_NUM = 7;
	NAME_DX = 0;
	NAME_DY = 0;

-- }
--================--


--================--
-- <游戏相关设置> --
-- {
	-- 游戏名设置
	GAMENAME("模板");

	-- 文字设置
	-- {
		fontnull();				-- 销毁字体数据
		textclear();				-- 清屏
		font("font/font.ttf",13);		-- 读取ttf字体
		fontcolor(255,255,255,255);		-- 设置默认颜色
		fontwidth(22);				-- 写字宽度
		fontheight(20);				-- 写字高度
		textspeed(10);				-- 写字速度,数值越小越快
		textlen(39);				-- 设置行字符限制,超过则换行
		textline(3);				-- 设置行限制,超过则清屏
		textmode(TEXT_HALFSCENE);		-- 显字模式,TEXT_HALFSCENE,TEXT_FULLSCENE
		textxy(21,198);				-- 文字显示坐标
		namexy(27,156);				-- 名字显示坐标
		texton();				-- 显字开关

		SetMsgBoxNum(MSG_BOX_NUM);		-- 标记对话框的立绘号码,隐藏模式需要
		SetNameBoxNum(0);			-- 标记名字框的立绘号码,隐藏模式需要

		setdialogicon("dialog_icon.png");	-- 设置光标
		setdialogiconxy(435,210);		-- 设置坐标
		setdialogiconspeed(18);			-- 光标频率
	-- }

	-- 简易标题设置
	-- {
		titleinit();
		settitlexy(0,0);			-- 设置标题文件坐标
		settitleiconxy(290,152);		-- 设置光标文件坐标
		settitleiconstep(0,22);			-- 设置光标移动长度
		settitleitem(3);			-- 设置选项数量
		--settitlebg("");			-- 设置标题文件
		settitleicon("title_icon.png",nil);	-- 设置光标文件
		settitlesound("sound_bi.wav");		-- 设置标题选项音效
	-- }

	-- 分支设置
	-- {
		selectinit();
		setselectxy(100,43);			-- 分支按钮的显示坐标
		setselecticonxy(115,50);		-- 分支光标的显示坐标
		setselecticonstep(0,36);		-- 分支光标的移动步长
		setselectbuttonstep(0,36);		-- 分支按钮的间隔
		setselectbg("select_bg.png");		-- 分支的背景文件
		setselectbgmode(2);			-- 1为显示一个,2为显示n个
		setselectbgxy(60,37);			-- 分支背景文件坐标
		setselecticon("select_icon.png",nil);	-- 分支的光标文件
		setselectsound("sound_bi.wav");		-- 分支音效
	-- }


	-- 菜单相关设置
	-- {
		setmenubg("menu_bg.png");		-- 菜单文件
		setmenubgxy(186,68);			-- 菜单坐标
		setmenuicon("menu_icon.png");		-- 光标文件
		setmenuiconxy(159,70);			-- 光标坐标
		setmenuiconstep(0,24);			-- 光标移动步长
		setmenuitemsize(5);			-- 选项数量
		setmenusound("sound_bi.wav");		-- 音效
	-- }

	-- 调查相关设置
	-- {
		setfindicon("find_icon.png");		-- 调查光标
		setfindiconxy(230,128);			-- 光标坐标
		setfindsound("sound_bi.wav");		-- 音效
	-- }

	-- 存档相关设置
	-- {
		savsetloadimage("amsav_ui.jpg");	-- 读档界面
		savsetsaveimage("amsav_ui.jpg");	-- 存档界面
		savseticon("select_icon.png");		-- 鼠标文件
		savseticonxy(0,0);			-- 鼠标坐标
		savsetitemxy(0,0);			-- 选项坐标
		savsetitemstep(0,25);			-- 鼠标移动步长(像素)
		savsetsound("sound_bi.wav");		-- 音效
	-- }
-- }


--================--
--  用户自定变量  --
--================--

function uservalueinit()

	-- 用户自定变量初始化

	myvalue = 0;

end

function uservaluesave()

	-- 系统给了64个位置保存自己的变量

	usersetvalue(1,myvalue);

end

function uservalueload()

	-- 读取存档中自定变量的值

	myvalue = usergetvalue(1);

end


--================================================================

----------------------
--===简单封装函数===--
----------------------

--等待按键
function waitforkey(key)
	if KeyDown(key)==1 then
		return;
	else loop(); end
end

function pause(num)
	wait(num);
end

function QUIT()
	SetGameMode(QUIT_MODULE);
end

----------------------

jump("am_start.lua");		-- 剧情脚本入口
sysMode(EVENT_MODE);		-- 跑剧情

--================================================================
Print("am_init.lua Init success.\n");
Print("\n>>> am_start.lua begin. <<<\n\n");
