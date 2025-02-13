#if defined _OPTUD_included
    #endinput
#endif
#define _OPTUD_included

#if ! defined PAWNRAKNET_INC_
    #error You must have Pawn.Raknet include in order to use this one.
#endif

forward OnPlayerTurnUpsideDown(playerid, Float:angle);

static OPTUD_callback[MAX_PLAYERS];

/*OnIncomingPacket*/
public OnIncomingPacket(playerid, packetid, BitStream:bs)
{
    if(packetid == 0xCF)
    {
        new Float:OPTUD_w, Float:OPTUD_x, Float:OPTUD_y, Float:OPTUD_z;
        
        BS_SetReadOffset(bs, 0x98);
        
        BS_ReadValue(
            bs,
            PR_FLOAT, OPTUD_w,
            PR_FLOAT, OPTUD_x,
            PR_FLOAT, OPTUD_y,
            PR_FLOAT, OPTUD_z
        );
            
        BS_ResetReadPointer(bs);
            
        new const Float:OPTUD_angle = atan2(2 * ((OPTUD_y * OPTUD_z) + (OPTUD_w * OPTUD_x)), (OPTUD_w * OPTUD_w) - (OPTUD_x * OPTUD_x) - (OPTUD_y * OPTUD_y) + (OPTUD_z * OPTUD_z));
        
        if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_NONE) 
        {
            if((OPTUD_angle > 85.0 || OPTUD_angle < -85.0) && OPTUD_angle == OPTUD_angle)
            {
                if(gettime() > OPTUD_callback[playerid])
                {
                    OPTUD_callback[playerid] = gettime();
                    OnPlayerTurnUpsideDown(playerid, OPTUD_angle);
                }    
            }
        }
    }
    #if defined OPTUD_OnIncomingPacket
        return OPTUD_OnIncomingPacket(playerid, packetid, bs);
    #else
        return 1;
    #endif
}

/*Hooks*/
#if defined _ALS_OnIncomingPacket
#undef OnIncomingPacket
#else
#define _ALS_OnIncomingPacket
#endif
#define OnIncomingPacket OPTUD_OnIncomingPacket

#if defined OPTUD_OnIncomingPacket
forward OPTUD_OnIncomingPacket(playerid, packetid, BitStream:bs);
#endif