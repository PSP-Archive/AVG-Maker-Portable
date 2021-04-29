
--<<media v0.7 doc>>--
-- 2010-04-25 by 白枫
--[多媒体接口,简单易用,无需设置,调用就有效果]--

----------------------------------------------

--------------------------
-- 播放pmp动画,只有一句可以调用
-- pmplay(file);
--------------------------

--------------------------
-- 播放mp3,参数解说:
-- file		文件路径名
-- vol		音量大小,vol的取值范围0-128
-- times	播放次数,0为无限循环
-- speed	效果时长,越大时间越长
--------------------------
-- mp3load(file,index)
-- mp3loadbybuf(file,index)
-- mp3play(index)
-- mp3pause(index)
-- mp3resume(index)
-- mp3stop(index)
-- mp3replay(index)
-- mp3unload(index)
-- mp3volume(index,vol)
-- mp3playtimes(index,times)
-- mp3fadein(index,vol,speed,step)
-- mp3fadeout(index,vol,speed,step)
--------------------------

--------------------------
-- 播放ogg,wav,参数解说:
-- file		文件路径名
-- index	可用播放机的索引,index取值范围是 1-4 (不能其他值,否则后果自负)
-- vol		为音量大小,vol的取值范围1-128
-- times	播放次数,0为无限循环
-- speed	效果时长,越大时间越长
-- * 号为ogg或wav的代替符号
--------------------------
-- *load(file,index)
-- *loadbybuf(file,index)
-- *play(index)
-- *pause(index)
-- *resume(index)
-- *stop(index)
-- *replay(index)
-- *unload(index)
-- *volume(index,vol)
-- *playtimes(index,times)
-- *fadein(index,vol,speed,step)
-- *fadeout(index,vol,speed,step)
--------------------------


--------------------------
-- 简易播放文件,参数解说:
-- file		文件路径名
-- index	可用播放机的索引,index的取值范围是 1-4 (不能其他值,否则后果自负)
--------------------------
-- playfile(file,index)
-- stopfile(postfix,index)
--------------------------




--------------------------
-----以下为函数声明区-----
--------------------------

-----------------------------------------------

function pmplay(file)
	mLoad(file);
end

-----------------------------------------------

function mp3load(file,index)
	mLoad(file,index);
end

function mp3loadbybuf(file,index)
	mLoadbybuf(file,index);
end

function mp3play(index)
	mPlay("mp3",index);
	--mp3playtimes(0);
end

function mp3pause(index)
	mPause("mp3",index);
end

function mp3resume(index)
	mResume("mp3",index);
end

function mp3stop(index)
	mStop("mp3",index);
end

function mp3replay(index)
	mReplay("mp3",index);
end

function mp3unload(index)
	mUnLoad("mp3",index);
end

function mp3volume(index,vol)
	mSetVol("mp3",index,vol);
end

function mp3playtimes(index,times)
	mSetTimes("mp3",index,times);
end


function mp3fadein(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("mp3",nil,vol);
		mp3volume(index,0);
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol + step;
			if _sound.vol >= vol then
				_sound.mode = 2;
				_sound.vol = vol;
			end
			mp3volume(index,_sound.vol);
			--SetVol("mp3",nil,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end

function mp3fadeout(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("mp3",nil,vol);
		mp3volume(index,vol);
		_sound.vol = vol;
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol - step;
			if _sound.vol <= 0 then
				_sound.mode = 2;
				_sound.vol = 0;
			end
			mp3volume(index,_sound.vol);
			--SetVol("mp3",nil,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end


-----------------------------------------------

function oggload(file,index)
	mLoad(file,index);
end

function oggloadbybuf(file,index)
	mLoadbybuf(file,index);
end

function oggplay(index)
	mPlay("ogg",index);
	--oggplaytimes(index,1);
end

function oggpause(index)
	mPause("ogg",index);
end

function oggresume(index)
	mResume("ogg",index);
end

function oggstop(index)
	mStop("ogg",index);
end

function oggreplay(index)
	mReplay("ogg",index);
end

function oggunload(index)
	mUnLoad("ogg",index);
end

function oggvolume(index,vol)
	mSetVol("ogg",index,vol);
end

function oggplaytimes(index,times)
	mSetTimes("ogg",index,times);
end

function oggfadein(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("ogg",index,vol);
		oggvolume(index,0);
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol + step;
			if _sound.vol >= vol then
				_sound.mode = 2;
				_sound.vol = vol;
			end
			oggvolume(index,_sound.vol);
			--SetVol("ogg",index,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end

function oggfadeout(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("ogg",index,vol);
		oggvolume(index,vol);
		_sound.vol = vol;
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol - step;
			if _sound.vol <= 0 then
				_sound.mode = 2;
				_sound.vol = 0;
			end
			oggvolume(index,vol);
			--SetVol("ogg",index,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end


-----------------------------------------------

function wavload(file,index)
	mLoad(file,index);
end

function wavloadbybuf(file,index)
	mLoadbybuf(file,index);
end

function wavplay(index)
	mPlay("wav",index);
	--wavplaytimes(index,1);
end

function wavpause(index)
	mPause("wav",index);
end

function wavresume(index)
	mResume("wav",index);
end

function wavstop(index)
	mStop("wav",index);
end

function wavreplay(index)
	mReplay("wav",index);
end

function wavunload(index)
	mUnLoad("wav",index);
end

function wavvolume(index,vol)
	mSetVol("wav",index,vol);
end

function wavplaytimes(index,times)
	mSetTimes("wav",index,times);
end

function wavfadein(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("wav",index,vol);
		wavvolume(index,0);
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol + step;
			if _sound.vol >= vol then
				_sound.mode = 2;
				_sound.vol = vol;
			end
			wavvolume(index,_sound.vol);
			--SetVol("wav",index,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end

function wavfadeout(index,vol,speed,step)
	if _sound.mode==0 then
		sound_effect_init();
		--SetVol("wav",index,vol);
		vavvolume(index,vol);
		_sound.vol = vol;
		_sound.mode = 1;
	elseif _sound.mode==1 then
		_sound.count = _sound.count + 1;
		if _sound.count >= speed then
			_sound.count = 0;
			_sound.vol = _sound.vol - step;
			if _sound.vol <= 0 then
				_sound.mode = 2;
				_sound.vol = 0;
			end
			wavvolume(index,_sound.vol);
			--SetVol("wav",index,_sound.vol);
		end
	elseif _sound.mode==2 then
		sound_effect_init();
		return;
	end
	loop();
end


-----------------------------------------------

function playfile(file,index)
	if isfiletrue(file)==1 then mLoad(file,index);
	else mLoadbybuf(file,index); end
	mPlay(file,index);
end

function stopfile(postfix,index)
	mUnLoad(postfix,index);
end

----------------------------------------------------------------

_sound = {};
_sound.vol = 0;
_sound.count = 0;
_sound.mode = 0;

function sound_effect_init()
	_sound.vol = 0;
	_sound.count = 0;
	_sound.mode = 0;
end

function mediafini()
	local i;
	for i=1,4 do
		oggunload(i);
		wavunload(i);
	end
	mp3unload(1);
	mp3unload(2);
	i = nil;
end

function sound_systemfini()
	local i;
	for i=2,4 do
		oggunload(i);
		wavunload(i);
	end
	mp3unload(2);
	i = nil;
end

-----------------------------------------------
Print("media.lua Init success.\n");