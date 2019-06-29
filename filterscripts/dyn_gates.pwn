#define 	FILTERSCRIPT
#include 	<a_samp>
#include    <sqlitei>
#include    <sscanf2>
#include    <streamer>
#include    <foreach>
#include    <izcmd>

#define     MAX_GATES           100
#define     GATE_PASS_LEN   	8
#define     MOVE_SPEED          (1.65)

enum    _:e_gatestates
{
	GATE_STATE_CLOSED,
	GATE_STATE_OPEN
}

enum    _:e_gatedialogs
{
	DIALOG_GATE_PASSWORD = 12250,
	DIALOG_GATE_EDITMENU,
	DIALOG_GATE_NEWPASSWORD
}

enum    e_gate
{
	GateModel,
	GatePassword[GATE_PASS_LEN],
	Float: GatePos[3],
	Float: GateRot[3],
	Float: GateOpenPos[3],
	Float: GateOpenRot[3],
	GateState,
	bool: GateEditing,
	GateObject,
	Text3D: GateLabel
}

new
	GateData[MAX_GATES][e_gate],
	Iterator: Gates<MAX_GATES>,
	EditingGateID[MAX_PLAYERS] = {-1, ...},
	EditingGateType[MAX_PLAYERS] = {-1, ...},
	bool: HasGateAuth[MAX_PLAYERS][MAX_GATES];
	
new
	GateStates[2][16] = {"{E74C3C}Kapal�", "{2ECC71}A��k"};

new
	DB: GateDB,
	DBStatement: LoadGates,
	DBStatement: AddGate,
	DBStatement: UpdateGate,
	DBStatement: RemoveGate;

stock GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
	new Float:a;
	GetPlayerPos(playerid, x, y, a);
	GetPlayerFacingAngle(playerid, a);
	if (GetPlayerVehicleID(playerid))
	{
	    GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	}
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
}

stock GetClosestGate(playerid, Float: range = 5.0)
{
	new id = -1 /*Float: playerdist, Float: tempdist = 9999.0*/;
	foreach(new i : Gates)
	{
        //playerdist = GetPlayerDistanceFromPoint(playerid, GateData[i][GatePos][0], GateData[i][GatePos][1], GateData[i][GatePos][2]);
        //if(playerdist > range) continue;
	    //if(playerdist <= tempdist)
	    //{
	        //tempdist = playerdist;
	        //id = i;
	    //}
	    if(IsPlayerInRangeOfPoint(playerid, range, GateData[i][GatePos][0], GateData[i][GatePos][1], GateData[i][GatePos][2]))
	    {
	        id = i;
	        break;
	    }
	}
	return id;
}

stock SetGateState(id, gate_state, move = 1)
{
    new string[32];
    //format(string, sizeof(string), "Gate #%d\n%s", id, GateStates[gate_state]);
	format(string, sizeof(string), " ");
	UpdateDynamic3DTextLabelText(GateData[id][GateLabel], 0xECF0F1FF, string);
	GateData[id][GateState] = gate_state;
	
	switch(move)
	{
	    case 1:
	    {
	        if(gate_state == GATE_STATE_CLOSED) {
	        	MoveDynamicObject(GateData[id][GateObject], GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2], MOVE_SPEED, GateData[id][GateRot][0], GateData[id][GateRot][1], GateData[id][GateRot][2]);
			}else{
                MoveDynamicObject(GateData[id][GateObject], GateData[id][GateOpenPos][0], GateData[id][GateOpenPos][1], GateData[id][GateOpenPos][2], MOVE_SPEED, GateData[id][GateOpenRot][0], GateData[id][GateOpenRot][1], GateData[id][GateOpenRot][2]);
			}
		}

		case 2:
		{
		    if(gate_state == GATE_STATE_CLOSED) {
	        	SetDynamicObjectPos(GateData[id][GateObject], GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2]);
				SetDynamicObjectRot(GateData[id][GateObject], GateData[id][GateRot][0], GateData[id][GateRot][1], GateData[id][GateRot][2]);
			}else{
                SetDynamicObjectPos(GateData[id][GateObject], GateData[id][GateOpenPos][0], GateData[id][GateOpenPos][1], GateData[id][GateOpenPos][2]);
				SetDynamicObjectRot(GateData[id][GateObject], GateData[id][GateOpenRot][0], GateData[id][GateOpenRot][1], GateData[id][GateOpenRot][2]);
			}
		}
	}
	
	return 1;
}

