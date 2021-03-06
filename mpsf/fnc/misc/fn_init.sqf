mpsf_core = "mpsf\"; mpsf_path_modules = mpsf_core+"mod\"; mpsf_mod_cba_enabled = isClass(configFile/"CfgPatches"/"cba_main"); mpsf_mod_ace_enabled = isClass(configFile/"CfgPatches"/"ace_main"); mpsf_mod_acre_enabled = isClass(configFile/"CfgPatches"/"acre_main"); mpsf_mod_STHud_enabled = isClass(configFile/"CfgPatches"/"ST_STHud"); mpsfSRV = if(isServer) then {true}else{false}; mpsfHLC = if(!isDedicated && !hasInterface) then {true}else{false}; mpsfCLI = if(!isDedicated && hasInterface ) then {true}else{false};
if(isNil "mpsf_active_units") then { mpsf_active_units = [] };
if(isNil "mpsf_CfgLogistics_Loadable") then { mpsf_CfgLogistics_Loadable = [] };
if(isNil "mpsf_CfgLogistics_Liftable") then { mpsf_CfgLogistics_Liftable = [] };
if(isNil "mpsf_CfgLogistics_Moveable") then { mpsf_CfgLogistics_Moveable = [] };
if(isNil "mpsf_CfgRespawn_PreDefinedPositions") then { mpsf_CfgRespawn_PreDefinedPositions = [] };
if(isNil "mpsf_CfgSpawner_PreDefinedSquads") then { mpsf_CfgSpawner_PreDefinedSquads = [] };
if(isNil "mpsf_CfgSpawner_PreDefinedVehicles") then { mpsf_CfgSpawner_PreDefinedVehicles = [] };
if(isNil "mpsf_CfgTasks_PreDefinedTasks") then { mpsf_CfgTasks_PreDefinedTasks = [] };
if(isNil "mpsf_CfgSpawner_DefaultCrewTypes") then { mpsf_CfgSpawner_DefaultCrewTypes = ["B_Soldier_F","O_Soldier_F","I_soldier_F"] };
if(isNil "mpsf_param_grpmark_allow") then { mpsf_param_grpmark_allow = true };
if(isNil "mpsf_param_grpmark_squad_allow") then { mpsf_param_grpmark_squad_allow = true };
if(isNil "mpsf_param_removeVehicleWrecks") then { mpsf_param_removeVehicleWrecks = true };
if(isNil "mpsf_param_removevehiclebodies") then { mpsf_param_removevehiclebodies = true };
if(isNil "mpsf_param_respawn_deathcount") then { mpsf_param_respawn_deathcount = 0 };
if(isNil "mpsf_param_respawn_securezone") then { mpsf_param_respawn_securezone = false };
if(isNil "mpsf_param_respawn_rallypoint_allow") then { mpsf_param_respawn_rallypoint_allow = true };
if(isNil "mpsf_param_respawn_halo_allow") then { mpsf_param_respawn_halo_allow = false };
if(isNil "mpsf_param_respawn_halo_time") then { mpsf_param_respawn_halo_time = 0 };
if(isNil "mpsf_param_respawn_playertime") then { mpsf_param_respawn_playertime = 10 };
if(isNil "mpsf_param_baseProtection") then { mpsf_param_baseProtection = false };
if(isNil "mpsf_param_ambient_weather_enable") then { mpsf_param_ambient_weather_enable = false };
if(isNil "mpsf_param_player_fatigue") then { mpsf_param_player_fatigue = true };
if(isNil "mpsf_param_injury_down") then { mpsf_param_injury_down = false };
if(isNil "mpsf_respawn_halo_nextAvailable") then { mpsf_respawn_halo_nextAvailable = 0 };
if(isNil "mpsf_param_ai_easyKill") then { mpsf_param_ai_easyKill = false };
if(isNil "mpsf_hud_screen_display") then { mpsf_hud_screen_display = false };
if(isNil "mpsf_hud_worldtoscreen_display") then { mpsf_hud_worldtoscreen_display = false };
if(isNil "mpsf_resupplyPoints") then { mpsf_resupplyPoints = [""] };
if(isNil "mpsf_logistics_lifthook_active") then { mpsf_logistics_lifthook_active = false };
if(isNil "mpsf_logistics_liftCables") then { mpsf_logistics_liftCables = [] };
if(isNil "mpsf_VAR_HealingStatus") then { mpsf_VAR_HealingStatus = false }; //<!-- HACK JOB
if(isNil "mpsf_playerIsBusy") then { mpsf_playerIsBusy = false };
if(isNil "ST_FTHud_assignedTeam") then { ST_FTHud_assignedTeam = { "NONE" }; };
if(isNil "mpsf_ammobox_vas_enabled") then { mpsf_ammobox_vas_enabled = false; };
if(isNil "mpsf_support_ActiveUAV") then { mpsf_support_ActiveUAV = objNull; };
if(isNil "mpsf_support_ActiveUGV") then { mpsf_support_ActiveUGV = objNull; };
if(isNil "mpsf_param_ambient_civs_enable") then { mpsf_param_ambient_civs_enable = false; };
if(isNil "mpsf_param_ambient_civtraffic_enable") then { mpsf_param_ambient_civtraffic_enable = false; };
if(isNil "mpsf_param_ambient_gaia_enable") then { mpsf_param_ambient_gaia_enable = false; };
if(isNil "mpsf_param_hud_requireGlasses") then { mpsf_param_hud_requireGlasses = false };