#if defined MODELSIZES
	#endinput
#endif
#define MODELSIZES

new DB:MS_DB, MS_QUERY[128], DBResult:MS_RESULT, Float:MS_VALUE[6];

#if defined FILTERSCRIPT
	public OnFilterscriptInit()
	{
		if((MS_DB = db_open("modelsizes.db")) == DB:0)
			print("Model Sizes Plus - Loading Failed (Database Could Not Be Opened).");
		#if defined MS_OnFilterscriptInit
			MS_OnFilterscriptInit();
		#endif
		return 1;
	}
	#if defined _ALS_OnFilterscriptInit
		#undef OnFilterscriptInit
	#else
		#define _ALS_OnFilterscriptInit
	#endif
	#define OnFilterscriptInit MS_OnFilterscriptInit
	#if defined MS_OnFilterscriptInit
		forward MS_OnFilterscriptInit();
	#endif
#else
	public OnGameModeInit()
	{
		if((MS_DB = db_open("modelsizes.db")) == DB:0)
			print("Model Sizes Plus - Loading Failed (Database Could Not Be Opened).");
		#if defined MS_OnGameModeInit
			MS_OnGameModeInit();
		#endif
		return 1;
	}
	#if defined _ALS_OnGameModeInit
		#undef OnGameModeInit
	#else
		#define _ALS_OnGameModeInit
	#endif
	#define OnGameModeInit MS_OnGameModeInit
	#if defined MS_OnGameModeInit
		forward MS_OnGameModeInit();
	#endif
#endif

#define GetColCount() (20000)

stock Float:GetColSphereRadius(objectmodel)
{
	format(MS_QUERY, 128, "SELECT `Size` FROM `Sphere` WHERE `Model` = '%d'", objectmodel);
	MS_RESULT = db_query(MS_DB, MS_QUERY);
	if(db_num_rows(MS_RESULT))
		MS_VALUE[0] = db_get_field_float(MS_RESULT, 0);
	else
		MS_VALUE[0] = 0.0;
	db_free_result(MS_RESULT);
	return MS_VALUE[0];
}

stock GetColSphereOffset(objectmodel, &Float:x, &Float:y, &Float:z)
{
	format(MS_QUERY, 128, "SELECT `OffsetX`, `OffsetY`, `OffsetZ` FROM `Sphere` WHERE `Model` = '%d'", objectmodel);
	MS_RESULT = db_query(MS_DB, MS_QUERY);
	if(db_num_rows(MS_RESULT)) {
		x = db_get_field_float(MS_RESULT, 0);
		y = db_get_field_float(MS_RESULT, 1);
		z = db_get_field_float(MS_RESULT, 2);
		db_free_result(MS_RESULT);
		return 1;
	}
	else {
		x = 0.0;
		y = 0.0;
		z = 0.0;
		db_free_result(MS_RESULT);
		return 0;
	}
}

stock GetModelBoundingBox(objectmodel, &Float:MinX, &Float:MinY, &Float:MinZ, &Float:MaxX, &Float:MaxY, &Float:MaxZ)
{
	format(MS_QUERY, 128, "SELECT `MinX`, `MinY`, `MinZ`, `MaxX`, `MaxY`, `MaxZ` FROM `AABB` WHERE `Model` = '%d'", objectmodel);
	MS_RESULT = db_query(MS_DB, MS_QUERY);
	if(db_num_rows(MS_RESULT)) {
		MinX = db_get_field_float(MS_RESULT, 0);
		MinY = db_get_field_float(MS_RESULT, 1);
		MinZ = db_get_field_float(MS_RESULT, 2);
		MaxX = db_get_field_float(MS_RESULT, 3);
		MaxY = db_get_field_float(MS_RESULT, 4);
		MaxZ = db_get_field_float(MS_RESULT, 5);
		db_free_result(MS_RESULT);
		return 1;
	}
	else {
		MinX = 0.0;
		MinY = 0.0;
		MinZ = 0.0;
		MaxX = 0.0;
		MaxY = 0.0;
		MaxZ = 0.0;
		db_free_result(MS_RESULT);
		return 0;
	}
}

stock GetModelColDimensions(objectmodel, &Float:length, &Float:width, &Float:height)
{
	format(MS_QUERY, 128, "SELECT `MinX`, `MinY`, `MinZ`, `MaxX`, `MaxY`, `MaxZ` FROM `AABB` WHERE `Model` = '%d'", objectmodel);
	MS_RESULT = db_query(MS_DB, MS_QUERY);
	if(db_num_rows(MS_RESULT)) {
		length = floatabs(db_get_field_float(MS_RESULT, 0) - db_get_field_float(MS_RESULT, 3));
		width = floatabs(db_get_field_float(MS_RESULT, 1) - db_get_field_float(MS_RESULT, 4));
		height = floatabs(db_get_field_float(MS_RESULT, 2) - db_get_field_float(MS_RESULT, 5));
		db_free_result(MS_RESULT);
		return 1;
	}
	else {
		length = 0.0;
		width = 0.0;
		height = 0.0;
		db_free_result(MS_RESULT);
		return 0;
	}
}