stock ToggleGateState(id, move = 1)
{
	if(GateData[id][GateState] == GATE_STATE_CLOSED) {
	    SetGateState(id, GATE_STATE_OPEN, move);
	}else{
	    SetGateState(id, GATE_STATE_CLOSED, move);
	}
	
	return 1;
}

stock ShowEditMenu(playerid, id)
{
    new string[128];
	format(string, sizeof(string), "Gate Durumu\t%s\nGate �ifresi\t%s\nGate Pozisyonu\nGate A��laca�� Pozisyon\nGateyi Sil", GateStates[ GateData[id][GateState] ], GateData[id][GatePassword]);
	ShowPlayerDialog(playerid, DIALOG_GATE_EDITMENU, DIALOG_STYLE_TABLIST, "Gate D�zenleme", string, "Se�", "�ptal");
	return 1;
}

stock SaveGate(id)
{
    stmt_bind_value(UpdateGate, 0, DB::TYPE_STRING, GateData[id][GatePassword]);
	stmt_bind_value(UpdateGate, 1, DB::TYPE_FLOAT, GateData[id][GatePos][0]);
	stmt_bind_value(UpdateGate, 2, DB::TYPE_FLOAT, GateData[id][GatePos][1]);
	stmt_bind_value(UpdateGate, 3, DB::TYPE_FLOAT, GateData[id][GatePos][2]);
	stmt_bind_value(UpdateGate, 4, DB::TYPE_FLOAT, GateData[id][GateRot][0]);
	stmt_bind_value(UpdateGate, 5, DB::TYPE_FLOAT, GateData[id][GateRot][1]);
	stmt_bind_value(UpdateGate, 6, DB::TYPE_FLOAT, GateData[id][GateRot][2]);
	stmt_bind_value(UpdateGate, 7, DB::TYPE_FLOAT, GateData[id][GateOpenPos][0]);
	stmt_bind_value(UpdateGate, 8, DB::TYPE_FLOAT, GateData[id][GateOpenPos][1]);
	stmt_bind_value(UpdateGate, 9, DB::TYPE_FLOAT, GateData[id][GateOpenPos][2]);
	stmt_bind_value(UpdateGate, 10, DB::TYPE_FLOAT, GateData[id][GateOpenRot][0]);
	stmt_bind_value(UpdateGate, 11, DB::TYPE_FLOAT, GateData[id][GateOpenRot][1]);
	stmt_bind_value(UpdateGate, 12, DB::TYPE_FLOAT, GateData[id][GateOpenRot][2]);
	stmt_bind_value(UpdateGate, 13, DB::TYPE_INTEGER, id);
	stmt_execute(UpdateGate);
	return 1;
}

