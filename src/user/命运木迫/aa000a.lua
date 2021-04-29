
stageclear();	-- 清空图像声音文字以及场景类数据

playfile("music/bg_02.mp3",1);

----

pause(30);

drawbgA("logo0001.jpg",AMFIN);

pause(10);

waitforkey(KEY_START);

playfile("sounds/fff15.wav",1);

mp3fadein(1,128,8,10);

turnbgA(AMFOUT,2000);

----

stageclear();	-- 清空图像声音文字以及场景类数据

--------

playfile("music/fff24.mp3",1);

pause(30);

---

---

drawbox("msg_0000.png",AMFIN);

drawtex("   电视里的恐怖片太无聊，甚至有些恶心，你完全无法想象一个人被活生生解剖的那种感觉，[n]");

drawtex("   对谁都太残忍了![n]");

turnbox(AMFOUT,200);

drawtex(" [n]");

pause(160);

----

drawbgA("bg0001.jpg",AMFIN);

drawbox("msg_0000.png",AMFIN);

drawtex("   我随手关掉了电视，打开电脑开始构思我的一篇新的恐怖小说的连载，[n]");

drawtex("   本来已经不再打算继续写恐怖小说了，可是有许多的读者更喜欢我的写的这类文章，[n]");

drawtex("   所以我不得不继续写下去，但这也让我感觉很痛苦，写的投入时，就会莫名其妙的就会陷入自己编织的噩梦里无法自拔，[n]");

drawtex("   为此，[c=ff0000]翼[c=ffffff]总是担心我有一天会因此疯掉，他永远都不明白为什么一个女孩子这么喜欢在三更半夜的时候写恐怖小说，[n]");

drawtex("   其实，我自己也不明白！[n]");

----

drawtex("   对着电脑，我的脑子一片空白，很奇怪我今天晚上居然没有一点灵感，思想似乎已经被长期的创作耗干.[n]");

turnbox(AMFOUT,200);

drawtex(" [n]");

turnbgA(AMFOUT,2000);

drawbgA("bg0002.jpg",AMFIN);

drawbox("msg_0000.png",AMFIN);
					
----

drawtex("   我无奈的正要关掉电脑正准备睡觉，一眼瞥见梳妆台的镜子里面映着一张床，床上面躺着的一个人正在朝我微笑着，[n]");

drawtex("   那是翼！[n]");

drawbgA("bg0002.jpg",AMSHAKE); turnbox(AMSHAKE,500);

drawtex("   我心里一惊，他今晚不是值班吗？怎么会在床上？他什么时候回来的，我怎么不知道？[n]");

----

turnbox(AMFOUT,200);

drawtex("[n]");

drawbgA("bg0003.jpg",AMFIN);

turnbox(AMFIN,200);

----

drawtex("   我猛的回头一看，床上什么都没有，[n]");

----

drawbgA("bg0004.jpg",AMFIN);

drawtex("   再转头看镜子里面，确实什么都没有[n]");

drawtex("   确实什么都没有？我突然感到一种莫名其妙的恐慌，[n]");

turnbgA(AMFOUT,100);

turnbox(AMFOUT,200);

drawtex("[n]");

----

turnbgA(AMFOUT,2000);

drawbgA("bg0005.jpg",AMFIN);

turnbox(AMFIN,200);

drawtex("   床上紧紧搂住自己冰凉的,在瑟瑟发抖的身体，[n]");

drawtex("   总感觉这间屋子不只我一个人存在，[n]");

drawtex("   尤其是在这一刻，丝毫减少不了这种……来自内心的恐惧.[n]");

drawtex("   我想念翼，多么希望他能够早点回家，[n]");

----

turnbox(AMFOUT,200);

drawtex("   [n]");

turnbgA(AMFOUT,2000);			-- 淡出

drawbgA("bg0006.jpg",AMFIN);		--加载背景

drawtex("   [n]");

----

turnbox(AMFIN,200);

drawtex("   我拿起手机拨通翼的电话，一阵熟悉的彩铃之后，电话那头却响起一个女子苍白而凄凉的声音。[n]");

drawtex("   ……[n]");

drawtex("   “喂，你找谁？” [n]");

drawtex("   我浑身打了一个冷战，没有说话就把电话挂了，[n]");

