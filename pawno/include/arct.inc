/*
Anti car troll include by RogueDrifter Jan 15th 2018
-=-=-=-=-=-
Last Updated : 2018 Feb 22nd
-=-=-=-=-=-=-=-=-
Callback:
-=-=-=-=-
OnPlayerCarTroll(playerid, vehicleid, trolledid, trolltype);
-=-=-=-=-=-=-=-=--=-=-=-=
Type 1: Teleporting between vehicles (can give cheaters chance to control other's players).
Type 2: Control other player's cars or spin/rotate (Done by checking the player's actual vehicle).
Type 3: Fast kick/rotate or teleporting inside drivers.
Type 4: Teleporting inside a vehicle illegally (without PutPlayerInVehicle or OnPlayerEnterVehicle).
Type 5: Remote jacking a vehicle.
*/
 
#if defined _AntiCarTroll_included
    #endinput
#endif
 
#define _AntiCarTroll_included
 
#include <a_samp>
 
#if !defined FILTERSCRIPT
 
new SafeTimer;
 
enum ActPData
{
    bool:ActAntiSpam,
    bool:AntiJackBug,
    bool:IsDPaused,
    bool:ActProtectFalse,
    bool:ActProtectPos,
    

    Float:ActPX,
    Float:ActPY,
    Float:ActPZ,

    ActRemoteJack,
    pVehicleID,
    pPauseTick,
    ActOVeh,

    ActTCheck,
    ActTimer,
    ResetTAct

};
 
enum ActVData
{
    VehicleTempOwner,
    bool:VehicleTaken
};
 
new
    ActPlayer[MAX_PLAYERS][ActPData],
    ActVehicle[MAX_VEHICLES][ActVData];
 
#if !defined IsValidVehicle
native IsValidVehicle(vehicleid); // Unlock the hidden native
#endif

forward ActPutPlayerInVehicle(playerid, vehicleid, seatid);
forward ActSetPlayerPos(playerid, Float:x, Float:y, Float:z);

forward ActRPosP(playerid);
forward ActResetPos(playerid);
forward ActRelease(playerid);
forward ActResetSpam(playerid);
forward ActFixPPIV(playerid, vehicleid, seatid);
forward SafeReset();
forward AntiCarTroll(playerid);
forward ActReset(playerid);
forward sActReset(playerid);
forward ActDelay(playerid);
 
#if defined OnPlayerEnterVehicleACT
forward OnPlayerEnterVehicleACT(playerid, vehicleid, ispassenger);
#endif
 
#if defined OnPlayerUpdateACT
    forward OnPlayerUpdateACT(playerid);
#endif


#if defined OnPlayerConnectACT
forward OnPlayerConnectACT(playerid);
#endif
 
#if defined OnPlayerDisconnectACT
forward OnPlayerDisconnectACT(playerid, reason);
#endif
 
#if defined OnPlayerExitVehicleACT
forward OnPlayerExitVehicleACT(playerid, vehicleid);
#endif

#if defined OnPlayerDeathACT
forward OnPlayerDeathACT(playerid, killerid, reason);
#endif
 
#if defined OnPlayerStateChangeACT
forward OnPlayerStateChangeACT(playerid,newstate,oldstate);
#endif
 
#if defined OnGameModeInitACT
forward OnGameModeInitACT();
#endif
 
#if defined OnGameModeExitACT
forward OnGameModeExitACT();
#endif

#if defined OnPlayerSpawnAct
    forward OnPlayerSpawnAct(playerid);
#endif

public OnGameModeInit()
{
        print("     [[--|| rACT V8.0 ||--]]     ");
        print("     [[--|| Anti car troll by RogueDrifter V 8.0 ||--]]      ");
        print("     [[--|| Successfully Loaded! ||--]]      ");
        SafeTimer = SetTimer("SafeReset",5000,true);

        #if defined OnGameModeInitACT
        return OnGameModeInitACT();
        #else
        return 1;
            #endif
}
 
public OnGameModeExit()
{
    KillTimer(SafeTimer);

    #if defined OnGameModeExitACT
        return OnGameModeExitACT();
        #else
        return 1;
            #endif
}
 
