/* Scripted by RIDE2DAY */
/* Official thread: http://forum.sa-mp.com/showthread.php?t=614854 */

#define	RED_NEON	18647
#define BLUE_NEON	18648
#define GREEN_NEON	18649
#define YELLOW_NEON	18650
#define	PINK_NEON 	18651
#define WHITE_NEON	18652

enum e_anltv_VehicleData
{
	Name[30],
	Float:NeonOffsetX,
	Float:NeonOffsetY,
    Float:NeonOffsetZ
}

new g_anltv_VehicleData[212][e_anltv_VehicleData] = {
	{"Landstalker", -0.924999, 0.009999, -0.674999},
 	{"Bravura",	-0.979999, 0.074999, -0.489999},
 	{"Buffalo", -1.034999, -0.029999, -0.579999},
 	{"Linerunner", -0.884999, 1.834998, -1.099999},
 	{"Perennial", -0.839999, -0.064999, -0.419999},
 	{"Sentinel", -0.914999, 0.000000, -0.534999},
 	{"Dumper", -1.129999, 0.354999, -1.219999},
 	{"Firetruck", -1.214999, 0.125000, -0.759999},
 	{"Trashmaster", -0.664999, 0.709999, -0.889999},
 	{"Stretch", -0.914999, -0.294999, -0.474999},
 	{"Manana", -0.879999, 0.000000, -0.389999},
 	{"Infernus", -0.969999, 0.004999, -0.559999},
 	{"Voodoo", -0.994999, -0.154999, -0.569999},
 	{"Pony", -0.919999, -0.069999, -0.719999},
 	{"Mule", -0.759999, -0.469999, -0.524999},
 	{"Cheetah", -0.949999, -0.009999, -0.524999},
 	{"Ambulance", -1.259999, -0.604999, -0.664999},
 	{"Leviathan", -2.255004, 0.859999, -0.124999},
 	{"Moonbeam", -1.004999, 0.089999, -0.829999},
 	{"Esperanto", -0.934999, -0.009999, -0.584999},
 	{"Taxi", -0.954999, -0.009999, -0.444999},
 	{"Washington", -0.929999, -0.029999, -0.589999},
 	{"Bobcat", -0.889999, 0.009999, -0.609999},
 	{"Mr. Whoopee", -0.999999, 0.164999, -0.714999},
 	{"BF Injection", -0.739999, 0.039999, -0.234999},
 	{"Hunter", -0.639999, 2.475009, -0.789999},
 	{"Premier", -0.969999, 0.000000, -0.464999},
 	{"Enforcer", -1.124999, -0.714999, -0.734999},
 	{"Securicar", -1.124999, 0.054999, -0.759999},
 	{"Banshee", -0.844999, 0.004999, -0.474999},
 	{"Predator", 0.0, 0.0, 0.0},
 	{"Bus", -1.304998, 2.300005, -0.714999},
 	{"Rhino", 0.0, 0.0, 0.0},
 	{"Barracks", -0.579999, 0.994999, -0.874999},
 	{"Hotknife", 0.0, 0.0, 0.0},
 	{"Article Trailer", 0.0, 0.0, 0.0},
 	{"Previon", -0.859999, -0.024999, -0.489999},
 	{"Coach", -1.314998, 2.245003, -0.724999},
 	{"Cabbie", -0.969999, -0.034999, -0.674999},
 	{"Stallion", -0.884999, 0.034999, -0.644999},
 	{"Rumpo", -0.914999, -0.045000, -0.899999},
 	{"RC Bandit", 0.0, 0.0, 0.0},
 	{"Romero", -1.004999, -0.074999, -0.604999},
 	{"Packer", -0.809999, 2.770015, -1.174999},
 	{"Monster", -1.064999, 0.000000, 0.135000},
 	{"Admiral", -0.949999, 0.000000, -0.519999},
 	{"Squallo", 0.0, 0.0, 0.0},
 	{"Seasparrow", -1.004999, 0.259999, -0.769999},
 	{"Pizzaboy", 0.0, 0.0, 0.0},
 	{"Tram", 0.0, 0.0, 0.0},
 	{"Article Trailer 2", 0.0, 0.0, 0.0},
 	{"Turismo", -0.984999, -0.194999, -0.519999},
 	{"Speeder", 0.0, 0.0, 0.0},
 	{"Reefer", 0.0, 0.0, 0.0},
 	{"Tropic", 0.0, 0.0, 0.0},
 	{"Flatbed", -0.579999, 0.979999, -0.859999},
 	{"Yankee", -0.764999, -0.179999, -0.464999},
 	{"Caddy", 0.0, 0.0, 0.0},
 	{"Solair", -0.959999, -0.039999, -0.594999},
 	{"Topfun Van (Berkley's RC)", -0.919999, -0.069999, -0.719999},
 	{"Skimmer", -1.399998, 0.554999, -1.819998},
 	{"PCJ-600", 0.0, 0.0, 0.0},
 	{"Faggio", 0.0, 0.0, 0.0},
 	{"Freeway", 0.0, 0.0, 0.0},
 	{"RC Baron", 0.0, 0.0, 0.0},
 	{"RC Raider", 0.0, 0.0, 0.0},
 	{"Glendale", -0.989999, -0.064999, -0.489999},
 	{"Oceanic", -0.989999, -0.044999, -0.484999},
 	{"Sanchez", 0.0, 0.0, 0.0},
 	{"Sparrow", 0.0, 0.0, 0.0},
 	{"Patriot", -1.119999, -0.149999, -0.359999},
 	{"Quad", 0.0, 0.0, 0.0},
 	{"Coastguard", 0.0, 0.0, 0.0},
 	{"Dinghy", 0.0, 0.0, 0.0},
 	{"Hermes", -0.994999, -0.064999, -0.544999},
 	{"Sabre", -0.904999, -0.054999, -0.549999},
 	{"Rustler", 0.0, 0.0, 0.0},
 	{"ZR-350", -0.979999, 0.019999, -0.514999},
 	{"Walton", -0.804999, 0.064999, -0.519999},
 	{"Regina", -0.854999, 0.090000, -0.454999},
 	{"Comet", -0.879999, 0.000000, -0.489999},
 	{"BMX", 0.0, 0.0, 0.0},
 	{"Burrito", -0.989999, 0.000000, -0.759999},
 	{"Camper", -0.834999, -0.149999, -0.744999},
 	{"Marquis", 0.0, 0.0, 0.0},
 	{"Baggage", -0.629999, 0.164999, -0.374999},
 	{"Dozer", 0.0, 0.0, 0.0},
 	{"Maverick", 0.0, 0.0, 0.0},
 	{"News Chopper", 0.0, 0.0, 0.0},
 	{"Rancher", -1.019999, 0.110000, -0.679999},
 	{"FBI Rancher", -1.054999, 0.125000, -0.604999},
 	{"Virgo", -0.874999, -0.009999, -0.569999},
 	{"Greenwood", -0.909999, 0.000000, -0.459999},
 	{"Jetmax", 0.0, 0.0, 0.0},
 	{"Hotring Racer", -0.909999, -0.199999, -0.639999},
 	{"Sandking", -1.024999, 0.184999, -0.809999},
 	{"Blista Compact", -0.854999, 0.029999, -0.469999},
 	{"Police Maverick", 0.0, 0.0, 0.0},
 	{"Boxville", -1.149999, 0.269999, -0.654999},
 	{"Benson", -0.969999, -1.404998, -0.199999},
 	{"Mesa", -0.969999, 0.189999, -0.574999},
 	{"RC Goblin", 0.0, 0.0, 0.0},
 	{"Hotring Racer A", -0.909999, 0.029999, -0.639999},
 	{"Hotring Racer B", -0.909999, -0.184999, -0.639999},
 	{"Bloodring Banger", -0.989999, -0.059999, -0.494999},
 	{"Rancher (vidrios polarizados)", -1.019999, 0.110000, -0.679999},
 	{"Super GT", -0.904999, -0.249999, -0.509999},
	{"Elegant", -1.084999, -0.024999, -0.589999},
	{"Journey", -1.334998, -0.424999, -0.979999},
	{"Bike", 0.0, 0.0, 0.0},
	{"Mountain Bike", 0.0, 0.0, 0.0},
	{"Beagle", 0.0, 0.0, 0.0},
	{"Cropduster", 0.0, 0.0, 0.0},
	{"Stuntplane", 0.0, 0.0, 0.0},
	{"Tanker", -0.969999, 1.669998, -1.174999},
	{"Roadtrain", -1.454998, 0.439999, -1.854998},
	{"Nebula", -0.989999, 0.024999, -0.584999},
	{"Majestic", -0.959999, 0.004999, -0.554999},
	{"Buccaneer", -1.049999, 0.110000, -0.439999},
	{"Shamal", 0.0, 0.0, 0.0},
	{"Hydra", 0.0, 0.0, 0.0},
	{"FCR-900", 0.0, 0.0, 0.0},
	{"NRG-500", 0.0, 0.0, 0.0},
	{"HPV1000", 0.0, 0.0, 0.0},
	{"Cement Truck", -0.689999, 1.489998, -1.319998},
	{"Towtruck", -1.054999, 0.499999, -0.329999},
	{"Fortune", -0.899999, 0.000000, -0.564999},
	{"Cadrona", -0.944999, 0.154999, -0.419999},
	{"FBI Truck", -0.924999, 0.059999, -0.529999},
	{"Willard", -0.934999, -0.110000, -0.429999},
	{"Forklift", 0.0, 0.0, 0.0},
	{"Tractor", -0.144999, 0.314999, -0.444999},
	{"Combine Harvester", 0.0, 0.0, 0.0},
	{"Feltzer", -0.924999, -0.034999, -0.479999},
	{"Remington", -0.984999, 0.164999, -0.564999},
	{"Slamvan", -1.069999, -0.034999, -0.569999},
	{"Blade", -0.954999, -0.019999, -0.579999},
	{"Freight", 0.0, 0.0, 0.0},
	{"Brown Streak", 0.0, 0.0, 0.0},
	{"Vortex", -1.004999, -0.049999, -0.019999},
	{"Vincent", -1.024999, -0.090000, -0.639999},
	{"Bullet", -0.904999, 0.000000, -0.414999},
	{"Clover", -0.894999, 0.014999, -0.539999},
	{"Sadler", -0.904999, 0.009999, -0.409999},
	{"Firetruck (ladder variant)", -1.089999, 0.000000, -0.709999},
	{"Hustler", -0.939999, -0.029999, -0.564999},
	{"Intruder", -1.039999, -0.100000, -0.474999},
	{"Primo", -0.884999, 0.059999, -0.479999},
	{"Cargobob", -1.769998, 1.484998, -1.774998},
	{"Tampa", -0.949999, 0.105000, -0.439999},
	{"Sunrise", -1.089999, -0.059999, -0.554999},
	{"Merit", -0.964999, 0.004999, -0.564999},
	{"Utility Van", -1.034999, 0.749999, -0.254999},
	{"Nevada", 0.0, 0.0, 0.0},
	{"Yosemite", -1.109999, 0.009999, -0.534999},
	{"Windsor", -0.754999, 0.000000, -0.464999},
	{"Monster A", -1.119999, 0.000000, 0.184999},
	{"Monster B", -1.129999, 0.044999, 0.074999},
	{"Uranus", -0.894999, -0.089999, -0.374999},
	{"Jester", -0.964999, 0.000000, -0.444999},
	{"Sultan", -1.004999, 0.054999, -0.414999},
	{"Stratum", -0.919999, 0.130000, -0.574999},
	{"Elegy", -0.909999, 0.120000, -0.404999},
	{"Raindance", 0.0, 0.0, 0.0},
	{"RC Tiger", 0.0, 0.0, 0.0},
	{"Flash", -0.824999, 0.000000, -0.414999},
	{"Tahoma", -0.989999, -0.049999, -0.479999},
	{"Savanna", -1.089999, 0.309999, -0.609999},
	{"Bandito", -0.334999, 0.100000, -0.374999},
	{"Freight Flat Trailer", 0.0, 0.0, 0.0},
	{"Brown Streak Trailer", 0.0, 0.0, 0.0},
	{"Kart", 0.0, 0.0, 0.0},
	{"Mower", 0.0, 0.0, 0.0},
	{"Dune", 0.0, 0.0, 0.0},
	{"Sweeper", 0.0, 0.0, 0.0},
	{"Broadway", -0.924999, 0.004999, -0.334999},
	{"Tornado", -1.019999, -0.140000, -0.419999},
	{"AT-400", 0.0, 0.0, 0.0},
	{"DFT-30", -1.429998, -0.649999, -0.879999},
	{"Huntley", -1.014999, 0.000000, -0.484999},
	{"Stafford", -1.089999, 0.014999, -0.474999},
	{"BF-400", 0.0, 0.0, 0.0},
	{"Newsvan", -0.984999, -0.194999, -0.709999},
	{"Tug", -0.674999, 0.259999, 0.130000},
	{"Petrol Trailer", 0.0, 0.0, 0.0},
	{"Emperor", -1.019999, -0.009999, -0.354999},
	{"Wayfarer", 0.0, 0.0, 0.0},
	{"Euros", -1.009999, -0.064999, -0.534999},
	{"Hotdog", -1.374998, 0.000000, -0.664999},
	{"Club", -0.909999, 0.000000, -0.359999},
	{"Freight Box Trailer", 0.0, 0.0, 0.0},
	{"Article Trailer 3", 0.0, 0.0, 0.0},
	{"Andromada", 0.0, 0.0, 0.0},
	{"Dodo", 0.0, 0.0, 0.0},
	{"RC Cam", 0.0, 0.0, 0.0},
	{"Launch", 0.0, 0.0, 0.0},
	{"Police Car (LSPD)", -0.974999, 0.000000, -0.469999},
	{"Police Car (SFPD)", -0.969999, 0.000000, -0.464999},
	{"Police Car (LVPD)", -1.004999, -0.014999, -0.414999},
	{"Ranger", -1.019999, 0.115000, -0.684999},
	{"Picador", -0.959999, 0.204999, -0.499999},
	{"S.W.A.T.", 0.0, 0.0, 0.0},
	{"Alpha", -1.024999, 0.000000, -0.549999},
	{"Phoenix", -0.954999, 0.034999, -0.629999},
	{"Glendale (destrozado)", -0.989999, -0.064999, -0.489999},
	{"Sadler (destrozado)", -0.904999, 0.009999, -0.409999},
	{"Baggage Trailer A", 0.0, 0.0, 0.0},
	{"Baggage Trailer B", 0.0, 0.0, 0.0},
	{"Tug Stairs Trailer", 0.0, 0.0, 0.0},
	{"Boxville", -1.149999, 0.269999, -0.654999},
	{"Farm Trailer", 0.0, 0.0, 0.0},
	{"Utility Trailer", 0.0, 0.0, 0.0}
};