public OnFilterScriptInit()
{
	GateDB = db_open("dyn_gates.db");
    db_query(GateDB, "CREATE TABLE IF NOT EXISTS gates (id INTEGER, model INTEGER, password TEXT, def_posx FLOAT, def_posy FLOAT, def_posz FLOAT, def_rotx FLOAT, def_roty FLOAT, def_rotz FLOAT, open_posx FLOAT, open_posy FLOAT, open_posz FLOAT, open_rotx FLOAT, open_roty FLOAT, open_rotz FLOAT)");

	LoadGates = db_prepare(GateDB, "SELECT * FROM gates");
    AddGate = db_prepare(GateDB, "INSERT INTO gates (id, model, password, def_posx, def_posy, def_posz) VALUES (?, ?, ?, ?, ?, ?)");
    UpdateGate = db_prepare(GateDB, "UPDATE gates SET password=?, def_posx=?, def_posy=?, def_posz=?, def_rotx=?, def_roty=?, def_rotz=?, open_posx=?, open_posy=?, open_posz=?, open_rotx=?, open_roty=?, open_rotz=? WHERE id=?");
	RemoveGate = db_prepare(GateDB, "DELETE FROM gates WHERE id=?");
	
	new id, model, password[GATE_PASS_LEN], Float: pos[3], Float: rot[3], Float: openpos[3], Float: openrot[3];
	stmt_bind_result_field(LoadGates, 0, DB::TYPE_INTEGER, id);
    stmt_bind_result_field(LoadGates, 1, DB::TYPE_INTEGER, model);
    stmt_bind_result_field(LoadGates, 2, DB::TYPE_STRING, password, GATE_PASS_LEN);
	stmt_bind_result_field(LoadGates, 3, DB::TYPE_FLOAT, pos[0]);
	stmt_bind_result_field(LoadGates, 4, DB::TYPE_FLOAT, pos[1]);
	stmt_bind_result_field(LoadGates, 5, DB::TYPE_FLOAT, pos[2]);
	stmt_bind_result_field(LoadGates, 6, DB::TYPE_FLOAT, rot[0]);
	stmt_bind_result_field(LoadGates, 7, DB::TYPE_FLOAT, rot[1]);
	stmt_bind_result_field(LoadGates, 8, DB::TYPE_FLOAT, rot[2]);
	stmt_bind_result_field(LoadGates, 9, DB::TYPE_FLOAT, openpos[0]);
	stmt_bind_result_field(LoadGates, 10, DB::TYPE_FLOAT, openpos[1]);
	stmt_bind_result_field(LoadGates, 11, DB::TYPE_FLOAT, openpos[2]);
	stmt_bind_result_field(LoadGates, 12, DB::TYPE_FLOAT, openrot[0]);
	stmt_bind_result_field(LoadGates, 13, DB::TYPE_FLOAT, openrot[1]);
	stmt_bind_result_field(LoadGates, 14, DB::TYPE_FLOAT, openrot[2]);

	if(stmt_execute(LoadGates))
	{
	    new label[32];
	    while(stmt_fetch_row(LoadGates))
	    {
            GateData[id][GateModel] = model;
			GateData[id][GatePassword] = password;
			GateData[id][GatePos][0] = pos[0];
			GateData[id][GatePos][1] = pos[1];
			GateData[id][GatePos][2] = pos[2];
			GateData[id][GateRot][0] = rot[0];
			GateData[id][GateRot][1] = rot[1];
			GateData[id][GateRot][2] = rot[2];
			GateData[id][GateOpenPos][0] = openpos[0];
			GateData[id][GateOpenPos][1] = openpos[1];
			GateData[id][GateOpenPos][2] = openpos[2];
			GateData[id][GateOpenRot][0] = openrot[0];
			GateData[id][GateOpenRot][1] = openrot[1];
			GateData[id][GateOpenRot][2] = openrot[2];
			
			// format(label, sizeof(label), "Gate #%d\n%s", id, GateStates[GATE_STATE_CLOSED]);
			format(label, sizeof(label), " ");
			GateData[id][GateObject] = CreateDynamicObject(model, pos[0], pos[1], pos[2], rot[0], rot[1], rot[2]);
			GateData[id][GateLabel] = CreateDynamic3DTextLabel(label, 0xECF0F1FF, pos[0], pos[1], pos[2], 10.0);
			Iter_Add(Gates, id);
		}
	}
	
	return 1;
}

public OnFilterScriptExit()
{
	db_close(GateDB);
	return 1;
}

public OnPlayerConnect(playerid)
{
	EditingGateID[playerid] = -1;
	EditingGateType[playerid] = -1;
	for(new i; i < MAX_GATES; i++) HasGateAuth[playerid][i] = false;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(EditingGateID[playerid] != -1) GateData[ EditingGateID[playerid] ][GateEditing] = false;
	return 1;
}

