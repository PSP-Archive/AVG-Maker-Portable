--<<fairy v0.2 doc>>--
-- 2009-11-14 by 白枫
--[背景立绘设置相关接口]--

------------------------------------------------------

_bgmove = {};
_bgmove.dx = 0;
_bgmove.dy = 0;
_bgmove.mode = 0;
_bgmove.count = 0;

function fairymoveinit()
	_bgmove.dx = 0;
	_bgmove.dy = 0;
	_bgmove.mode = 0;
	_bgmove.count = 0;
end

function bgmove(index,x1,y1,x2,y2,step1,step2,speed)
	if _bgmove.mode==0 then
		_bgmove.dx = x1;
		_bgmove.dy = y1;
		_bgmove.mode = 1;
		bgxy(index,_bgmove.dx,_bgmove.dy);
	elseif _bgmove.mode==1 then
		_bgmove.count = _bgmove.count + 1;
		if _bgmove.count >= speed then
			_bgmove.count = 0;
			_bgmove.dx = _bgmove.dx + step1;
			_bgmove.dy = _bgmove.dy + step2;
			if step1 > 0 then
				if _bgmove.dx >= x2 then _bgmove.dx = x2; end
			else
				if _bgmove.dx <= x2 then _bgmove.dx = x2; end
			end
			if step2 > 0 then
				if _bgmove.dy >= y2 then _bgmove.dy = y2; end
			else
				if _bgmove.dy <= y2 then _bgmove.dy = y2; end
			end
		end
		bgxy(index,_bgmove.dx,_bgmove.dy);
		if _bgmove.dx==x2 then
			if _bgmove.dy==y2 then
				_bgmove.mode = 2;
			end
		end
	elseif _bgmove.mode==2 then
		_bgmove.mode = 0;
		_bgmove.count = 0;
		return;
	end
	loop();
end

function fgmove(index,x1,y1,x2,y2,step1,step2,speed)
	if _bgmove.mode==0 then
		_bgmove.dx = x1;
		_bgmove.dy = y1;
		_bgmove.mode = 1;
		fgxy(index,_bgmove.dx,_bgmove.dy);
	elseif _bgmove.mode==1 then
		_bgmove.count = _bgmove.count + 1;
		if _bgmove.count >= speed then
			_bgmove.count = 0;
			_bgmove.dx = _bgmove.dx + step1;
			_bgmove.dy = _bgmove.dy + step2;
			if step1 > 0 then
				if _bgmove.dx >= x2 then _bgmove.dx = x2; end
			else
				if _bgmove.dx <= x2 then _bgmove.dx = x2; end
			end
			if step2 > 0 then
				if _bgmove.dy >= y2 then _bgmove.dy = y2; end
			else
				if _bgmove.dy <= y2 then _bgmove.dy = y2; end
			end
		end
		fgxy(index,_bgmove.dx,_bgmove.dy);
		if _bgmove.dx==x2 then
			if _bgmove.dy==y2 then
				_bgmove.mode = 2;
			end
		end
	elseif _bgmove.mode==2 then
		_bgmove.mode = 0;
		_bgmove.count = 0;
		return;
	end
	loop();
end

function texfgmove(index,x1,y1,x2,y2,step1,step2,speed)
	if _bgmove.mode==0 then
		_bgmove.dx = x1;
		_bgmove.dy = y1;
		_bgmove.mode = 1;
		texfgxy(index,_bgmove.dx,_bgmove.dy);
	elseif _bgmove.mode==1 then
		_bgmove.count = _bgmove.count + 1;
		if _bgmove.count >= speed then
			_bgmove.count = 0;
			_bgmove.dx = _bgmove.dx + step1;
			_bgmove.dy = _bgmove.dy + step2;
			if step1 > 0 then
				if _bgmove.dx >= x2 then _bgmove.dx = x2; end
			else
				if _bgmove.dx <= x2 then _bgmove.dx = x2; end
			end
			if step2 > 0 then
				if _bgmove.dy >= y2 then _bgmove.dy = y2; end
			else
				if _bgmove.dy <= y2 then _bgmove.dy = y2; end
			end
		end
		texfgxy(index,_bgmove.dx,_bgmove.dy);
		if _bgmove.dx==x2 then
			if _bgmove.dy==y2 then
				_bgmove.mode = 2;
			end
		end
	elseif _bgmove.mode==2 then
		_bgmove.mode = 0;
		_bgmove.count = 0;
		return;
	end
	loop();
end

--================================================================

-- <draw> 函数组

function drawbgA(file,type)
	bgnull(1);
	bg(1,file,type,500);
	bgon(1);
	pause(30);