new Bit16:g_anltv_NeonLights[2]<MAX_VEHICLES>;

stock SetVehicleNeonLights(vehicleid, bool:enable = true, color = RED_NEON)
{
    new idx = GetVehicleModel(vehicleid) - 400;
    
    if(0 <= idx <= 211)
	{
		new idx2 = vehicleid - 1;
		
		for(new x = 0; x < 2; x++)
		{
		    if(IsValidDynamicObject(Bit16_Get(g_anltv_NeonLights[x], idx2)))
			{
			    DestroyDynamicObject(Bit16_Get(g_anltv_NeonLights[x], idx2));
			}
		}
		
		if(18647 <= color <= 18652)
		{
			if(enable)
			{
			
				Bit16_Set(g_anltv_NeonLights[0], idx2, CreateDynamicObject(color, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0));
				Bit16_Set(g_anltv_NeonLights[1], idx2, CreateDynamicObject(color, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0));

				AttachDynamicObjectToVehicle(Bit16_Get(g_anltv_NeonLights[0], idx2), vehicleid, g_anltv_VehicleData[idx][NeonOffsetX], g_anltv_VehicleData[idx][NeonOffsetY], g_anltv_VehicleData[idx][NeonOffsetZ], 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(Bit16_Get(g_anltv_NeonLights[1], idx2), vehicleid, -g_anltv_VehicleData[idx][NeonOffsetX], g_anltv_VehicleData[idx][NeonOffsetY], g_anltv_VehicleData[idx][NeonOffsetZ], 0.0, 0.0, 0.0);
			}
			return 1;
		}
	}
	return 0;
}

stock VehicleSupportsNeonLights(modelid)
{
    new idx = modelid - 400;

	if(0 <= idx <= 211)
	{
        if(g_anltv_VehicleData[idx][NeonOffsetX] == 0.0 && g_anltv_VehicleData[idx][NeonOffsetY] == 0.0 && g_anltv_VehicleData[idx][NeonOffsetZ] == 0.0)
		{
	    	return 0;
		}
		
		return 1;
	}
	return 0;
}

stock GetVehicleNeonLightsState(vehicleid)
{
	if(1 <= vehicleid <= MAX_VEHICLES)
 	{
		new idx = vehicleid - 1;
		
		if(IsValidDynamicObject(Bit16_Get(g_anltv_NeonLights[0], idx)) && IsValidDynamicObject(Bit16_Get(g_anltv_NeonLights[1], idx)))
		{
			return 1;
		}
	}
	return 0;
}

stock anltv_DestroyVehicle(vehicleid)
{
	if(1 <= vehicleid <= MAX_VEHICLES)
 	{
 	    SetVehicleNeonLights(vehicleid, false);
 	    return DestroyVehicle(vehicleid);
 	}
 	return 0;
}

#if defined _ALS_DestroyVehicle
        #undef DestroyVehicle
#else
        #define _ALS_DestroyVehicle
#endif
#define DestroyVehicle anltv_DestroyVehicle