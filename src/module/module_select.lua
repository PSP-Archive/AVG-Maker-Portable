--<<select v0.2 doc>>--
-- 2009-11-14 by 白枫
--[分支接口]--

----------------------------------------------
-- selectinit()
-- selectfini()
-- selectchose()
-- setselectxy(dx,dy)
-- setselecticonxy(dx,dy)
-- setselecticonstep(stepx,stepy)
-- setselectbuttonstep(stepx,stepy);
-- setselectbg(file)
-- setselectbgxy(dx,dy)
-- setselecticon(file,num)
-- setselectsound(file)
----------------------------------------------

_select = {};
_select.chose = 0;
_select.mode = 0;
_select.gamemode = 0;
_select.bg = 0;		-- 背景
_select.icon = 0;	-- 光标
_select.dx = 0;		-- 光标坐标x
_select.dy = 0;		-- 光标坐标y
_select.stepx = 0;	-- 步长x
_select.stepy = 0;	-- 步长y
_select.button = {};	-- 按钮表
_select.sound = nil;

_select.bgmode = 1;

SELECT_BG_DX = 0;	-- 桌布坐标
SELECT_BG_DY = 0;	-- 桌布坐标

SELECT_ICON_DX = 0;	-- 选择光标坐标x
SELECT_ICON_DY = 0;	-- 选择光标坐标y

SELECT_BUTTON_DX = 0;	-- 文字坐标x
SELECT_BUTTON_DY = 0;	-- 文字坐标y

SELECT_BUTTON_STEPX = 0;	-- 按钮间隔x
SELECT_BUTTON_STEPY = 0;	-- 按钮间隔y

function selectinit()
	KeyInit();
	_select.mode = 1;
	_select.dx = SELECT_ICON_DX;
	_select.dy = SELECT_ICON_DY;
	sysMode(SELECT_MODE);
	_select.chose = 1;
end

function selectfini()
	selectbuttonfini();
	if _select.bg > 0 then
		FreeImage(_select.bg);
		_select.bg = 0;
	end
	if _select.icon > 0 then
		FreeImage(_select.icon);
		_select.icon = 0;
	end
	_select.sound = 0;
	_select = nil;
end

function setselectxy(dx,dy)
	SELECT_BUTTON_DX = dx;
	SELECT_BUTTON_DY = dy;
end

function setselecticonxy(dx,dy)
	SELECT_ICON_DX = dx;
	SELECT_ICON_DY = dy;
	_select.dx = dx;
	_select.dy = dy;
end

function setselecticonstep(stepx,stepy)
	_select.stepx = stepx;
	_select.stepy = stepy;
end

function setselectbg(file)
	if _select.bg>0 then
		FreeImage(_select.bg);
		_select.bg = 0;
	end
	_select.bg = LoadImage(file,4444);
end

function setselectbgmode(num)
	_select.bgmode = num;
end

function setselectbgxy(dx,dy)
	SELECT_BG_DX = dx;
	SELECT_BG_DY = dy;
end

function setselectsound(file)
	if _select.sound == nil then
		_select.sound = file;
		--Print(file,"\n");
	end
end

function selectsoundplay()
	if _select.sound then
		playfile(_select.sound,4);
	end
end

function selectsoundstop()
	if _select.sound then
		stopfile(_select.sound,1);
	end
end

function setselecticon(file,num)
	if _select.icon>0 then
		FreeImage(_select.icon);
		_select.icon = 0;
	end
	_select.icon = LoadImage(file,4444);
end

function setselectbuttonstep(stepx,stepy)
	SELECT_BUTTON_STEPX = stepx;
	SELECT_BUTTON_STEPY = stepy;
end

function selectchose()
	if _select.mode==1 then
		selectinit();
		_select.mode = 2;
		selectbuttoninit();
	elseif _select.mode==2 then
		selectupdate();
		selectrender();
	elseif _select.mode==3 then
		_select.mode = 1;
		selectbuttonfini();
		sysMode(EVENT_MODE);
		return _select.chose;
	end
	loop();
end

function selectupdate()
	--Print("select update.\n");

	if KeyDown(KEY_DOWN)==1 then
		_select.dx = _select.dx + _select.stepx;
		_select.dy = _select.dy + _select.stepy;
		_select.chose = _select.chose + 1;
		selectsoundplay();
	end
	if KeyDown(KEY_UP)==1 then
		_select.dx = _select.dx - _select.stepx;
		_select.dy = _select.dy - _select.stepy;
		_select.chose = _select.chose - 1;
		selectsoundplay();
	end
	if _select.chose > button_get_amount(1) then
		_select.chose = 1;
		_select.dx = SELECT_ICON_DX;
		_select.dy = SELECT_ICON_DY;
	elseif _select.chose < 1 then
		_select.chose = button_get_amount(1);
		_select.dx = SELECT_ICON_DX + (_select.stepx * (button_get_amount(1)-1));
		_select.dy = SELECT_ICON_DY + (_select.stepy * (button_get_amount(1)-1));
	end

	if KeyDown(KEY_CIRCLE)==1 then
		_select.mode = 3;
		selectsoundplay();
	end

	if KeyDown(KEY_START)==1 then
		if sys_call_menu == callmenu then
			drawmenu();
		end
	end
end

function selectrender()
	if button_get_amount(1)==0 then return; end

	if _select.bgmode==1 then
		if _select.bg>0 then
			ImageToScene( _select.bg, SELECT_BG_DX, SELECT_BG_DY);
		end
	elseif _select.bgmode==2 then
		local i = 0;
		local num = button_get_amount(1);
		local dx = SELECT_BG_DX;
		local dy = SELECT_BG_DY;

		for i=1,num do
			-- 显示分支用背景图
			if _select.bg>0 then
				ImageToScene( _select.bg, dx, dy);
			end
			dx = dx + SELECT_BUTTON_STEPX;
			dy = dy + SELECT_BUTTON_STEPY;
		end

		i = nil;
		num = nil;
		dx = nil;
		dy = nil;
	end

	selectbuttonrender();

	if _select.icon>0 then
		ImageToScene( _select.icon, _select.dx, _select.dy);
	end
end

function selectbuttoninit()
	-- 把按钮载入到button表
	local i = 0;
	local num = button_get_amount(1);
	for i=1,num do
		_select.button[i] = button_get_imagetext(1,i);
	end
	i = nil;
	num = nil;
end

function selectbuttonfini()
	_select.button = nil;
	_select.button = {};
	buttonnull(1);
end

function selectbuttonrender()
	local i = 0;
	local num = button_get_amount(1);
	local dx = SELECT_BUTTON_DX;
	local dy = SELECT_BUTTON_DY;
	for i=1,num do
		if _select.button[i]>0 then
			ImageToScene(_select.button[i],dx,dy);
		end
		dx = dx + SELECT_BUTTON_STEPX;
		dy = dy + SELECT_BUTTON_STEPY;
	end
	i = nil;
	num = nil;
	dx = nil;
	dy = nil;
end

-----------------------------------------------
Print("seltct.lua Init success.\n");