#if defined ManualUse
stock rAct_Detected(playerid, vehicleid, trolledid, trolltype)
{
    #if !defined ManualUse
    new pName[MAX_PLAYER_NAME],actmsg[80];
    GetPlayerName(playerid,pName,sizeof(pName));
    #endif
    #if defined Extreme_Safe
    SetPlayerHealth(playerid,0);
    format(actmsg,sizeof(actmsg),".: Server has scanned %s for Car Troll Cheats :.",pName);
    SendClientMessageToAll(0xAA3333AA,actmsg);
    #endif
    #if defined ManualUse
    #if defined OnPlayerCarTroll
    OnPlayerCarTroll(playerid,vehicleid, trolledid, trolltype);
    #endif
    #else
    #if defined BanVersion
    format(actmsg,sizeof(actmsg),".: Server has banned %s, reason: Car Troll Cheats :.",pName);
    #else
    format(actmsg,sizeof(actmsg),".: Server has kicked %s, reason: Car Troll Cheats :.",pName);
    #endif
    #endif
    #if !defined ManualUse
    SendClientMessageToAll(0xFF0000A,actmsg);
    SetTimerEx("ActDelay",250,false,"d",playerid);
    #endif
    return 1;
}

#else

stock rAct_Detected(playerid)
{
    new pName[MAX_PLAYER_NAME],actmsg[80];
    GetPlayerName(playerid,pName,sizeof(pName));
    #if defined Extreme_Safe
    SetPlayerHealth(playerid,0);
    format(actmsg,sizeof(actmsg),".: Server has scanned %s for Car Troll Cheats :.",pName);
    SendClientMessageToAll(0xAA3333AA,actmsg);
    #endif
    #if defined BanVersion
    format(actmsg,sizeof(actmsg),".: Server has banned %s, reason: Car Troll Cheats :.",pName);
    #else
    format(actmsg,sizeof(actmsg),".: Server has kicked %s, reason: Car Troll Cheats :.",pName);
    #endif
    SendClientMessageToAll(0xFF0000A,actmsg);
    SetTimerEx("ActDelay",250,false,"d",playerid);
    return 1;
}
#endif

stock IsPEnExCar(playerid)
{
    switch(GetPlayerAnimationIndex(playerid))
    {
        case 1010..1012: return 1;
        case 1024..1025: return 1;
        case 1043..1045: return 1;
        case 1009: return 1;
        case 1041: return 1;
        }
    return 0;
}

stock ActPlayerDown(playerid)
{
    switch(GetPlayerAnimationIndex(playerid))
    {
        case 1208..1209: return 1;
        case 1155..1156: return 1;
    }
    return 0;
}

stock ActCarEmpty(vehicleid)
{
    for(new i, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(!IsPlayerConnected(i)) continue;
        if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i) && GetPlayerVehicleID(i) == vehicleid) return 0;
        }
    return 1;
}

public ActResetPos(playerid) return GetPlayerPos(playerid, ActPlayer[playerid][ActPX], ActPlayer[playerid][ActPY], ActPlayer[playerid][ActPZ]);

public SafeReset()
{
    new AllVehicles[MAX_VEHICLES];
    for(new i, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(!IsPlayerConnected(i)) continue;
        new gpVehicleID[MAX_PLAYERS];
        gpVehicleID[i] = GetPlayerVehicleID(i);
        if(GetPlayerState(i)== PLAYER_STATE_DRIVER && AllVehicles[gpVehicleID[i]] != i )
        {
            AllVehicles[gpVehicleID[i]]= i;
            ActVehicle[GetPlayerVehicleID(i)][VehicleTaken]= true;
            }
        }
    for(new x; x<MAX_VEHICLES; x++)
    {
        if(!IsValidVehicle(x)) continue;
        if(AllVehicles[x] != -1)
        {
            if(GetPlayerState(AllVehicles[x]) != PLAYER_STATE_DRIVER) AllVehicles[x] = -1;
            }
        if(AllVehicles[x] == -1 && ActVehicle[x][VehicleTaken]) ActVehicle[x][VehicleTaken]= false;
        }
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    if(!ispassenger) ActPlayer[playerid][ActOVeh] = vehicleid, ActPlayer[playerid][ActRemoteJack] = 1;
    if(!ActPlayer[playerid][ActProtectFalse]) ActPlayer[playerid][ActProtectFalse] = true;
    for(new i, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(!IsPlayerConnected(i)) continue;
        if(!ispassenger && !ActPlayer[playerid][AntiJackBug] && i != playerid && GetPlayerVehicleID(i) == vehicleid && GetPlayerState(i) == PLAYER_STATE_DRIVER)
        {
            ActPlayer[playerid][AntiJackBug]=true;
            SetTimerEx("sActReset",6000,false,"d",playerid);
            ActPlayer[i][AntiJackBug]=true;
            SetTimerEx("sActReset",6000,false,"d",i);
            }
        }

        #if defined OnPlayerEnterVehicleACT
        return OnPlayerEnterVehicleACT(playerid, vehicleid, ispassenger);
        #else
        return 1;
            #endif
}
 
