--<<find v0.1 doc>>--
-- 2009-11-18 by 白枫
--[调查模块调用函数]--

--------------------------------------------

_find = {};
_find.icon = 0;		-- 鼠标文件
_find.icondx = 0;	-- 鼠标坐标x
_find.icondy = 0;	-- 鼠标坐标y
_find.alpha = 0;	-- 透明值
_find.count = 0;	-- 计数器
_find.mode = 0;
_find.gamemode = 0;
_find.sound = nil;
_find.cross = 0;	-- 叉键屏蔽

_find.func = nil;	-- 后台程序

_find.stepdx = 0;	-- 移动步长
_find.stepdy = 0;	-- 移动步长
_find.speed = 0;	-- 移动速度

FIND_ICON_DX = 0;
FIND_ICON_DY = 0;

function setfindfunc(func)
	_find.func = func;
end

function findinit(flag)
	_find.gamemode = SYSTEM_MODE;
	_find.icondx = FIND_ICON_DX;
	_find.icondy = FIND_ICON_DY;
	_find.stepdx = 0;
	_find.stepdy = 0;
	_find.speed = 0;
	_find.mode = 1;
	_find.cross = flag;
end

function findfini()
	if _find.icon>0 then
		FreeImage(_find.icon);
		_find.icon = 0;
	end
	_find.sound = nil;
	_find = nil;
end

function setfindsound(file)
	if _find.sound==nil then
		_find.sound = file;
	end
end

function findplaysound()
	if _find.sound then
		playfile(_find.sound,4);
	end
end

function findstopsound()
	if _find.sound then
		stopfile(_find.sound,1);
	end
end

function setfindicon(file)
	if _find.icon==0 then
		_find.icon = LoadImage(file,4444);
	end
end


function setfindiconxy(dx,dy)
	FIND_ICON_DX = dx;
	FIND_ICON_DY = dy;
	_find.icondx = dx;
	_find.icondy = dy;
end


function findfadein()
	_find.count = _find.count + 1;
	if _find.count>=2 then
		_find.alpha = _find.alpha + 20;
		_find.count = 0;
		if _find.alpha>=255 then _find.alpha = 255; end
	end
end

function findfadeout()
	_find.count = _find.count + 1;
	if _find.count>=2 then
		_find.alpha = _find.alpha - 20;
		_find.count = 0;
		if _find.alpha<=0 then _find.alpha = 0; end
	end
end

function findtest()
	return testrect(_find.icondx+10,_find.icondy+6);
end

function findupdate()

	if KeyDown(KEY_CROSS)==1 then
		if _find.cross==0 then
			_find.mode = 3;
		end
		findplaysound();
	end

	if KeyDown(KEY_CIRCLE)==1 then
		local index = testrect(_find.icondx+10,_find.icondy+6);
		if index > 0 then
			jumprectscr(index);
			_find.mode = 3;
		end
		findplaysound();
		index = nil;
	end

	_find.speed = _find.speed + 0.5;

	if getalogdx()<64 then
		_find.stepdx = _find.stepdx - _find.speed;
	end
	if getalogdx()>192 then
		_find.stepdx = _find.stepdx + _find.speed;
	end
	if getalogdy()<64 then
		_find.stepdy = _find.stepdy - _find.speed;
	end
	if getalogdy()>192 then
		_find.stepdy = _find.stepdy + _find.speed;
	end

	_find.stepdx = _find.stepdx * 0.9;
	_find.stepdy = _find.stepdy * 0.9;

	_find.icondx = _find.icondx + _find.stepdx;
	_find.icondy = _find.icondy + _find.stepdy;

	if _find.icondx < -8 then
		_find.stepdx = _find.stepdx * (-1);
		_find.icondx = -8;
	end
	if _find.icondx > 460 then
		_find.stepdx = _find.stepdx * (-1);
		_find.icondx = 460;
	end
	if _find.icondy < -4 then
		_find.stepdy = _find.stepdy * (-1);
		_find.icondy = -4;
	end
	if _find.icondy > 254 then
		_find.stepdy = _find.stepdy * (-1);
		_find.icondy = 254;
	end

	_find.speed = 0;
end

function findrender()
	if _find.icon>0 then
		DrawImage(_find.icon,_find.icondx,_find.icondy,_find.alpha);
	end
end

-- >>> 调查模块调用的函数 <<< --

function userfind()
	if _find.mode==1 then
		--Print("find mode = 1.\n");
		findfadein();
		findrender();
		if _find.alpha>=255 then _find.mode=2; end
	elseif _find.mode==2 then
		--Print("find mode = 2.\n");
		if _find.func then
			_find.func();
		end
		findupdate();
		findrender();
	elseif _find.mode==3 then
		--Print("find mode = 3.\n");
		findfadeout();
		findrender();
		if _find.alpha<=0 then _find.mode=4; end
	elseif _find.mode==4 then
		findstopsound();
		sysMode(_find.gamemode);
		_find.gamemode = EVENT_MODE;
		--Print("3.",GetGameMode(),"\n");
	end
end

-- >>> 进入调查模块之后系统会调用userfind函数 <<< --

--------------------------------------------
Print("find.lua Init success.\n");