end

function drawbgB(file,type)
	bgnull(2);
	bg(2,file,type,500);
	bgon(2);
	pause(30);
end

function drawfgA(file,type)
	fgnull(1);
	fg(1,file,type,500,8888);
	fgxy(1,FG_DX_A,FG_DY_A);
	fgon(1);
	pause(30);
end

function drawfgB(file,type)
	fgnull(2);
	fg(2,file,type,500,8888);
	fgxy(2,FG_DX_B,FG_DY_B);
	fgon(2);
	pause(30);
end

function drawfgC(file,type)
	fgnull(3);
	fg(3,file,type,500,8888);
	fgxy(3,FG_DX_C,FG_DY_C);
	fgon(3);
	pause(30);
end

function drawfgD(file,type)
	fgnull(4);
	fg(4,file,type,500,8888);
	fgxy(4,FG_DX_D,FG_DY_D);
	fgon(4);
	pause(30);
end

function drawfgE(file,type)
	fgnull(5);
	fg(5,file,type,500,8888);
	fgxy(5,FG_DX_E,FG_DY_E);
	fgon(5);
	pause(30);
end

function drawfgF(file,type)
	fgnull(6);
	fg(6,file,type,500,8888);
	fgxy(6,FG_DX_F,FG_DY_F);
	fgon(6);
	pause(30);
end

function drawtfgA(tx,type)
	texfgnull(1);
	texfg(1,tx,type,200,480,80);
	texfgxy(1,TFG_DX_A,TFG_DY_A);
	texfgon(1);
	pause(12);
end

function drawtfgB(tx,type)
	texfgnull(2);
	texfg(2,tx,type,200,480,80);
	texfgxy(2,TFG_DX_B,TFG_DY_B);
	texfgon(2);
	pause(12);
end

function drawtfgC(tx,type)
	texfgnull(3);
	texfg(3,tx,type,200,480,80);
	texfgxy(3,TFG_DX_C,TFG_DY_C);
	texfgon(3);
	pause(12);
end

function drawtfgD(tx,type)
	texfgnull(4);
	texfg(4,tx,type,200,480,80);
	texfgxy(4,TFG_DX_D,TFG_DY_D);
	texfgon(4);
	pause(12);
end

function drawtfgE(tx,type)
	texfgnull(5);
	texfg(5,tx,type,200,480,80);
	texfgxy(5,TFG_DX_E,TFG_DY_E);
	texfgon(5);
	pause(12);
end

function drawtfgF(tx,type)
	texfgnull(6);
	texfg(6,tx,type,200,480,80);
	texfgxy(6,TFG_DX_F,TFG_DY_F);
	texfgon(6);
	pause(12);
end

function drawbox(file,type)
	fgnull(MSG_BOX_NUM);
	fg(MSG_BOX_NUM,file,type,200,8888);
	fgxy(MSG_BOX_NUM,MSG_BOX_DX,MSG_BOX_DY);
	fgon(MSG_BOX_NUM);
	pause(12);
end

function drawtex(tx)
	setdialog(tx);
end

function drawnm(nm,type)
	texfgnull(NAME_NUM);
	texfg(NAME_NUM,nm,type,200,480,80);
	texfgxy(NAME_NUM,NAME_DX,NAME_DY);
	texfgon(NAME_NUM);
	pause(12);
end

--================================================================

-- <模块>

function drawmenu()
	menuinit();
	usermain = usermenu;
	sysMode(MENU_MODE);
end

function drawfind()
	findinit(1);
	usermain = userfind;
	sysMode(FIND_MODE);
end

function drawmatch()
	matchinit();
	usermain = usermatch;
	sysMode(MATCH_MODE);
end

function drawsave()
	savinit(sav_save_data);
	usermain = usersave;
	sysMode(SAVE_MODE);
end

function drawload()
	savinit(sav_load_data);
	usermain = userload;
	sysMode(LOAD_MODE);
end

drawtitle = titlechose;

--================================================================

-- <kill> 函数组

function killbgA()
	bgnull(1);
end

function killbgB()
	bgnull(2);
end

function killfgA()
	fgnull(1);
end

function killfgB()
	fgnull(2);
end

function killfgC()
	fgnull(3);
end

function killfgD()
	fgnull(4);
end

function killfgE()
	fgnull(5);
end

function killfgF()
	fgnull(6);
end

function killtfgA()
	texfgnull(1);
end

function killtfgB()
	texfgnull(2);
end

function killtfgC()
	texfgnull(3);
end

function killtfgD()
	texfgnull(4);
end

function killtfgE()
	texfgnull(5);
end

function killtfgF()
	texfgnull(6);