public OnPlayerConnect(playerid)
{
    ActPlayer[playerid][ActAntiSpam]=false;
    ActPlayer[playerid][AntiJackBug]=false;

    ActPlayer[playerid][ActTimer] = SetTimerEx("ActResetPos", 1000, true, "d", playerid);
    ActPlayer[playerid][ActTCheck] = SetTimerEx("AntiCarTroll", 250, true, "d", playerid);

    ActPlayer[playerid][ActPX] = 0;
    ActPlayer[playerid][ActPY] = 0;
    ActPlayer[playerid][ActPZ] = 0;

        #if defined OnPlayerConnectACT
        return OnPlayerConnectACT(playerid);
        #else
        return 1;
            #endif
}
 
public AntiCarTroll(playerid)
{
    if(GetPlayerState(playerid) == 2 || GetPlayerState(playerid) == 3)
    {
        new ActVeh = GetPlayerVehicleID(playerid);
        if(ActVeh != ActPlayer[playerid][ActOVeh] && !ActPlayer[playerid][ActProtectFalse] && !ActPlayer[playerid][ActAntiSpam])
        {            
            ActPlayer[playerid][ActAntiSpam]=true;
            SetTimerEx("ActResetSpam",2500,false,"d",playerid);
            #if defined ManualUse
            rAct_Detected(playerid, ActVeh, INVALID_PLAYER_ID, 1);
            #else
            rAct_Detected(playerid);
            #endif
            SetVehicleToRespawn(ActVeh);
            ActPlayer[playerid][ActOVeh] = ActVeh;
            }
        }

    if(GetTickCount() > (ActPlayer[playerid][pPauseTick]+4000) && !ActPlayer[playerid][IsDPaused]) ActPlayer[playerid][IsDPaused] = true;
    else if(ActPlayer[playerid][IsDPaused]) ActPlayer[playerid][IsDPaused] = false;

    for(new i = 0; i < MAX_VEHICLES; i++)
    {
    if(!IsValidVehicle(i)) continue;
    if(ActVehicle[i][VehicleTaken] && GetPlayerVehicleID(playerid) == i && playerid != ActVehicle[i][VehicleTempOwner] 
    && !ActPlayer[playerid][AntiJackBug] && !ActPlayer[ActVehicle[i][VehicleTempOwner]][AntiJackBug] 
    && GetPlayerState(playerid) == PLAYER_STATE_DRIVER  && !IsPEnExCar(playerid) 
    && !ActPlayer[ActVehicle[i][VehicleTempOwner]][IsDPaused] && !ActPlayer[playerid][ActAntiSpam])
    {
        ActPlayer[playerid][ActAntiSpam]=true; 
        SetTimerEx("ActResetSpam",2500,false,"d",playerid);
        #if defined ManualUse
        rAct_Detected(playerid, i, ActVehicle[i][VehicleTempOwner], 2);
        #else
        rAct_Detected(playerid);
        #endif
        }
    }
    return 1;
}
 
#if defined ManualUse
    #if defined OnPlayerCarTroll
 
    forward OnPlayerCarTroll(playerid,vehicleid, trolledid, trolltype);// Only use if you defined ManualUse

    #endif

#else
 
public ActDelay(playerid)
{
    #if defined BanVersion
    Ban(playerid);
    #else
    Kick(playerid);
    #endif
    return 1;
}
 
#endif
 
public ActReset(playerid)
{
    ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTaken] = false;
    ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTempOwner] = -1;
    return 1;
}
 
public sActReset(playerid)
{
    ActPlayer[playerid][AntiJackBug]=false;
    return 1;
}

