/*
    MIT License

    Copyright (c) 2018 José González

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
 */


#include "common_example.h"



//#include "ScriptPCH.h"   <- You could use the Precompiled Headers too!

//    item_ + "something"
class item_example : public ItemScript
{
public:
    item_example() : ItemScript("item_example"){}  //炉石ID 6948



	bool  ExtractUInt32(char** args, uint32& val) { return ExtractUInt32Base(args, val, 10); }

	bool isWhiteSpace(char c)
	{
		return ::isspace(int(c)) != 0;
	}

	bool  ExtractUInt32Base(char** args, uint32& val, uint32 base)
	{
		if (!*args || !**args)
			return false;

		char* tail = *args;

		unsigned long valRaw = strtoul(*args, &tail, base);

		if (tail != *args && isWhiteSpace(*tail))
			*(tail++) = '\0';
		else if (tail && *tail)                                 // some not whitespace symbol
			return false;                                       // args not modified and can be re-parsed

		if (valRaw > std::numeric_limits<uint32>::max())
			return false;

		// value successfully extracted
		val = uint32(valRaw);
		*args = tail;

		SkipWhiteSpaces(args);
		return true;
	}
	bool  ExtractOptUInt32(char** args, uint32& val, uint32 defVal)
	{
		if (!*args || !**args)
		{
			val = defVal;
			return true;
		}

		return ExtractUInt32(args, val);
	}



	void SkipWhiteSpaces(char** args)
	{
		if (!*args)
			return;

		while (isWhiteSpace(**args))
			++(*args);
	}
	bool  ExtractFloat(char** args, float& val)
	{
		if (!*args || !**args)
			return false;

		char* tail = *args;

		double valRaw = strtod(*args, &tail);

		if (tail != *args && isWhiteSpace(*tail))
			*(tail++) = '\0';
		else if (tail && *tail)                                 // some not whitespace symbol
			return false;                                       // args not modified and can be re-parsed

																// value successfully extracted
		val = float(valRaw);
		*args = tail;

		SkipWhiteSpaces(args);
		return true;
	}

	bool teleToPoint(Player *player, string xyz, uint32 needval) {
		uint32 accID = player->GetSession()->GetAccountId();
		uint32 mypoint = sPzxMgr->getMyPoint(accID);



		if (mypoint < needval) {//点数足够
			PSendSysMessage(player, u8"[系统消息]:你当前点数[|cff00ff00%d|h|r]不够支付", mypoint);
			return false;
		}
		ChatHandler handler(player->GetSession());
		const char * _args = xyz.c_str();
		char * args = const_cast<char*>(_args);
		sLog->outString(u8">> [PZX] xyzzzzzz=%s", args);
		float x;
		if (!ExtractFloat(&args, x)) {
			sLog->outString(u8">> [PZX] xyz1=%s", args);
			return false;
		}

		float y;
		if (!ExtractFloat(&args, y)) {
			sLog->outString(u8">> [PZX] xyz2=%s", args);
			return false;
		}

		float z;
		if (!ExtractFloat(&args, z)) {
			sLog->outString(u8">> [PZX] xyz3=%s", args);
			return false;
		}

		uint32 mapid;
		if (!ExtractOptUInt32(&args, mapid, player->GetMapId())) {
			sLog->outString(u8">> [PZX] xyz4=%s", args);
			return false;
		}
		if (sPzxMgr->cutPoints(needval, accID)) {
			PSendSysMessage(player, u8"[系统消息]:系统扣减[|cffff0000%d|h|r]后剩余[|cff00ff00%d|h|r]赞助点.", needval, sPzxMgr->getMyPoint(accID));
			return player->TeleportTo(mapid, x, y, z, 0.0f);
		}
		else
		{
			PSendSysMessage(player, u8"[系统消息]:你当前点数[|cff00ff00%d|h|r]不够支付", mypoint);
			return false;
		}
	}

