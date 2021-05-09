
#include <ace/Recursive_Thread_Mutex.h>
#include <ace/Singleton.h>
#include "ace/Configuration_Import_Export.h"
#include "Database/DatabaseEnv.h"
#include "Configuration/Config.h"

struct MenuTree
{
	uint32 id;
	uint32 pid;
	std::string name;
	uint32 unionID;//互斥编号
	uint32 needval;
	uint32 type; //菜单类型：0菜单,1开关节点，2购买物品，3增加时长，4学习技能,5传送地点
	uint32 racemask;//种族掩码
	uint32 itemid;//物品ID
	uint32 item_count;//物品数量
	std::string   xyz; //坐标位置
					   //uint32 spellid; //技能ID
					   //uint32 timeLength; //时长
	uint32 unioncheck; //互斥开关
	uint32 popMenu; //是否是弹出框
	uint32 iconID; //是否是弹出框
	std::map<uint32, MenuTree> children;

};

enum GmOnOffOptions //内存开光
{
	GMOPTIONS_O1 = 0,//
	GMOPTIONS_O2 = 1, //
	GMOPTIONS_O3 = 2, //
	GMOPTIONS_O4 = 3 //
};

#define MAX_GmOnOffOptions 4

struct AccountPoint {
	uint32 id;
	uint32 idx;
	int32 val;

};
typedef std::map<uint32, AccountPoint> AccountPointMap;
typedef std::map<uint32, MenuTree> CharaMenuMap;
typedef std::map<uint32, int32> _AccountPointMap;

class PzxMgr
{
public:
	bool startLienster = false;
	CharaMenuMap treeMenu;
	CharaMenuMap allMenu;
	AccountPointMap accountPMap;
	int32 m_GMONOFFOPTONS[MAX_GmOnOffOptions] = { 0 };
	std::map<uint32, std::map<uint32, uint64>> tfTimeMap;
	std::map<uint32, std::set<uint32>> acctTypeMap;
	friend class ACE_Singleton<PzxMgr, ACE_Thread_Mutex>;
	bool Reload();
	void loadAllTimes();
	uint32 getMyPoint(uint32 accountID);
	bool updateTime(uint32 type, uint32 guid, uint32 accid, uint64 time);
	bool cutPoints(int cutPoint, uint32 accountID);
	bool addPoints(uint32 cutPoint, uint32 accountID);
	void startSynDB();
	CharaMenuMap loadAllMenu(uint32 pid);
	MenuTree getTreeByID(uint32 pid);
	bool isTimeOut(uint32 guid, uint32 type);
	uint64 getTimeLength(uint32 guid, uint32 type);
	bool getAcctType(uint32 accid, uint32 type);
	void loadAllPonits();
	static void thread_start(PzxMgr* arg);
	static PzxMgr* Instance();
};

#define sPzxMgr PzxMgr::Instance()