public ActRelease(playerid) return TogglePlayerControllable(playerid, 1);

public OnPlayerUpdate(playerid)
{
    if(ActPlayer[playerid][ActRemoteJack] == 1)
    {
        if(GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_ENTER_VEHICLE)
        {
            ActPlayer[playerid][ActRemoteJack] = 2;
            #if defined ManualUse
            rAct_Detected(playerid,  ActPlayer[playerid][ActOVeh], INVALID_PLAYER_ID, 5);
            #else
            rAct_Detected(playerid);
            #endif
            }
        else ActPlayer[playerid][ActRemoteJack] = 2;
        }

    if(!IsPlayerInRangeOfPoint(playerid, 10.0, ActPlayer[playerid][ActPX], ActPlayer[playerid][ActPY], ActPlayer[playerid][ActPZ]) && ActPlayer[playerid][ActPX] != 0 && ActPlayer[playerid][ActPY] != 0 && ActPlayer[playerid][ActPZ] != 0)
    {
        for(new i, j = GetPlayerPoolSize(); i <= j; i++)
        {
            if(!IsPlayerConnected(i)) continue;
            new Float:ActTempX, Float:ActTempY, Float:ActTempZ;
            GetPlayerPos(i, ActTempX, ActTempY, ActTempZ);
            if(IsPlayerInRangeOfPoint(playerid, 3.0, ActTempX, ActTempY, ActTempZ) && !ActPlayer[playerid][ActProtectPos] && !ActPlayer[i][ActAntiSpam] && GetPlayerState(i) == PLAYER_STATE_DRIVER && i != playerid && GetPlayerState(playerid) == 1 && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && !ActPlayerDown(playerid))
            {
                ActPlayer[i][ActAntiSpam]=true; 
                SetVehicleToRespawn(GetPlayerVehicleID(i));
                TogglePlayerControllable(i, 0);
                SetPlayerPos(i, ActTempX, ActTempY, ActTempZ);
                SetPlayerHealth(playerid, 0.0);
                SetTimerEx("ActRelease", 1500, false, "d", i);
                SetTimerEx("ActResetSpam",1500,false,"d",i);
                #if defined ManualUse
                rAct_Detected(playerid,  GetPlayerVehicleID(i), i, 3);
                #else
                rAct_Detected(playerid);
                #endif
                }
            }
        }

    ActPlayer[playerid][pPauseTick] = GetTickCount();
    new Float:ActX, Float:ActY, Float:ActZ;
    new ActCar = GetPlayerVehicleID(playerid);

    for(new x = 0; x < MAX_VEHICLES; x++)
    {
        if(!IsValidVehicle(x) || !IsVehicleStreamedIn(x, playerid) || !ActCarEmpty(x) || x == ActCar) continue;
        GetVehiclePos(x, ActX, ActY, ActZ);
        if(IsPlayerInRangeOfPoint(playerid, 2.0, ActX, ActY, ActZ) && GetPlayerState(playerid) == 2 && ActPlayer[playerid][ActAntiSpam])
        {
            SetVehicleToRespawn(x);
            }
        }

        #if defined OnPlayerUpdateACT
        return OnPlayerUpdateACT(playerid);
        #else
        return 1;
            #endif
}

public OnPlayerSpawn(playerid)
{
    GetPlayerPos(playerid, ActPlayer[playerid][ActPX], ActPlayer[playerid][ActPY], ActPlayer[playerid][ActPZ]);

        #if defined OnPlayerSpawnAct
    return OnPlayerSpawnAct(playerid);
        #else
    return 1;
        #endif
}