	bool modifyTimeLength(Player *player, uint32 timelength, uint32 needval, uint32 action) {
		const char* txt;

		switch (action)
		{
		case 4001:
			txt = u8"双天赋功能";
			break;

		default:
			txt = u8"瞬飞功能";
			break;
		}
		uint32 accID = player->GetSession()->GetAccountId();
		uint32 guid = player->GetGUID().GetCounter();
		uint64 oldVel = sPzxMgr->getTimeLength(guid, action);

		if (oldVel) {
			//修改数据库，更改长度
			if (time(nullptr) > oldVel + timelength) {//过期了，重新开通

				uint32 mypoint = sPzxMgr->getMyPoint(accID);

				if (mypoint < needval) {//点数不够
					PSendSysMessage(player, u8"[系统消息]:你当前点数[|cffff0000%d|h|r]不够支付", mypoint);
					return false;
				}
				//TODO 修改数据库并且增加时长
				if (sPzxMgr->cutPoints(needval, accID) && sPzxMgr->updateTime(action, guid, accID, uint64(time(nullptr)))) {

					PSendSysMessage(player, u8"[系统消息]:系统扣减[|cffff0000%d|h|r]后剩余[|cff00ff00%d|h|r]赞助点", needval, sPzxMgr->getMyPoint(accID));
					PSendSysMessage(player, u8"[系统消息]:您的%s激活成功", txt);
				}
				else {
					PSendSysMessage(player, u8"[系统消息]:|cffff0000您赞助点系统异常，请联系GM-1004|h|r");
				}

			}
			else {//没过期
				PSendSysMessage(player, u8"[系统消息]:您的%s时间还在有效期", txt);
			}
			time_t mutetime = time(nullptr) + timelength;//2天后再刷新，一般公会不会连续开荒2天
		}
		else {//还没卡通过，第一次开通
			uint32 mypoint = sPzxMgr->getMyPoint(accID);

			if (mypoint < needval) {//点数不够
				PSendSysMessage(player, u8"[系统消息]:你当前点数[|cffff0000%d|h|r]不够支付", mypoint);
				return false;
			}
			//TODO 修改数据库并且增加时长
			if (sPzxMgr->cutPoints(needval, accID) && sPzxMgr->updateTime(action, guid, accID, uint64(time(nullptr)))) {

				PSendSysMessage(player, u8"[系统消息]:系统扣减[|cffff0000%d|h|r]后剩余[|cff00ff00%d|h|r]赞助点", needval, sPzxMgr->getMyPoint(accID));
				if (action == 4001) {
					//talentST  readPlay = readFromDB(player, true);
					//PSendSysMessage(player, u8"|cffff0000[系统消息]:|h|r您的第2套天赋功能已经开通，现在可以通过[|cffeb8920懦夫救星|h|r]设置新的天赋树");
					//player->CLOSE_GOSSIP_MENU();
				}
				PSendSysMessage(player, u8"[系统消息]:您的%s开通成功", txt);
			}
			else {
				PSendSysMessage(player, u8"[系统消息]:|cffff0000您赞助点系统异常，请联系GM-1005|h|r");
			}
		}
		return true;
	}