public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(EditingGateID[playerid] == -1) return 1;
	switch(response)
	{
		case EDIT_RESPONSE_FINAL:
		{
		    new id = EditingGateID[playerid];
		    GateData[id][GateEditing] = false;
		    
		    switch(EditingGateType[playerid])
		    {
				case GATE_STATE_CLOSED:
				{
				    Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, GateData[id][GateLabel], E_STREAMER_X, x);
		            Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, GateData[id][GateLabel], E_STREAMER_Y, y);
		            Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, GateData[id][GateLabel], E_STREAMER_Z, z);
				    SetDynamicObjectPos(objectid, x, y, z);
				    SetDynamicObjectRot(objectid, rx, ry, rz);
				    GateData[id][GatePos][0] = x;
					GateData[id][GatePos][1] = y;
					GateData[id][GatePos][2] = z;
					GateData[id][GateRot][0] = rx;
					GateData[id][GateRot][1] = ry;
					GateData[id][GateRot][2] = rz;
					SendClientMessage(playerid, 0x2ECC71FF, "Bilgi: {FFFFFF}Gatenin varsay�lan pozisyonu ayarland�.");
					
					if(GateData[id][GateOpenPos][0] == 0.0 && GateData[id][GateOpenRot][0] == 0.0) {
				        GateData[id][GateEditing] = true;
		    			EditingGateType[playerid] = GATE_STATE_OPEN;
				        EditDynamicObject(playerid, objectid);
				        
				        SendClientMessage(playerid, 0xF39C12FF, "Uyar�: {FFFFFF}Bu gatenin a��lma pozisyoun yok");
				        SendClientMessage(playerid, 0xF39C12FF, "Uyar�: {FFFFFF}�sterseniz gatenin a��lma pozisyonu �imdi veya daha sonra ayarlayabilirsiniz.");
				        SendClientMessage(playerid, 0xF39C12FF, "Uyar�: {FFFFFF}A��l�� pozisyonu ayarlan�ncaya kadar bu gateyi kullanamazlar.");
				    }else{
				        EditingGateID[playerid] = -1;
		    			EditingGateType[playerid] = -1;
				    }
				    
				    SaveGate(id);
				}
				
				case GATE_STATE_OPEN:
				{
				    SendClientMessage(playerid, 0x2ECC71FF, "Bilgi: {FFFFFF}Gatenin a��l�� pozisyonu ayarland�.");
				    SetGateState(id, GATE_STATE_CLOSED, 2);
				    GateData[id][GateOpenPos][0] = x;
					GateData[id][GateOpenPos][1] = y;
					GateData[id][GateOpenPos][2] = z;
					GateData[id][GateOpenRot][0] = rx;
					GateData[id][GateOpenRot][1] = ry;
					GateData[id][GateOpenRot][2] = rz;

				    EditingGateID[playerid] = -1;
		    		EditingGateType[playerid] = -1;
		    		SaveGate(id);
				}
		    }
		}
		
		case EDIT_RESPONSE_CANCEL:
		{
            new id = EditingGateID[playerid];
            GateData[id][GateEditing] = false;
            
		    switch(EditingGateType[playerid])
		    {
				case GATE_STATE_CLOSED:
				{
				    SetDynamicObjectPos(objectid, GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2]);
				    SetDynamicObjectRot(objectid, GateData[id][GateRot][0], GateData[id][GateRot][1], GateData[id][GateRot][2]);
				    GateData[id][GatePos][0] = x;
					GateData[id][GatePos][1] = y;
					GateData[id][GatePos][2] = z;
					GateData[id][GateRot][0] = rx;
					GateData[id][GateRot][1] = ry;
					GateData[id][GateRot][2] = rz;
					SendClientMessage(playerid, 0x2ECC71FF, "Bilgi: {FFFFFF}Gatenin varsay�lan pozisyonu iptal edildi.");
				}

				case GATE_STATE_OPEN:
				{
				    SendClientMessage(playerid, 0x2ECC71FF, "Bilgi: {FFFFFF}Gatenin a��l�� pozisyonu iptal edildi.");
				    
				    if(GateData[id][GateOpenPos][0] == 0.0 && GateData[id][GateOpenRot][0] == 0.0)
					{
				        SendClientMessage(playerid, 0xF39C12FF, "Uyar�: {FFFFFF}Bu gatenin a��lma pozisyonu yok");
				        SendClientMessage(playerid, 0xF39C12FF, "Uyar�: {FFFFFF}A��l�� pozisyonu ayarlan�ncaya kadar bu gate kullan�lamaz.");
				    }

				    SetGateState(id, GATE_STATE_CLOSED, 2);
				    EditingGateID[playerid] = -1;
		    		EditingGateType[playerid] = -1;
				}
			}
		}
	}
	
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_GATE_PASSWORD)
	{
	    if(!response) return 1;
		if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GATE_PASSWORD, DIALOG_STYLE_PASSWORD, "Gate �ifresi", "{E74C3C}Ekran� bo� b�rakay�n ve gate �ifresini girin.", "A�", "�ptal");
		new id = GetClosestGate(playerid);
		if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Bir gatenin yak�n�nda de�ilsin.");
		if(strcmp(GateData[id][GatePassword], inputtext)) return ShowPlayerDialog(playerid, DIALOG_GATE_PASSWORD, DIALOG_STYLE_PASSWORD, "Gate �ifresi", "{E74C3C}Hatal� �ifre girdiniz.\n{FFFFFF}L�tfen gate �ifresini girin.", "A�", "�ptal");
		HasGateAuth[playerid][id] = true;
		ToggleGateState(id);
		return 1;
	}
	
	if(dialogid == DIALOG_GATE_EDITMENU)
	{
	    if(!IsPlayerAdmin(playerid)) return 1;
	    if(!response)
		{
		    if(EditingGateID[playerid] != -1) GateData[ EditingGateID[playerid] ][GateEditing] = false;
			EditingGateID[playerid] = -1;
			return 1;
		}
		
		new id = EditingGateID[playerid];
		if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Bir gate d�zenlemiyorsun.");
	    if(listitem == 0)
		{
			ToggleGateState(id);
			ShowEditMenu(playerid, id);
		}
		
	    if(listitem == 1) ShowPlayerDialog(playerid, DIALOG_GATE_NEWPASSWORD, DIALOG_STYLE_INPUT, "Gate �ifresi De�i�tir", "Gate �ifresini girin.\n\n�ifresiz gate istiyorsan�z ekran� bo� b�rak�n.", "G�ncelle", "�ptal");
		if(listitem == 2)
		{
		    SetGateState(id, GATE_STATE_CLOSED, 2);
		    EditingGateType[playerid] = GATE_STATE_CLOSED;
		    EditDynamicObject(playerid, GateData[id][GateObject]);
		    SendClientMessage(playerid, 0x2ECC71FF, "Bilgi: {FFFFFF}Gatenin varsay�lan konumunu belirleyin.");
		}
		
		if(listitem == 3)
		{
		    SetGateState(id, GATE_STATE_OPEN, 2);
		    EditingGateType[playerid] = GATE_STATE_OPEN;
		    EditDynamicObject(playerid, GateData[id][GateObject]);
		    SendClientMessage(playerid, 0x2ECC71FF, "Bilgi: {FFFFFF}Gatenin a��laca�� pozisyonu belirleyin.");
		}
		
		if(listitem == 4)
		{
		    GateData[id][GateEditing] = false;
		    GateData[id][GatePos][0] = GateData[id][GatePos][1] = GateData[id][GatePos][2] = 0.0;
		    GateData[id][GateRot][0] = GateData[id][GateRot][1] = GateData[id][GateRot][2] = 0.0;
			GateData[id][GateOpenPos][0] = GateData[id][GateOpenPos][1] = GateData[id][GateOpenPos][2] = 0.0;
			GateData[id][GateOpenRot][0] = GateData[id][GateOpenRot][1] = GateData[id][GateOpenRot][2] = 0.0;
			DestroyDynamicObject(GateData[id][GateObject]);
			DestroyDynamic3DTextLabel(GateData[id][GateLabel]);
			Iter_Remove(Gates, id);
			
			stmt_bind_value(RemoveGate, 0, DB::TYPE_INTEGER, id);
			stmt_execute(RemoveGate);
			
		    foreach(new i : Player) if(EditingGateID[i] == id) EditingGateID[i] = -1;
		    SendClientMessage(playerid, 0x2ECC71FF, "Bilgi: {FFFFFF}Gate silindi.");
		}
		
		return 1;
	}
	
	if(dialogid == DIALOG_GATE_NEWPASSWORD)
	{
	    if(!IsPlayerAdmin(playerid)) return 1;
		new id = EditingGateID[playerid];
		if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Bir gate d�zenlemiyorsunuz.");
		if(!response) return ShowEditMenu(playerid, id);
	    format(GateData[id][GatePassword], GATE_PASS_LEN, "%s", inputtext);
	    foreach(new i : Player) HasGateAuth[i][id] = false;
	    SendClientMessage(playerid, 0x2ECC71FF, "Bilgi: {FFFFFF}�ifre g�ncellendi.");
	    SaveGate(id);
	    ShowEditMenu(playerid, id);
	    return 1;
	}
	
	return 0;
}