public OnPlayerStateChange(playerid,newstate,oldstate)
{
    switch(newstate)
    {
        case 1:
        {
            if(oldstate == 2) ActPlayer[playerid][ResetTAct] = SetTimerEx("ActReset",500,false,"d",playerid), ActPlayer[playerid][ActRemoteJack] = 0;
            else if(oldstate ==2 || oldstate == 3) ActPlayer[playerid][ActProtectFalse] = false;
            }
 
        case 2:
        {
            ActPlayer[playerid][pVehicleID] = GetPlayerVehicleID(playerid);
            ActPlayer[playerid][ActOVeh] = ActPlayer[playerid][pVehicleID];
            for(new i, j = GetPlayerPoolSize(); i <= j; i++)
            {
                if(i != playerid && GetPlayerVehicleID(i) == ActPlayer[playerid][pVehicleID] && GetPlayerState(i) == 2 && ActPlayer[i][pPauseTick])
                {
                    new Float:ActPosX, Float:ActPosY, Float:ActPosZ;
                    GetPlayerPos(i, ActPosX, ActPosY, ActPosZ);
                    SetPlayerPos(i, ActPosX, ActPosY, ActPosZ+2);
                    }
                }
 
            if(!ActPlayer[playerid][ActProtectFalse] && GetPlayerState(playerid) != 9 && !ActPlayer[playerid][ActAntiSpam])
            {                
                ActPlayer[playerid][ActAntiSpam]=true;
                SetTimerEx("ActResetSpam",2500,false,"d",playerid);
                #if defined ManualUse
                rAct_Detected(playerid, GetPlayerVehicleID(playerid), INVALID_PLAYER_ID, 4);
                #else
                rAct_Detected(playerid);
                #endif
                }

            else if(ActPlayer[playerid][ActProtectFalse]) ActPlayer[playerid][ActProtectFalse] = false;

            if(!ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTaken])
            {
                KillTimer(ActPlayer[playerid][ResetTAct]);
                ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTaken] = true;
                ActVehicle[ActPlayer[playerid][pVehicleID]][VehicleTempOwner] = playerid;
            }
        }

    case 3:
    {
        if(!ActPlayer[playerid][ActProtectFalse] && GetPlayerState(playerid) != 9 && !ActPlayer[playerid][ActAntiSpam])
        {            
            ActPlayer[playerid][ActAntiSpam]=true;
            SetTimerEx("ActResetSpam",2500,false,"d",playerid);
            #if defined ManualUse
            rAct_Detected(playerid, GetPlayerVehicleID(playerid), INVALID_PLAYER_ID, 4);
            #else
            rAct_Detected(playerid);
            #endif
            }
        else if(ActPlayer[playerid][ActProtectFalse]) ActPlayer[playerid][ActProtectFalse] = false;
        ActPlayer[playerid][ActOVeh] = GetPlayerVehicleID(playerid);
        }
    }

        #if defined OnPlayerStateChangeACT
    return OnPlayerStateChangeACT(playerid,newstate,oldstate);
        #else
    return 1;
        #endif
}

public OnPlayerDeath(playerid, killerid, reason)
{
    ActPlayer[playerid][ActAntiSpam]=false;

    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        ActPlayer[playerid][ResetTAct] = SetTimerEx("ActReset",500,false,"d",playerid);
        }

        #if defined OnPlayerDeathACT
        return OnPlayerDeathACT(playerid, killerid, reason);
        #else
        return 1;
            #endif
}
 
public OnPlayerExitVehicle(playerid,vehicleid)
{
    ActPlayer[playerid][ResetTAct] = SetTimerEx("ActReset",500,false,"d",playerid);

    #if defined OnPlayerExitVehicleACT
        return OnPlayerExitVehicleACT(playerid, vehicleid);
        #else
        return 1;
            #endif
}
 
public OnPlayerDisconnect(playerid, reason)
{
    KillTimer(ActPlayer[playerid][ActTimer]);
    KillTimer(ActPlayer[playerid][ActTCheck]);

    new gpVehicleID;
    gpVehicleID = GetPlayerVehicleID(playerid);
 
    ActPlayer[playerid][ActProtectPos] = false;
    ActPlayer[playerid][IsDPaused] = false;
    ActPlayer[playerid][ActProtectFalse] = false;
 
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        ActVehicle[gpVehicleID][VehicleTaken] =false;
        ActVehicle[gpVehicleID][VehicleTempOwner] = -1;
        ActPlayer[playerid][ActRemoteJack] = 0;
        }

        #if defined OnPlayerDisconnectACT
        return OnPlayerDisconnectACT(playerid, reason);
        #else
        return 1;
            #endif
}
 
public ActResetSpam(playerid) return ActPlayer[playerid][ActAntiSpam]=false;

public ActFixPPIV(playerid, vehicleid, seatid) return ActPlayer[playerid][ActProtectFalse] = true, PutPlayerInVehicle(playerid, vehicleid, seatid);
 