end

function killbox()
	fgnull(MSG_BOX_NUM);
end

function killtex()
	--textclear();
	text("");
end

function killnm()
	texfgnull(NAME_NUM);
end

--================================================================

-- <turn> 函数组

function turnbgA(type,timeticks)
	bgeff(1,type,timeticks);
	pause(timeticks*0.06);
end

function turnbgB(type,timeticks)
	bgeff(2,type,timeticks);
	pause(timeticks*0.06);
end

function turnfgA(type,timeticks)
	fgeff(1,type,timeticks);
	pause(timeticks*0.06);
end

function turnfgB(type,timeticks)
	fgeff(2,type,timeticks);
	pause(timeticks*0.06);
end

function turnfgC(type,timeticks)
	fgeff(3,type,timeticks);
	pause(timeticks*0.06);
end

function turnfgD(type,timeticks)
	fgeff(4,type,timeticks);
	pause(timeticks*0.06);
end

function turnfgE(type,timeticks)
	fgeff(5,type,timeticks);
	pause(timeticks*0.06);
end

function turnfgF(type,timeticks)
	fgeff(6,type,timeticks);
	pause(timeticks*0.06);
end

function turntfgA(type,timeticks)
	texfgeff(1,type,timeticks);
	pause(timeticks*0.06);
end

function turntfgB(type,timeticks)
	texfgeff(2,type,timeticks);
	pause(timeticks*0.06);
end

function turntfgC(type,timeticks)
	texfgeff(3,type,timeticks);
	pause(timeticks*0.06);
end

function turntfgD(type,timeticks)
	texfgeff(4,type,timeticks);
	pause(timeticks*0.06);
end

function turntfgE(type,timeticks)
	texfgeff(5,type,timeticks);
	pause(timeticks*0.06);
end

function turntfgF(type,timeticks)
	texfgeff(6,type,timeticks);
	pause(timeticks*0.06);
end

function turnbox(type,timeticks)
	fgeff(MSG_BOX_NUM,type,timeticks);
	pause(timeticks*0.06);
end

function turntex(type,timeticks)
	Print("turntex error.\n");
end

function turnnm(type,timeticks)
	texfgeff(NAME_NUM,type,timeticks);
	pause(timeticks*0.06);
end

--================================================================

-- <set> 函数组

function setbgA(dx,dy)
	Print("bgA setxy error.\n");
end

function setbgB(dx,dy)
	Print("bgB setxy error.\n");
end

function setfgA(dx,dy)
	FG_DX_A = dx;
	FG_DY_A = dy;
	fgxy(1,dx,dy);
end

function setfgB(dx,dy)
	FG_DX_B = dx;
	FG_DY_B = dy;
	fgxy(2,dx,dy);
end

function setfgC(dx,dy)
	FG_DX_C = dx;
	FG_DY_C = dy;
	fgxy(3,dx,dy);
end

function setfgD(dx,dy)
	FG_DX_D = dx;
	FG_DY_D = dy;
	fgxy(4,dx,dy);
end

function setfgE(dx,dy)
	FG_DX_E = dx;
	FG_DY_E = dy;
	fgxy(5,dx,dy);
end

function setfgF(dx,dy)
	FG_DX_F = dx;
	FG_DY_F = dy;
	fgxy(6,dx,dy);
end

function settfgA(dx,dy)
	TFG_DX_A = dx;
	TFG_DY_A = dy;
	texfgxy(1,dx,dy);
end

function settfgB(dx,dy)
	TFG_DX_B = dx;
	TFG_DY_B = dy;
	texfgxy(2,dx,dy);
end

function settfgC(dx,dy)
	TFG_DX_C = dx;
	TFG_DY_C = dy;
	texfgxy(3,dx,dy);
end

function settfgD(dx,dy)
	TFG_DX_D = dx;
	TFG_DY_D = dy;
	texfgxy(4,dx,dy);
end

function settfgE(dx,dy)
	TFG_DX_E = dx;
	TFG_DY_E = dy;
	texfgxy(5,dx,dy);
end

function settfgF(dx,dy)
	TFG_DX_F = dx;
	TFG_DY_F = dy;
	texfgxy(6,dx,dy);
end

function setbox(dx,dy)
	MSG_BOX_DX = dx;
	MSG_BOX_DY = dy;
	fgxy(MSG_BOX_NUM,dx,dy);
end

function settex(dx,dy)
	textxy(dx,dy);
end

function setnm(dx,dy)
	NAME_DX = dx;
	NAME_DY = dy;
	fgxy(NAME_NUM,dx,dy);
end

--================================================================
Print("fairy.lua Init success.\n");