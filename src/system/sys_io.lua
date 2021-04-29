--<<io v0.2 doc>>--
-- 2010-02-09 by 白枫
--[简单io接口]--

-- 打开或建立一个文件,返回一个文件引用
-- mode取值FILE_READ或FILE_WRITE
-- fopen(filename,mode)

-- 关闭一个文件引用,不使用记得关闭,否则视为泄漏
-- fclose(fp)

-- 向文件当前位置写入一个数据
-- type为数据类型,TYPE_INT,TYPE_FLOAT,TYPE_CHAR,TYPE_BYTE
-- fwrite(fp,type,value)

-- 从文件当前位置读入一个数据引用
-- type为数据类型,TYPE_INT,TYPE_FLOAT,TYPE_CHAR,TYPE_BYTE
-- fread(fp,type)

-- 返回文件开始处
-- rewind(fp)

-- 让文件位置移动offset个字节
-- mode为文件位置,SEEK_SET(开头),SEEK_END(最后)
-- fseek(fp,offset,mode)


-- 返回整数类型数据的大小
-- sizeofint()

-- 返回浮点类型数据的大小
-- sizeoffloat()

-- >>> 简单例子 <<< --

-- fp = fopen("aaa.bin",FILE_WRITE);	-- 创建一个aaa.bin的二进制文件
-- fwrite(fp,TYPE_INT,9999);		-- 写入一个整数
-- fwrite(fp,TYPE_FLOAT,0.9878);	-- 写入一个浮点数
-- fwrite(fp,TYPE_CHAR,"kkkkkkkkk");	-- 写入一个字符串
-- fclose(fp);				-- 关闭并保存文件
-- fp = fopen("aaa.bin",FILE_READ);	-- 打开一个文件
-- value = fread(fp,TYPE_INT);		-- 读取一个整数
-- Print(value,"\n");
-- value = fread(fp,TYPE_FLOAT);	-- 读取一个浮点数
-- Print(value,"\n");
-- value = fread(fp,TYPE_CHAR);		-- 读取一个字符串
-- Print(value,"\n");
-- fclose(fp);
-- fp = nil;

-- >>> -------- <<< --

function isfiletrue(filename)
	local fp = fopen(filename,FILE_READ);
	if fp > 0 then
		fclose(fp);
		fp = nil;
		return 1;
	else
		fp = nil;
		return 0;
	end
end

------------------------------------------
Print("io.lua Init success.\n");