drawtex("   我一定拨错号码了，然后我非常小心的再重新拨了一次，电话的那一边依然是那个女子的声音，[n]");

drawtex("   “找谁？”[n]");

drawtex("   这下我确实呆了，怎么回事？翼的电话怎么可能在别的女人手里？于是，我硬着头皮问她，[n]");

drawtex("   “翼，在吗？”[n]");

drawtex("   “他不在。”[n]");

drawtex("   “可今晚不是他值班吗？”[n]");

drawtex("   “不是，今晚张教授值班！”[n]");

drawtex("   “那你是谁？”[n]");

drawtex("   ……[n]");

drawtex("   话那头是一片寂静，隐约听到一丝诡异的笑声，[n]");

drawtex("   那笑声很奇怪，似乎带着痛苦，又像是呻吟，然后那头出现忙音，她挂了我的电话！[n]");

----

turnbox(AMFOUT,200);

drawtex(" [n]");

----

turnbgA(AMFOUT,2000);

drawbgA("bg0005.jpg",AMFIN);

turnbox(AMFIN,200);

drawtex("   我一整夜都坐在床上不停的胡思乱想着，[n]");

drawtex("   跟翼在一起生活的两年来，我们感情一直非常好，他从来没有事情瞒我，[n]");

drawtex("   每次他从解剖室回来，我总感觉得到他身上那股血腥的味道，[n]");

drawtex("   我不止一次的希望他换工作，可他似乎对人体解剖有着一种狂爱，我虽然讨厌他的工作，还好他的工作丝毫不影响我们之间的感情，于是我也只能任其自然。 [n]");

drawtex("   可是……[n]");

drawtex("   翼最近一段时间变的恍恍惚惚，总是锁着眉头呆在一个角落不停的抽烟，[n]");

drawtex("   我知道，他一定碰到了无法解决的事情，可是他不告诉我。[n]");

drawtex("   我太了解翼，[n]");

drawtex("   只要他自己不想说，无论你怎样问，他都不会说的，[n]");

drawtex("   但我知道，他更多的是担心我！ [n]");

----
drawtex("   我想了一千种理由也不明白他的电话为什么是个女人接的，那女人的声音冷的让人害怕，[n]");

drawtex("   翼今晚没去值班，那他去了哪里？他为什么要骗我？[n]");

drawtex("   我们感情如此的好，他没有任何理由欺骗我，如果是打错电话的话，那个女人怎么知道翼？[n]");

drawtex("   可是我闭着眼睛也不会按错翼的号码，一滴眼泪顺着脸颊滑了下来，这时我真的希望是自己拨错号码了……[n]");

----

turnbox(AMFOUT,200);

drawtex(" [n]");

turnbgA(AMFOUT,2000);

drawbgA("bg0007.jpg",AMFIN);

turnbox(AMFIN,200);

drawtex("   凌晨六点，我听见开门的声音，[n]");

----

turnbox(AMFOUT,200);

drawtex(" [n]");

turnbgA(AMFOUT,2000);

drawbgA("bg0008.jpg",AMFIN);

----

turnbox(AMFIN,200);

drawtex("   翼走到床边抚摩着我的脸，[n]");

drawtex("   一眼望去，他一脸的疲惫和憔悴，身上散发着是我熟悉的那种血腥味道，[n]");

drawtex("   我在床上瑟瑟的发抖，他马上感觉到我的反常，很惊讶的问我，[n]");

drawtex("  “ 玲，你怎么了？这么的坐了一夜？” [n]");

drawtex("   “恩，我睡不着。”[n]");

drawtex("   “又写了那个什么恐怖小说？”[n]");

drawtex("   “没有，写不出来，没有一点灵感！”[n]");

drawtex("   “不要总是写那些恐怖死亡的文字，你这样我很担心你，知道吗？”[n]");

drawtex("   “我没事的，很累了吧？早点休息！” [n]");

drawtex("   “恩！”[n]");

drawtex("   ……[n]");

turnbox(AMFOUT,200);

drawtex("");

--

turnbgA(AMFOUT,2000);

drawbgA("bg0009.jpg",AMFIN);

turnbox(AMFIN,200);

drawtex("   他边说边在我身边躺了下来。[n]");

drawtex("   我轻轻的搂着他的肩膀，我本来不想问的，可我还是忍不住。[n]");

