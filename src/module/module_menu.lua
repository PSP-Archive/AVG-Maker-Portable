--<<menu v0.2 doc>>--
-- 2010-01-01 by 白枫
--[简易菜单]--

----------------------------------------------

_menu = {};
_menu.bg = 0;
_menu.bgdx = 0;
_menu.bgdy = 0;
_menu.icon = 0;
_menu.icondx = 0;
_menu.icondy = 0;
_menu.sound = nil;
_menu.chose = 0;

_menu.mode = 0;
_menu.gamemode = 0;

_menu.alpha = 0;	-- 透明值
_menu.count = 0;	-- 计数器

MENU_BG_DX = 0;
MENU_BG_DY = 0;

MENU_ICON_DX = 0;
MENU_ICON_DY = 0;

MENU_STEP_DX = 0;
MENU_STEP_DY = 0;

MENU_ITEM_SIZE = 0;

function menuinit()
	_menu.icondx = MENU_ICON_DX;
	_menu.icondy = MENU_ICON_DY;
	_menu.chose = 1;
	_menu.mode = 1;
	_menu.gamemode = SYSTEM_MODE;	-- 保存上一个状态
	_menu.alpha = 0;
	_menu.count = 0;
end

function menufini()
	_menu.sound = nil;
	if _menu.bg>0 then
		FreeImage(_menu.bg);
		_menu.bg = 0;
	end
	if _menu.icon>0 then
		FreeImage(_menu.icon);
		_menu.icon = 0;
	end
end

function setmenubg(file)
	if _menu.bg==0 then
		_menu.bg = LoadImage(file,4444);
	end
end

function setmenubgxy(dx,dy)
	MENU_BG_DX = dx;
	MENU_BG_DY = dy;
	_menu.bgdx = dx;
	_menu.bgdy = dy;
end

function setmenuicon(file)
	if _menu.icon==0 then
		_menu.icon = LoadImage(file,4444);
	end
end

function setmenuiconxy(dx,dy)
	MENU_ICON_DX = dx;
	MENU_ICON_DY = dy;
	_menu.icondx = dx;
	_menu.icondy = dy;
end

function setmenuiconstep(stepdx,stepdy)
	MENU_STEP_DX = stepdx;
	MENU_STEP_DY = stepdy;
end

function setmenuitemsize(size)
	MENU_ITEM_SIZE = size;
end

function setmenusound(file)
	if _menu.sound==nil then
		_menu.sound = file;
	end
end

function menuplaysound()
	if _menu.sound then
		playfile(_menu.sound,4);
	end
end

function menustopsound()
	if _menu.sound then
		stopfile(_menu.sound,1);
	end
end

function menufadein()
	_menu.count = _menu.count + 1;
	if _menu.count >= 2 then
		_menu.alpha = _menu.alpha + 20;
		_menu.count = 0;
		if _menu.alpha>=255 then _menu.alpha = 255; end
	end
end

function menufadeout()
	_menu.count = _menu.count + 1;
	if _menu.count >= 1 then
		_menu.alpha = _menu.alpha - 20;
		_menu.count = 0;
		if _menu.alpha<=0 then _menu.alpha = 0; end
	end
end

function menuupdate()
	if KeyDown(KEY_UP)==1 then
		if _menu.chose>1 then	-- 为1则不做处理
			_menu.chose = _menu.chose - 1;
			_menu.icondx = _menu.icondx - MENU_STEP_DX;
			_menu.icondy = _menu.icondy - MENU_STEP_DY;
		end
		menuplaysound();
	end

	if KeyDown(KEY_DOWN)==1 then
		if _menu.chose<MENU_ITEM_SIZE then
			_menu.chose = _menu.chose + 1;
			_menu.icondx = _menu.icondx + MENU_STEP_DX;
			_menu.icondy = _menu.icondy + MENU_STEP_DY;
		end
		menuplaysound();
	end

	if KeyDown(KEY_CIRCLE)==1 then
		_menu.mode = 3;
		menuplaysound();
	end

	if KeyDown(KEY_CROSS)==1 then
		sysMode(_menu.gamemode);
		menuplaysound();
	end
end

function menurender()
	-- 显示菜单
	--selectrender();
	if _menu.bg>0 then
		DrawImage(_menu.bg,_menu.bgdx,_menu.bgdy,_menu.alpha);
	end
	if _menu.icon>0 then
		DrawImage(_menu.icon,_menu.icondx,_menu.icondy,_menu.alpha);
	end
end

function menudechose()
	if _menu.chose==1 then

		-- 游戏快进

		if _menu.gamemode==EVENT_MODE then
			SYSTEM_MODE = EVENT_MODE;
			SetGameMode(SPEED_MODULE);
		elseif _menu.gamemode==SELECT_MODE then
			sysMode(SELECT_MODE);
		else
			sysMode(EVENT_MODE);
		end

	elseif _menu.chose==2 then

		-- 读档

		-- 对分支时读档作初始

		sysMode(_menu.gamemode);

		dialoginit();

		drawload();

	elseif _menu.chose==3 then

		-- 存档

		sysMode(_menu.gamemode);

		drawsave();

	elseif _menu.chose==4 then

		-- 设置
		sysMode(_menu.gamemode);

	elseif _menu.chose==5 then

		-- 返回标题
		stageclear();
		stacknull();
		jump(MENU_RETURN_TITLE);
		dialoginit();
		selectinit();
		sysMode(EVENT_MODE);
	end
end

-- >>> 菜单模块调用的函数 <<< --

function usermenu()
	if _menu.mode==1 then
		menufadein();
		menurender();
		if _menu.alpha>=255 then _menu.mode=2; end
	elseif _menu.mode==2 then
		menuupdate();
		menurender();
	elseif _menu.mode==3 then
		menufadeout();
		menurender();
		if _menu.alpha<=0 then _menu.mode=4; end
	elseif _menu.mode==4 then
		menudechose();
		--menurender();
	end
end

-- >>> 设置菜单模块之后系统会调用usermenu函数 <<< --

----------------------------------------------
Print("menu.lua Init success.\n");