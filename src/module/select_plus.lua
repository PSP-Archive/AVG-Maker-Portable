
--================================================================

function SEL2(b1,b2,l1,l2)
	if _select.mode==1 then
		--======================
		ramus(b1,b2);
		--======================
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
		if _select.chose==1 then goto(l1); end
		if _select.chose==2 then goto(l2); end
		return;
	end
	loop();
end

function SEL3(b1,b2,b3,l1,l2,l3)
	if _select.mode==1 then
		--======================
		ramus(b1,b2,b3);
		--======================
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
		if _select.chose==1 then goto(l1); end
		if _select.chose==2 then goto(l2); end
		if _select.chose==3 then goto(l3); end
		return;
	end
	loop();
end

function SEL4(b1,b2,b3,b4,l1,l2,l3,l4)
	if _select.mode==1 then
		--======================
		ramus(b1,b2,b3,b4);
		--======================
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
		if _select.chose==1 then goto(l1); end
		if _select.chose==2 then goto(l2); end
		if _select.chose==3 then goto(l3); end
		if _select.chose==4 then goto(l4); end
		return;
	end
	loop();
end

--================================================================
Print("select_plus.lua Init success.\n");