#include <sourcemod>
#include <sdktools>

public Plugin:myinfo =
{
  name = "Birthday Mod",
  author = "Brian Cosgrove",
  description = "Silliness for any birthday party involving CS:GO",
  version = "0.1",
  url = "https://github.com/cosgroveb/csgo_birthday/"
};

public OnPluginStart()                     
{
  HookEvent("weapon_fire", Event_WeaponFireRespondToTaser, EventHookMode_Post)
}

public OnConfigsExecuted()
{
  PrecacheSound("weapons/party_horn_01.wav");
}

public Action:Event_WeaponFireRespondToTaser(Handle:event, const String:name[], bool:dontBroadcast)
{
   decl String:weapon[64]
   GetEventString(event, "weapon", weapon, sizeof(weapon))

   if (StrEqual(weapon, "taser"))
   {
     new attackerUserId = GetEventInt(event, "userid")
     new attackerClient = GetClientOfUserId(attackerUserId)
     decl String:name[64]
     GetClientName(attackerClient, name, sizeof(name))

     decl Float:attackerOriginVec[3]
     GetClientAbsOrigin(attackerClient, attackerOriginVec)

     EmitAmbientSound("weapons/party_horn_01.wav", attackerOriginVec)

     PrintToServer("%s fired their %s. It's a party!!", name, weapon)
   }
}
