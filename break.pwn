#define Lock:%0(%1)     forward %0(%1); public %0(%1)

enum E_PLAYER_STRUCT
{
  P_SCREWDRIVER,
  P_SCREWDRIVER_SKILL
}
new g_player[MAX_PLAYERS][E_PLAYER_STRUCT] // if you use jvrp just add the "P_SCREWDRIVER" and "P_SCREWDRIVER_SKILL" on it

new anim_list[75][E_ANIM_LIST_STRUCT] =
{
  {"Membobol",				"INT_HOUSE",		"WASH_UP",				4.0, true, 0, 0, 0, 0,}
} //if you use jvrp just add the array

Lock: SuccessChance(playerid)
{
    new skill = GetPlayerData(playerid, P_SCREWDRIVER_SKILL);
    new chance = skill > 0 ? skill * 10 : 10;
    return chance > 100 ? 100 : chance;
}

Lock: DisableVehicleAlarm(playerid, vehicleid)
{
    new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    if(alarm)
    {
        SetVehicleParamsEx(vehicleid, engine, lights, VEHICLE_PARAMS_OFF, doors, bonnet, boot, objective);
    }
}

Lock: BreakVehicleKey(playerid, vehicleid)
{
    new bool:engine, bool:lights, bool:alarm, bool:doors, bool:bonnet, bool:boot, bool:objective;
    new chance = SuccessChance(playerid);
    new result = random(100) < chance;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    if(result)
    {
        new index = GetVehicleData(vehicleid, V_ACTION_ID);
        SetOwnableCarData(index, OC_KEY_IN, true);
        SetVehicleParam(vehicleid, V_LOCK, false);
        SendClientMessage(playerid, -1, "[Lockpick] You break the vehicle key");
        g_player[playerid][P_SCREWDRIVER_SKILL] ++;
        UpdatePlayerDatabaseInt(playerid, "lockpick_skill", g_player[playerid][P_SCREWDRIVER_SKILL]);
    }
    else
    {
        SetVehicleParamsEx(vehicleid, engine, lights, VEHICLE_PARAMS_ON, doors, bonnet, boot, objective);
        SendClientMessage(playerid, -1, "[Lockpick] You failed to break the key, the alarm ringin!!");
        SetTimerEx("DisableVehicleAlarm", 10000, false, "ii", playerid, vehicleid);   
    }
    TogglePlayerControllable(playerid, true);
    ClearAnimations(playerid);
    return 1;
}

CMD:lockpick(playerid)
{
    new v = GetNearestVehicleID(playerid, 2.0);
    if(GetPlayerData(playerid, P_SCREWDRIVER) == 0)
        return SendClientMessage(playerid, -1, "[Lockpick] You need screwdriver to use this command");
    if(v == INVALID_VEHICLE_ID)
        return SendClientMessage(playerid, -1, "[Lockpick] You need to be near vehicle to use this");
    TogglePlayerControllable(playerid, false);
    cmd::anim(playerid, "75");
    SetTimerEx("BreakVehicleKey", 5000, false, "ii", playerid, v);
    return 1;
}
