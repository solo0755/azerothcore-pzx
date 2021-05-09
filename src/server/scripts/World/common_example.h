#pragma once
#include "Define.h"
#include "SharedDefines.h"
#include "ScriptMgr.h"
#include "Group.h"
#include "Config.h"
#include "PzxMgr.h"
#include "Pet.h"
#include "Chat.h"
#include "Player.h"
#include "ScriptedGossip.h"
#include  "Log.h"
#include <regex>

//0.5~2.5,勇士、督军 
const uint32 IDS[13][7] =
{
	{ 0,0, 0, 0, 0, 0 ,0 },
	{ 189,511, 209, 218,496,474 ,523 },//CLASS_WARRIOR
	{ 188, 516, 208, 217,505,475 ,528 },//CLASS_PALADIN
	{ 186, 515, 206, 215,509,477,530 },//CLASS_HUNTER
	{ 184,512, 204, 213,497,478,524 },//CLASS_ROGUE
	{ 182,514, 202, 211,507,480,525 },//CLASS_PRIEST
	{ 0,0, 0, 0, 0, 0 ,0 },
	{ 187,519, 207, 216,501,476,527 },//CLASS_SHAMAN
	{ 181, 517, 201, 210 ,503,482,526 },//CLASS_MAGE
	{ 183, 518, 203, 212 ,499,481,529 },//CLASS_WARLOCK
	{ 0,0, 0, 0 , 0, 0,0 },
	{ 185,513, 205, 214 ,493,479,521 },//CLASS_DRUID
};

char * const ItemQualityColorsStr[MAX_ITEM_QUALITY] = {
	"|cff9d9d9d",        // GREY
	"|cffffffff",        // WHITE
	"|cff1eff00",        // GREEN
	"|cff0070dd",        // BLUE
	"|cffa335ee",        // PURPLE
	"|cffff8000",        // ORANGE
	"|cffe6cc80"        // LIGHT YELLOW
};
//void outputItemColorFormat(Player* player, ostringstream& itemret, uint32 itemID, const char* format);

