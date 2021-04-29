--<<text v0.1 doc>>--
-- 2010-02-02 by 白枫
--[动态对话显示增强接口]--

_dialog = {};
_dialog.icondx = 0;
_dialog.icondy = 0;
_dialog.icon = 0;
_dialog.on = 1;
_dialog.count = 0;

_dialog.mode = 0;

DIALOG_ICON_SPEED = 20;

-----------------------------------------------

function say(dia)
	setdialog(dia);
end

function setdialog(dia)
	if _dialog.mode==0 then
		if dia then text(dia); end
		_dialog.mode = 1;
	elseif _dialog.mode==1 then
		if KeyDown(KEY_CIRCLE)==1 then
			_dialog.mode = 2;
			playfile(DIALOG_SOUND,4);
		end
		if GetGameMode()==SPEED_MODULE then
			_dialog.mode = 2;
		else
			dialogiconrender();
		end
	elseif _dialog.mode==2 then
		dialoginit();
		return;
	end
	loop();
end

function setdialogicon(file)
	if _dialog.icon==0 then
		_dialog.icon = LoadImage(file,4444);
	end
end

function setdialogiconxy(dx,dy)
	_dialog.icondx = dx;
	_dialog.icondy = dy;
end

function setdialogiconspeed(sp)
	DIALOG_ICON_SPEED = sp;
end

function dialogiconrender()
	_dialog.count = _dialog.count + 1;
	if _dialog.count >= DIALOG_ICON_SPEED then
		_dialog.on = 1 - _dialog.on;
		_dialog.count = 0;
	end
	if _dialog.icon > 0 and _dialog.on==1 then
		ImageToScene(_dialog.icon,_dialog.icondx,_dialog.icondy);
	end
end

function dialoginit()
	_dialog.on = 1;
	_dialog.count = 0;
	_dialog.mode = 0;
end

function dialogfini()
	if _dialog.icon > 0 then
		FreeImage(_dialog.icon);
		_dialog.icon = 0;
	end
	_dialog = nil;
end

-----------------------------------------------------
Print("text.lua Init success.\n");