	void outputItemColorFormat(Player *player, ostringstream &itemret, uint32 itemID, const char *format) {
		const ItemTemplate* pProto = sObjectMgr->GetItemTemplate(itemID);
		if (pProto) {
			const char * colorItemPre = ItemQualityColorsStr[pProto->Quality];
			itemret << colorItemPre << pProto->Name1 << "|h|r";
			PSendSysMessage(player, format, itemret.str().c_str());
		}
		else {
			PSendSysMessage(player, u8"未找到物品ID-%d", itemID);
		}
		itemret.str(std::string());
	}
	bool cutPointAndlearnSpell(Player *pPlayer, uint32 skill, uint32 needval, uint32 action) {
		if (pPlayer->GetFreePrimaryProfessionPoints() == 0 && !(skill == 185 || skill == 129))
		{//附魔和急救
			PSendSysMessage(pPlayer, u8"[系统消息]:你已经学习了2项专业技能了.");
			return false;
		}

		if (!pPlayer->HasSkill(skill) || pPlayer->GetSkillValue(skill) < 400) {
			//ChatHandler handler(pPlayer->GetSession());
			//检查点数是否够
			uint32 accID = pPlayer->GetSession()->GetAccountId();
			uint32 mypoint = sPzxMgr->getMyPoint(accID);

			if (mypoint >= needval) {//点数足够
				SkillLineEntry const *SkillInfo = sSkillLineStore.LookupEntry(skill);
				if (!SkillInfo)
				{
					PSendSysMessage(pPlayer, u8"[系统消息]:您赞助点系统异常，请联系GM-1001");
					sLog->outError("您赞助点系统异常，请联系GM %d" + skill);
					return false;
				}
				if (sPzxMgr->cutPoints(needval, accID)) {
					PSendSysMessage(pPlayer, u8"[系统消息]:系统扣减[|cffff0000%d|h|r]后剩余[|cff00ff00%d|h|r]赞助点", needval, sPzxMgr->getMyPoint(accID));
				
					//直接新增方法by pzx  根据技能ID
					uint32 classmask = pPlayer->getClassMask();

					for (uint32 j = 0; j < sSkillLineAbilityStore.GetNumRows(); ++j)
					{
						SkillLineAbilityEntry const* skillLine = sSkillLineAbilityStore.LookupEntry(j);
						if (!skillLine)
							continue;

						// wrong skill
						if (skillLine->skillId != skill)
							continue;

						// not high rank
						if (skillLine->forward_spellid)
							continue;

						// skip racial skills
						if (skillLine->racemask != 0)
							continue;

						// skip wrong class skills
						if (skillLine->classmask && (skillLine->classmask & classmask) == 0)
							continue;

						SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(skillLine->spellId);
						if (!spellInfo || !SpellMgr::IsSpellValid(spellInfo))
							continue;

						pPlayer->learnSpell(skillLine->spellId);
					}

					uint16 maxLevel = pPlayer->GetPureMaxSkillValue(skill);
					pPlayer->SetSkill(skill, pPlayer->GetSkillStep(skill), maxLevel, maxLevel);

					char* skill_name = SkillInfo->name[sWorld->GetDefaultDbcLocale()];
					PSendSysMessage(pPlayer, u8"所有 %s 配方已经学习完成", skill_name);
					return true;
				}
				else {
					PSendSysMessage(pPlayer, u8"[系统消息]:2您赞助点系统异常，请联系GM-1002");

				}
			}
			else {
				PSendSysMessage(pPlayer, u8"[系统消息]:你当前点数[|cff00ff00%d|h|r]不够支付", mypoint);
			}
			return false;
		}
		else {
			PSendSysMessage(pPlayer, u8"[系统消息]:你已经练满该专业");
			return false;
		}


	}
	bool cutPointAndAddItem(Player *player, uint32 items, uint32 needval, uint32 count) {
		ostringstream outs;
		const ItemTemplate* pProto = sObjectMgr->GetItemTemplate(items);
		if (player->HasItemCount(items, 1, true) && pProto->MaxCount == 1) {//唯一物品检测
			outputItemColorFormat(player, outs, items, u8"[系统消息]:%s已经在物品清单中");
			return true;
		}
		ItemPosCountVec dest;
		InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, items, items == 49999 ? 1 : count);
		if (msg == EQUIP_ERR_OK)
		{
			//检查点数是否够
			uint32 accID = player->GetSession()->GetAccountId();
			uint32 mypoint = sPzxMgr->getMyPoint(accID);

			if (mypoint >= needval) {//点数足够
				Item* item = player->StoreNewItem(dest, items, true);
				if (sPzxMgr->cutPoints(needval, accID)) {
					sLog->outString( "Account %u guid %u : getitem from zz %u", accID, player->GetGUID().GetCounter(), items);
					PSendSysMessage(player, u8"[系统消息]:系统扣减[|cffff0000%d|h|r]后剩余[|cff00ff00%d|h|r]赞助点", needval, sPzxMgr->getMyPoint(accID));
					player->SendNewItem(item, 1, true, false);

					/*
					item->GetTemplate();
					const ItemTemplate* pProto = item->GetTemplate();
					if (pProto&&pProto->RequiredSkill == 762) {//物品是坐骑自动学习骑术
						player->LearnSpell(33389, false);
						player->LearnSpell(33392, false);
					}
					if (items == 49999) {//团长助手需要插入时间
						uint64 leftTime = uint64(time(nullptr)) - (30 - count) * 60 * 60 * 24;
						sPzxMgr->updateTime(49999, player->GetGUID().GetCounter(), accID, leftTime);
						//根据cont时长控制,如果conten小于30，则把数据库记录时间推迟

						//时间长度
					}
					
					if (items == 60003) {//免费体验，插入一条记录，证明体验过
						sPzxMgr->updateTime(items, player->GetGUID().GetCounter(), accID, uint64(time(nullptr)));
					}
					*/
					outputItemColorFormat(player, outs, items, u8"[系统消息]:%s已经添加到你包裹中");
					player->SaveToDB(true,false);//保存物品
				}
				else {
					PSendSysMessage(player, u8"[系统消息]:您赞助点系统异常，请联系GM-1003");
				}

			}
			else {
				PSendSysMessage(player, u8"[系统消息]:你当前点数[|cff00ff00%d|h|r]不够支付", mypoint);
			}

		}
		else
		{
			player->SendEquipError(msg, nullptr, nullptr, items);
			PSendSysMessage(player, u8"[系统消息]:您无法拥有该物品,请检查包包空间或装备唯一性");
		}
		return true;
	}


	void PSendSysMessage(Player *player, const char *format, ...)
	{
		va_list ap;
		char str[2048];
		va_start(ap, format);
		vsnprintf(str, 2048, format, ap);
		va_end(ap);

		WorldPacket data(SMSG_SERVER_MESSAGE, (strlen(str) + 1));              // guess size
		data << uint32(SERVER_MSG_STRING);
		data << str;

		if (player&&player->GetSession())
			player->GetSession()->SendPacket(&data);

	}

	string changeName(string _name, Player *player, MenuTree* tree) {
		string name(_name);
		uint32 accID = player->GetSession()->GetAccountId();

		string  pointT = to_string(tree->needval);
		regex  patternT("DDD");
		name = regex_replace(name, patternT, pointT);

		uint32 mypoint = sPzxMgr->getMyPoint(accID);
		string  timeT = to_string(mypoint);
		regex  patternD("TTT");
		name = regex_replace(name, patternD, timeT);

		regex pattern("[$]{1}\\d{4,}");
		//$60001|t  菜单与类型

		smatch result;
		//regex pattern("\\d{4}");	//匹配四个数字

		//迭代器声明
		string::const_iterator iterStart = name.begin();
		string::const_iterator iterEnd = name.end();
		string temp;
		while (regex_search(iterStart, iterEnd, result, pattern))
		{
			temp = result[0];
			iterStart = result[0].second;	//更新搜索起始位置,搜索剩下的字符串
		}
		if (temp.length() > 0) {
			string id = temp.substr(1);//截取$获取字符串
			int i_id = stoi(id);
			MenuTree _tree = sPzxMgr->getTreeByID(i_id);
			uint32 ty = _tree.type;
			if (ty == 3) {
				uint64 dbtime = sPzxMgr->getTimeLength(player->GetGUID().GetCounter(), i_id);
				uint32 dist;
				if ((_tree.itemid + dbtime) < time(nullptr)) {//超期了
					dist = 0;
					return "";
				}
				else {
					dist = (_tree.itemid + dbtime - time(nullptr)) / (60 * 60 * 24);
					if (dist <1) {
						dist = 1;
					}
				}
				name = regex_replace(name, pattern, to_string(dist));
			}
		}
		//物品内置时长
		iterStart = name.begin();
		iterEnd = name.end();
		temp = "";
		regex ItemIDpattern("[#]{1}\\d{2,}");
		while (regex_search(iterStart, iterEnd, result, ItemIDpattern))
		{
			temp = result[0];
			iterStart = result[0].second;	//更新搜索起始位置,搜索剩下的字符串
		}
		if (temp.length() > 0) {
			string id = temp.substr(1);//截取$获取字符串
			int item_id = stoi(id);

			if (!player->HasItemCount(item_id, 1, true))
				return "";//没有物品返回

						  //查看数据库中是否有记录的时长
			uint64 timeDur = sPzxMgr->getTimeLength(player->GetGUID().GetCounter(), item_id);
			if (timeDur == 0) {//没有插入数据的
				sPzxMgr->updateTime(item_id, player->GetGUID().GetCounter(), accID, uint64(time(nullptr)));//更新当前时间
				timeDur = 60 * 60 * 24 * 30;//默认30天
			}
			else {//有数据
				  //判断超期
				int32 leftLen = (timeDur + 60 * 60 * 24 * 30) - uint64(time(nullptr));
				if (leftLen <= 0) {
					//摧毁物品，
					player->DestroyItemCount(item_id, 1, true);
					sLog->outString(u8"GUID %d 过期自动摧毁%d", player->GetGUID().GetCounter(), item_id);
					PSendSysMessage(player, u8"您的团长工具已经过期,请重新购买");
					name = u8"您的团长工具道具已经过期,请重新购买";
				}
				else {
					uint32 dist = (leftLen) / (60 * 60 * 24);
					if (dist <1) {
						dist = 1;
					}
					name = regex_replace(name, ItemIDpattern, to_string(dist));
				}

			}

		}

		return name;
	}


	void showMenu(Player * player, Item * item) {
		ClearGossipMenuFor(player);
		uint32 guid = player->GetGUID().GetCounter();
		CharaMenuMap mmap = sPzxMgr->treeMenu;
		CharaMenuMap::iterator it;
		for (it = mmap.begin(); it != mmap.end(); it++) {

			uint32 id = it->first;
			MenuTree tree = it->second;
			uint32 unionid = tree.unionID;//时长判断
			uint32 unioncheck = tree.unioncheck;
			uint32 raceMask = tree.racemask;
			if (raceMask && ((player->getRaceMask()&raceMask) == 0)) {
				continue;
			}
			//sLog->outString(">>menuInfo %d %s", id, tree.name);
			string name = changeName(tree.name, player, &tree);//菜单名字
			if (name.length() > 0) {//一般都是过期或者未开通
				if (unionid) {//有关联项检查
					if (unionid == 4001) {
						MenuTree unionTree = sPzxMgr->getTreeByID(unionid);
						uint64 oldVel = sPzxMgr->getTimeLength(guid, unionid);
						if (oldVel == 0) {

							if (!unioncheck) {//第一次开通（没开通过），做异常检查
								player->ADD_GOSSIP_ITEM(tree.iconID, name.c_str(), GOSSIP_SENDER_MAIN, id);
							}
						}
						else {
							if (time(nullptr) > oldVel + unionTree.itemid) {//过期了，重新开通
								if (!unioncheck) {//互斥检查，异常检查
									player->ADD_GOSSIP_ITEM(tree.iconID, name.c_str(), GOSSIP_SENDER_MAIN, id);
								}
							}
							else {//没有过期
								if (unioncheck) {//互斥检查，正常检查
									player->ADD_GOSSIP_ITEM(tree.iconID, name.c_str(), GOSSIP_SENDER_MAIN, id);
								}
							}
						}
					}
				}
				else
					player->ADD_GOSSIP_ITEM(tree.iconID, name.c_str(), GOSSIP_SENDER_MAIN, id);
			}
		}
		if (player->IsGameMaster()) {
			player->ADD_GOSSIP_ITEM_EXTENDED(0, u8"重新加载服务器个性化配置", GOSSIP_SENDER_MAIN, 999, "reload config", 0, false);
		}

		player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, item->GetGUID());
	}
    // Triggers when the item executes the spell assigned to it
    // If you don't want a spell executed, assign the "Dummy Spell" (ID: 18282)
    bool OnUse(Player * player, Item * item, SpellCastTargets const& targets)
    {
		showMenu(player, item);
		player->CastSpell(player, 18282, false);//瞬间召唤
        return true;//返回true是中断法术
    }

    // Triggers when the player accepts the quest assigned to the item
    bool OnQuestAccept(Player* player, Item* item, Quest const* quest)
    {
        return true;
    }

    // Triggers when the item expires, just before destroying it
    bool OnItemExpire(Player* player, ItemTemplate const* proto)
    {
        return true;
    }

	void addItemSet(Player *player, uint8 itemindex) {
		uint32 itemsetid = IDS[player->getClass()][itemindex];

		if (itemsetid) {
		
			for (uint32 entryId = 0; entryId < sItemSetStore.GetNumRows(); ++entryId)
			{
				ItemSetEntry const* setEntry = sItemSetStore.LookupEntry(itemsetid);
				if (!setEntry)
					continue;

				for (uint32 i = 0; i < MAX_ITEM_SET_ITEMS; ++i)
					if (setEntry->itemId[i]) {
						if (player->HasItemCount(setEntry->itemId[i], 1, true)) {//已经有一件了
							continue;
						}
						ItemPosCountVec dest;
						InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, setEntry->itemId[i], 1);
						if (msg == EQUIP_ERR_OK)
						{
							Item* item = player->StoreNewItem(dest, setEntry->itemId[i], true);

							// remove binding (let GM give it to another player later)

							//player->SendNewItem(item, 1, false, true);
							player->SendNewItem(item, 1, true, false);
							PSendSysMessage(player, u8"[系统消息]:%s 已经添加到你包中", item->GetTemplate()->Name1.c_str());
						}
						else
						{
							player->SendEquipError(msg, nullptr, nullptr, setEntry->itemId[i]);
							PSendSysMessage(player, u8"[系统消息]:请保持包包有足够空间");
							//PSendSysMessage(LANG_ITEM_CANNOT_CREATE, pProto->ItemId, 1);
						}
						//itemSetItems.insert(setEntry->itemId[i]);
					}
			}

		}
	}

	bool simpleAction(Player *player, MenuTree & tree, uint32 action) {
		uint32 accID = player->GetSession()->GetAccountId();
		uint32 mypoint = sPzxMgr->getMyPoint(accID);
		uint32 needval = tree.needval;


		if (mypoint < needval) {//点数不够
			PSendSysMessage(player, u8"[系统消息]:你当前点数[|cff00ff00%d|h|r]不够支付", mypoint);
			return false;
		}
		//TODO 修改数据库并且增加时长
		if (needval == 0 || sPzxMgr->cutPoints(needval, accID)) {//如果是免费的
			if (needval > 0)
				PSendSysMessage(player, u8"[系统消息]:系统扣减[|cffff0000%d|h|r]后剩余[|cff00ff00%d|h|r]赞助点。", needval, sPzxMgr->getMyPoint(accID));
			switch (tree.type)
			{
			case 7: //鸟点
				player->SetTaxiCheater(true);
				player->SaveToDB(true,false);
				PSendSysMessage(player, u8"[系统消息]:您的鸟点已经临时全部打开");
				break;
			case 8://地图全开
			{
				for (uint8 i = 0; i < PLAYER_EXPLORED_ZONES_SIZE; ++i)
				{
					player->SetFlag(PLAYER_EXPLORED_ZONES_1 + i, 0xFFFFFFFF); //开
																			  //player->SetFlag(PLAYER_EXPLORED_ZONES_1 + i, 0); //关
				}
				player->SaveToDB(true, true);
				PSendSysMessage(player, u8"[系统消息]:您的地图已经全部探索完成");
			}
			break;
			case 9://重命角色名
				player->SetAtLoginFlag(AT_LOGIN_RENAME);
				player->SaveToDB(true, true);
				PSendSysMessage(player, u8"[系统消息]:请退回人物界面再做变更");
				//player->GetSession()->LogoutPlayer(false);
				break;
			case 10://更换种族
			{
				player->SetAtLoginFlag(AT_LOGIN_CHANGE_RACE);
				player->SaveToDB(true, true);
				PSendSysMessage(player, u8"[系统消息]:请退回人物界面再做变更");
				//player->GetSession()->LogoutPlayer(false);
			}
			case 11://更换造型
			{
				player->SetAtLoginFlag(AT_LOGIN_CUSTOMIZE);
				player->SaveToDB(true, true);
				PSendSysMessage(player, u8"[系统消息]:请退回人物界面再做变更");
				//player->GetSession()->LogoutPlayer(false);
			}
			break;
			case 12://更换阵营
			{
				player->SetAtLoginFlag(AT_LOGIN_CHANGE_FACTION);
				player->SaveToDB(true, false);
				PSendSysMessage(player, u8"[系统消息]:请退回人物界面再做变更");
				//player->GetSession()->LogoutPlayer(false);
			}

			break;
			case 13://提升宠物等级
			{
				Pet* pet = player->GetPet();
				if (pet && pet->IsAlive()) {
					if (pet->getPetType() == HUNTER_PET) {
						Pet* HunterPet = player->GetPet();
						if (HunterPet->getLevel() < 80 /*|| HunterPet->getLoyaltyLevel() < LoyaltyLevel(BEST_FRIEND)*/) {

							player->GetPet()->GivePetLevel(80);
						}
						else {
							PSendSysMessage(player, u8"[系统消息]:|cff0000ff 您的宠物忠诚度已经提升完成!|h|r");
						}
					}
				}
				else {
					PSendSysMessage(player, u8"[系统消息]:请先|cffff0000 驯服或者召唤出|h|r一只要强化的宠物");
				}
				
			}
			break;
			case 14://免费-提升到60级+T0套装
			{
				////player->LearnSpell(33389, false);
				//ObjectGuid target_guid;
				//if (player->GetLevel() < 60) {
				//	player->GiveLevel(60);
				//	player->InitTalentForLevel();
				//}
				//player->SetUInt32Value(PLAYER_XP, 0);
				//player->UpdateSkillsToMaxSkillsForLevel();
				//addItemSet(player, 0);//增加T1套装
			}

			break;

			default:
				break;
			}

		}
		else {//扣减异常
			PSendSysMessage(player, u8"[系统消息]:|cffff0000您赞助点系统异常，请联系GM-1008|h|r]");
		}

		return true;

	}

    // Triggers when the player selects an option from the gossip menu assigned to the item
    void OnGossipSelect(Player* player, Item* item, uint32 sender, uint32 action)
    {
		ClearGossipMenuFor(player);
		sLog->outString("[pzx] OnGossipSelect action=%u", action);
		switch (action)
		{
		case 999:
			sPzxMgr->Reload();
            sConfigMgr->Reload();
			player->CLOSE_GOSSIP_MENU();
			return;
		case 100:
			showMenu(player, item);
			return ;
		default:
			break;
		}
			

		CharaMenuMap allmap = sPzxMgr->allMenu;
		CharaMenuMap::const_iterator got = allmap.find(action);
		if (got != allmap.end()) {
			MenuTree getTree = got->second;
			CharaMenuMap mmap = getTree.children;
			uint32 newActionID = getTree.id;
			if (mmap.size() > 0) {//涵盖子菜单
				player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, item->GetGUID());
				CharaMenuMap::iterator it;
				for (it = mmap.begin(); it != mmap.end(); it++) {

					uint32 id = it->first;
					MenuTree tree = it->second;
					uint32 raceMask = tree.racemask;
					if (raceMask && ((player->getRaceMask()&raceMask) == 0)) {
						continue;
					}
					//TODO 此处不坚持union项
					string name = changeName(tree.name, player, &tree);//菜单名字
					if (tree.popMenu) {//弹出确认框,用小姨子做语言提升
						player->ADD_GOSSIP_ITEM_EXTENDED(tree.iconID, name.c_str(), GOSSIP_SENDER_MAIN, id, tree.xyz, 0,false);
					}
					else {
						if (tree.unionID) {
							if (sPzxMgr->getAcctType(player->GetSession()->GetAccountId(), tree.unionID) == 0)//第一次开通（没开通过），有抽奖
								player->ADD_GOSSIP_ITEM(tree.iconID, name.c_str(), GOSSIP_SENDER_MAIN, id);
						}
						else {
							player->ADD_GOSSIP_ITEM(tree.iconID, name.c_str(), GOSSIP_SENDER_MAIN, id);
						}
					}
				}
				player->ADD_GOSSIP_ITEM(0, u8"返回主菜单", GOSSIP_SENDER_MAIN, 100);
				player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, item->GetGUID());
				return ;
			}
			else {//动作菜单
				  //0菜单, 1开关节点，2购买物品，3增加时长，4学习技能, 5传送地点
				switch (getTree.type)
				{
				case 2://购买物品
					cutPointAndAddItem(player, getTree.itemid, getTree.needval, getTree.item_count);
					break;
				case 3://增加时长
					modifyTimeLength(player, getTree.itemid, getTree.needval, action);
					break;
				case 4://学习商业技能
					cutPointAndlearnSpell(player, getTree.itemid, getTree.needval, action);
					break;
				case 5:
					teleToPoint(player, getTree.xyz, getTree.needval);
					break;
				case 9:
				case 10:
				case 11:
				case 12:
				case 16://转服功能

					if (simpleAction(player, getTree, action))//鸟点功能和角色功能
					{
						return; //因为要返回到人物列表
					}
					break;
				default:
					break;
				}

				player->CLOSE_GOSSIP_MENU();
			}
		}
		else {//没有子菜单
			player->CLOSE_GOSSIP_MENU();
		}
		player->CLOSE_GOSSIP_MENU();
       // return true;
    }

    // Same as before, but this time the option has a code assigned
    void OnGossipSelectCode(Player* player, Item* item, uint32 sender, uint32 action, const char* code)
    {
		ClearGossipMenuFor(player);
		sLog->outString("[pzx] OnGossipSelectCode action=%u,code=%s", action,code);
		if (action == 1001) {
			/*	if (!player->HasItemCount(sPzxConfig.GetIntDefault("vipItemID", 40003), 1, true)) {
			PSendSysMessage(player, u8"[系统消息]:需要VIP认证卡才可以使用本功能，请联系GM获取");
			player->CLOSE_GOSSIP_MENU();

			return false;
			}*/
			sLog->outString("[pzx] get Input str =%s", code);
			uint32 getItemID;
			try {
				getItemID = std::stoi(code);
				if (getItemID <= 0) {
					PSendSysMessage(player, u8"[系统消息]:请输入正确的物品ID");
					player->CLOSE_GOSSIP_MENU();
					return;
				}
			}
			catch (...) {
				PSendSysMessage(player, u8"[系统消息]:请输入正确的物品ID");
				player->CLOSE_GOSSIP_MENU();
				return;
			}

			ItemTemplateContainer const* its = sObjectMgr->GetItemTemplateStore();
			for (ItemTemplateContainer::const_iterator itr = its->begin(); itr != its->end(); ++itr)
			{
				if (itr->second.ItemId == getItemID)
				{
					if (itr->second.Quality< sConfigMgr->GetIntDefault("item.quality", ITEM_QUALITY_LEGENDARY))
					{
						if (player->HasItemCount(getItemID, 1, true)) {//已经有一件了
							PSendSysMessage(player, u8"[系统消息]:该物品唯一");
						}
						ItemPosCountVec dest;
						InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, getItemID, 1);
						if (msg == EQUIP_ERR_OK)
						{
							Item* item = player->StoreNewItem(dest, getItemID, true);
							player->SendNewItem(item, 1, true, false);
							PSendSysMessage(player, u8"[系统消息]:%s 已经添加到你包中", item->GetTemplate()->Name1.c_str());
						}
						else
						{
							player->SendEquipError(msg, nullptr, nullptr, getItemID);
							PSendSysMessage(player, u8"[系统消息]:请保持包包有足够空间");
						}
					}
					else {
						PSendSysMessage(player, u8"[系统消息]:获取物品等级过高，请联系GM");
						
					}
					player->CLOSE_GOSSIP_MENU();
					return;
				}

			}

			PSendSysMessage(player, u8"[系统消息]:物品未找到");

		}

		player->CLOSE_GOSSIP_MENU();
		return;
    }
};

void AddSC_item_example()
{
	//if (!sPzxConfig->LoadInitial("pzx.conf")) {
	//	sLog->outError(u8"未找到pzx.conf");
	//}
	sPzxMgr->Reload();
	sPzxMgr->startSynDB();//启动定时任务
    new item_example();
}