public ActPutPlayerInVehicle(playerid, vehicleid, seatid)
{
    if(!ActPlayer[playerid][ActProtectFalse]) ActPlayer[playerid][ActProtectFalse] = true;
    if(GetPlayerState(playerid) == 2 || GetPlayerState(playerid) == 3)
    {
        new Float:PX,Float:PY,Float:PZ;
        GetPlayerPos(playerid, PX,PY,PZ);
        SetPlayerPos(playerid, PX,PY,PZ+2);
        SetTimerEx("ActFixPPIV",500,false,"iii",playerid, vehicleid, seatid);
        }
    else PutPlayerInVehicle(playerid, vehicleid, seatid);
    return 1;
}

public ActRPosP(playerid) return ActPlayer[playerid][ActProtectPos] = false;

public ActSetPlayerPos(playerid, Float:x, Float:y, Float:z)
{
    if(!ActPlayer[playerid][ActProtectPos]) SetTimerEx("ActRPosP",2100,false,"i",playerid);
    ActPlayer[playerid][ActProtectPos] = true;
    SetPlayerPos(playerid, x, y, z);
    return 1;
}

#if defined _ALS_OnPlayerStateChange
  #undef OnPlayerStateChange
#else
    #define _ALS_OnPlayerStateChange
#endif
 
#define OnPlayerStateChange OnPlayerStateChangeACT
 
#if defined _ALS_OnPlayerConnect
  #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
 
#define OnPlayerConnect OnPlayerConnectACT

#if defined _ALS_OnPlayerSpawn
  #undef OnPlayerSpawn
#else
    #define _ALS_OnPlayerSpawn
#endif
 
#define OnPlayerSpawn OnPlayerSpawnAct

#if defined _ALS_OnPlayerDisconnect
  #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
 
#define OnPlayerDisconnect OnPlayerDisconnectACT
 
#if defined _ALS_OnPlayerExitVehicle
  #undef OnPlayerExitVehicle
#else
    #define _ALS_OnPlayerExitVehicle
#endif
 
#define OnPlayerExitVehicle OnPlayerExitVehicleACT
 
#if defined _ALS_OnPlayerDeath
  #undef OnPlayerDeath
#else
    #define _ALS_OnPlayerDeath
#endif
 
#define OnPlayerDeath OnPlayerDeathACT
 
#if defined _ALS_OnGameModeInit
  #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
 
#define OnGameModeInit OnGameModeInitACT
 
#if defined _ALS_OnGameModeExit
  #undef OnGameModeExit
#else
    #define _ALS_OnGameModeExit
#endif
 
#define OnGameModeExit OnGameModeExitACT
 
#if defined _ALS_OnPlayerEnterVehicle
  #undef OnPlayerEnterVehicle
#else
    #define _ALS_OnPlayerEnterVehicle
#endif
 
#define OnPlayerEnterVehicle OnPlayerEnterVehicleACT
 
#if defined _ALS_OnPlayerUpdate
  #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif
 
#define OnPlayerUpdate OnPlayerUpdateACT
 
#if defined _ALS_PutPlayerInVehicle
  #undef PutPlayerInVehicle
#else
    #define _ALS_PutPlayerInVehicle
#endif
 
#define PutPlayerInVehicle ActPutPlayerInVehicle

#if defined _ALS_SetPlayerPos
  #undef SetPlayerPos
#else
    #define _ALS_SetPlayerPos
#endif
 
#define SetPlayerPos ActSetPlayerPos

#else //If it's a filterscript
 
#if defined _ALS_PutPlayerInVehicle
  #undef PutPlayerInVehicle
#else
    #define _ALS_PutPlayerInVehicle
#endif
 
#define PutPlayerInVehicle ActFPutPlayerInVehicle

#if defined _ALS_SetPlayerPos
  #undef SetPlayerPos
#else
    #define _ALS_SetPlayerPos
#endif
 
#define SetPlayerPos ActFSetPlayerPos

stock ActFPutPlayerInVehicle(playerid, vehicleid, seatid)

    return CallRemoteFunction("ActPutPlayerInVehicle","iii",playerid, vehicleid, seatid);

stock ActFSetPlayerPos(playerid, Float:x, Float:y, Float:z)

    return CallRemoteFunction("ActSetPlayerPos","ifff",playerid, x, y, z);

#endif