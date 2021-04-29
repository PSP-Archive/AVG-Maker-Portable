
if isfiletrue(GetPubValueFilePath())==1 then goto(*end); end

--==========================================

*newdata

callmenuoff();

amp_pubsave();

say("[c=ffffff]系统为第一次运行,正在创建公用数据文件,请稍候[|=02].[|=02].[|=02].[|=02].[|=02].[/c]");

playfile("successed.wav",1);

pause(10);

say("[c=ffffff]创建成功！！请按圆圈键继续！[/c]");

callmenuon();

goto(*exit);

--==========================================

*end

callmenuoff();

amp_pubload();	-- 读取公用系统数据

say("[c=ffffff]正在载入公用数据文件,请稍候[|=02].[|=02].[|=02].[|=02].[|=02].[/c]");

playfile("successed.wav",1);

pause(10);

say("[c=ffffff]载入成功！！请按圆圈键继续！[/c]");

callmenuon();

goto(*exit);

--==========================================

*exit
textclear();
stopfile("wav",1);
exit();