CMD:gate(playerid, params[])
{
	new id = GetClosestGate(playerid);
	if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Bir gatenin yan�nda de�ilsin.");
	if(GateData[id][GateEditing]) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Bu gate d�zenlenirken kullanamazs�n.");
	if(GateData[id][GateOpenPos][0] == 0.0 && GateData[id][GateOpenRot][0] == 0.0) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Bu gatenin a��lma pozisyonu yok.");
	if(!strlen(GateData[id][GatePassword])) {
	    ToggleGateState(id);
	}else{
	    if(HasGateAuth[playerid][id]) {
	        ToggleGateState(id);
		}else{
		    ShowPlayerDialog(playerid, DIALOG_GATE_PASSWORD, DIALOG_STYLE_PASSWORD, "Gate �ifresi", "A�mak istedi�iniz gatenin �ifresini girin.", "A�", "Kapat");
		}
	}
	return 1;
}

CMD:gateolusturbrkn(playerid, params[])
{
	if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Rcon admin olmal�s�n.");
	if(EditingGateID[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}�uanda bir gate olu�turuyorsun.");
	new id = Iter_Free(Gates);
	if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Gate olu�turma limiti dolmu�.");
	new model, password[GATE_PASS_LEN];
	if(sscanf(params, "iS()["#GATE_PASS_LEN"]", model, password)) return SendClientMessage(playerid, 0xF39C12FF, "Kullan�m: {FFFFFF}/GateOlustur [model id] [�ifre (iste�e ba�l�)]");
	GateData[id][GateModel] = model;
	GateData[id][GatePassword] = password;
	
	new Float: x, Float: y, Float: z;
	GetPlayerPos(playerid, x, y, z);
	GetXYInFrontOfPlayer(playerid, x, y, 3.0);
	
	GateData[id][GatePos][0] = x;
	GateData[id][GatePos][1] = y;
	GateData[id][GatePos][2] = z;
	GateData[id][GateRot][0] = GateData[id][GateRot][1] = GateData[id][GateRot][2] = 0.0;
	GateData[id][GateOpenPos][0] = GateData[id][GateOpenPos][1] = GateData[id][GateOpenPos][2] = 0.0;
	GateData[id][GateOpenRot][0] = GateData[id][GateOpenRot][1] = GateData[id][GateOpenRot][2] = 0.0;
	GateData[id][GateState] = GATE_STATE_CLOSED;
	GateData[id][GateEditing] = true;
	GateData[id][GateObject] = CreateDynamicObject(model, x, y, z, 0.0, 0.0, 0.0);
	new string[32];
	//format(string, sizeof(string), "Gate #%d\n%s", id, GateStates[GATE_STATE_CLOSED]);
	format(string, sizeof(string), " ");
	GateData[id][GateLabel] = CreateDynamic3DTextLabel(string, 0xECF0F1FF, x, y, z, 10.0);
	Iter_Add(Gates, id);
	
	stmt_bind_value(AddGate, 0, DB::TYPE_INTEGER, id);
	stmt_bind_value(AddGate, 1, DB::TYPE_INTEGER, model);
	stmt_bind_value(AddGate, 2, DB::TYPE_STRING, password);
	stmt_bind_value(AddGate, 3, DB::TYPE_FLOAT, x);
	stmt_bind_value(AddGate, 4, DB::TYPE_FLOAT, y);
	stmt_bind_value(AddGate, 5, DB::TYPE_FLOAT, z);
	stmt_execute(AddGate);
	
	EditingGateID[playerid] = id;
	EditingGateType[playerid] = GATE_STATE_CLOSED;
	EditDynamicObject(playerid, GateData[id][GateObject]);
	SendClientMessage(playerid, 0x2ECC71FF, "Bilgi: {FFFFFF}Gate olu�turuldu, d�zenlemeyi yap�n.");
	return 1;
}

CMD:gateduzenlebrkn(playerid, params[])
{
    if(!IsPlayerAdmin(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Rcon admin olmal�s�n.");
	if(EditingGateID[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}�uanda bir gate olu�turuyorsun.");
	new id;
	sscanf(params, "I(-2)", id);
	if(id == -2) id = GetClosestGate(playerid);
	if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Bir gatenin yak�n�nda de�ilsin");
	if(GateData[id][GateEditing]) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}Zaten bir gate editliyorsun.");
	if(!IsPlayerInRangeOfPoint(playerid, 20.0, GateData[id][GatePos][0], GateData[id][GatePos][1], GateData[id][GatePos][2])) return SendClientMessage(playerid, 0xE74C3CFF, "Hata: {FFFFFF}D�zenlemek istedi�iniz gatenin yak�n�nda olmal�s�n�z.");
	GateData[id][GateEditing] = true;
	EditingGateID[playerid] = id;
	ShowEditMenu(playerid, id);
	return 1;
}
