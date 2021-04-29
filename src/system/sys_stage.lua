--<<stage v0.1 doc>>--
-- 2010-01-15 by 白枫
--[场景配置接口]--


----------------------------------------------------

-- 销毁背景和立绘缓存里的数据并设置关闭显示
-- 销毁声音系统缓存里的数据

function allclear()
	local i;
	for i=1,32 do
		bgnull(i);
		fgnull(i);
		texfgnull(i);
	end
	for i=1,4 do
		oggunload(i);
		wavunload(i);
	end
	mp3unload(1);
	mp3unload(2);
	i = nil;
	text("");
	name("");
	textclear();
	dialoginit();
	sysMode(EVENT_MODE);
	SetSceneColor(0,0,0,0);
end

-- 对场景数据初始化
function stageinit()
	allclear();	-- 清空图像声音
	local i;
	for i=1,32 do
		delrect(i);
		dellockbyindex(i);
	end
	setmovescr("");
	setdialogscr("");
	i = nil;
end

function stageclear()
	stageinit();
end

function stagefindinit(file)
	Include(file);
end

function stagelockinit(file)
	Include(file);
end

function stagemovescr(file)
	setmovescr(file);
end

function stagedialogscr(file)
	setdialogscr(file);
end

---------------------------------------------
Print("stage.lua Init success.\n");