drawtex("   “翼，你今晚去了哪里？”[n]");

drawtex("   “恩？值班啊！”[n]");

drawtex("   “真的？没有骗我？”[n]");

drawtex("   他用手抚摩我的身体说，[n]");

drawtex("   “当然是真的，我什么时候骗过你？”[n]");

drawtex("   “可是我打你手机是别人接的。”[n]");

drawtex("   “怎么可能？我电话一直在我身上，而且电话也没响过。”[n]");

drawtex("   “我是说真的！”[n]");

drawtex("   “谁接的？”[n]");

drawtex("   “一个女的。”[n]");

--

drawtex("   “一个女的？怎么会呢？拨错号码了吗？” [n]");

drawtex("   “我闭着眼睛也不会拨错你的号码，何况，我还拨了两次，都是她接的！”[n]");

drawtex("   “奇怪了！”翼的眉头紧紧锁着。[n]");

drawtex("   翼的眉头紧紧锁着。[n]");

drawtex("   “怎么了？”[n]");

drawtex("   “解剖室里最近出了很多怪事，”[n]");

drawtex("   “被解剖的尸体第二天会无缘无故的更换地方，而且还会少一些内脏和血液，接连几天都是这样，我很头疼。” [n]");

drawtex("   “天那，怎会这样？还有谁有解剖室的钥匙？”[n]");

drawtex("   一阵寒意穿透我的骨髓，我浑身发冷。[n]");

drawtex("    “张教授，可是不可能跟他有什么关系的！” [n]");

drawtex("   “难说！”[n]");

drawtex("   我突然想到那个接电话的女人，我问翼”[n]");

drawtex("   “你们今晚解剖的是什么？”[n]");

drawtex("   “一个女人！”[n]");

drawbgA("bg0009.jpg",AMSHAKE); turnbox(AMSHAKE,500);

--

drawtex("   “天，会不会……！”[n]");

drawtex("   我只感觉全身冰凉！ [n]");

drawtex("   “不，不会的，怎么……！”[n]");

turnbox(AMFOUT,200);

drawtex("   [n]");

--

turnbgA(AMFOUT,2000);

drawbgA("bg0010.jpg",AMFIN);

turnbox(AMFIN,200);

drawtex("   刚说到这里，翼突然开始浑身发抖，脸色苍白的没有颜色，眼里是死灰样的恐惧，蜷成一团不停的用手撕扯自己的头发和脸，嘴里发出一种崩溃和可怕的呻吟，[n]");

drawtex("   我被他的举动吓呆了，我紧紧抱着他大声的喊着，[n]");

drawtex("   “翼，你怎么了？怎么了啊你？”[n]");

----

drawtex("   “不要过来，不要过来，我什么都答应你，什么都答应！”[n]");

drawtex("   翼因惊吓过度而失去挣扎的能力，我断定他这些话不是跟我说的，可是整间屋子除了我跟他还有谁？[n]");

drawtex("   我努力的向四周看去，什么也没有，我开始的幻觉没错，[n]");

drawtex("   这个房子还有另一个人存在，[n]");

drawtex("   或者说——根本就不是人！ [n]");

drawbgA("bg0010.jpg",AMSHAKE); turnbox(AMSHAK,500);

pause(30);

----

drawtex("   翼破裂的声音在凌晨回荡着，就像千万条毒蛇一样吞噬我的心脏，[n]");

drawtex("   翼蜷缩成一团无力的痛苦扭曲着，[n]");

drawtex("   然后他突然挣脱我从床上跳了下去，逃也似的向问外冲去，像头中了邪的发疯野兽，[n]");

drawbgA("bg0010.jpg",AMSHAKE); turnbox(AMSHAKE,500);

pause(30);

turnbox(AMFOUT,200);

drawtex("[n]");

turnbgA(AMFOUT,2000);

drawbgA("bg0011.jpg",AMFIN);

--

turnbox(AMFIN,200);

drawtex("   我紧跟着他追了出去，刚跑到门口，他突然停下来，猛的转身用那种血红而陌生的眼睛盯着我，好象要把我活吞一样，[n]");

drawtex("   [n]");

drawtex("   从来没有感觉他这么恐怖，这么陌生，离我这么远，[n]");

drawtex("   我吓的站在那里不知所措，整个身体被定住丧失知觉，然后他眼睛一闭，像个僵尸一样直挺挺的倒了下去！[n]");

drawbgA("bg0011.jpg",AMSHAKE); turnbox(AMSHAKE,500);

pause(30);

----

turnbox(AMFOUT,200);

drawtex("   [n]");

turnbgA(AMFOUT,2000);			-- 淡出

drawbgA("bg0012.jpg",AMFIN);

turnbox(AMFIN,200);

drawtex("   我确定翼不再动弹，慢慢走到他的身边，看他熟睡的像个孩子，[n]");

drawtex("   脸上是被他自己抓的血红的伤口，正在往外渗出一点点的血液，我终于忍不住失声的哭了起来，[n]");

drawtex("   我真的不知道这一切都是怎么回事，只是一刹那，所有的东西都变的那么恐怖，[n]");

drawtex("   ……[n]");

--

drawtex("   翼像中了魔法一样不受控制的发疯，又好象被什么东西控制了，我想着翼刚才的话，[n]");

drawtex("   “不要过来，我什么都答应你……”[n]");

drawtex("   有什么东西在骚扰和控制他？那个东西如果是存在的，我怎么会看不见？翼是不是能看见？可是那到底是个什么东西？[n]");

--
drawtex("   翼一直处于熟睡状态，他太重了，我弄不动他，只能坐在他的身边守着他，[n]");

drawtex("   那种从未有过的恐惧像空气一样无法避开，然后，我的眼睛落在他的脖子上，[n]");

drawfgA("fg0001.png",AMFIN);

drawtex("   他的脖子上正挂着一块用红色绳子穿住的木牌，木牌有着非常奇怪的图案，中间是种像八卦图样的东西，透露着一种让人无法理解的气息。[n]");

turnfgA(AMFOUT,2000);

--		
	
drawtex("   这是什么东西？我以前怎么从来没看见翼带过？[n]");

drawtex("   它让我浑身发冷，我想我必须从翼的身上取下这鬼东西，[n]");

killfgA();

----

drawtex("   然而我刚伸手去触摸到它，全身突然就像被什么电了一下，从手指到全身钻心的痛，然后我重重的倒在翼的身上，我居然不能触摸它？ [n]");

turnbox(AMFOUT,200);

drawtex("   [n]");

turnbgA(AMFOUT,2000);

drawbgA("bg0016.jpg",AMFIN);

pause(30);

turnbox(AMFIN,200);

drawtex("   整个房间布满了死亡的气息！[n]");

pause(120);

----

turnbox(AMFOUT,200);

drawtex("   [n]");

turnbgA(AMFOUT,2000);

drawbgA("bg0013.jpg",AMFIN);

pause(60);

--

turnbgA(AMFOUT,2000);

drawbgA("bg0014.jpg",AMFIN);

pause(30);

----

turnbox(AMFIN,200);

drawtex("   下午四点多，翼渐渐清醒过来，他一点都不知道发生了什么事，他更不知道自己为什么会睡在地上，[n]");

drawtex("   而我坐在他旁边脸色憔悴苍白，眼睛因为流泪过度，显得红肿而空洞。[n]");

--

turnbox(AMFOUT,200);

drawtex("   [n]");

turnbgA(AMFOUT,2000);

drawbgA("bg0015.jpg",AMFIN);

pause(30);

turnbox(AMFIN,200);

drawtex("   我倒在他的怀里不停的呜咽着，他紧紧的拥着我说，[n]");

drawtex("   “玲，不要害怕，不要害怕，可能是最近太累，精神太压抑才会这样的，等明天去开点药休息几天，放心，我就会没事的！”[n]");

drawtex("   我一直都没有说话，这一刻我什么也说不出来，只是感觉太累太累。[n]");

turnbox(AMFOUT,200);

drawtex("   [n]");

turnbgA(AMFOUT,2000);

killbgA();

----

turnbox(AMFIN,200);

drawtex("   接连几天，没再出现什么事情，翼跟平时一样，每天上班、下班，渐渐的我也把这事淡忘了。 [n]");

drawtex("   可是谁知道噩梦却才刚刚开始。[n]");

turnbox(AMFOUT,200);

drawtex("");

pause(160);

----

jump("am_start.lua");

----
