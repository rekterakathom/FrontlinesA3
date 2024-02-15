// Define standard units
FRLN_sectionLead = "UK3CB_LSM_O_SL";
FRLN_teamLead = "UK3CB_LSM_O_TL";
FRLN_medic = "UK3CB_LSM_O_MD";
FRLN_marksman = "UK3CB_LSM_O_MK";
FRLN_machineGunner = "UK3CB_LSM_O_MG";
FRLN_ammoBearer = "UK3CB_LSM_O_MG_ASST";
FRLN_engineer = "UK3CB_LSM_O_ENG";
FRLN_rifleman = "UK3CB_LSM_O_RIF_1";
FRLN_antiTank = "UK3CB_LSM_O_AT";
FRLN_lightAntiTank = "UK3CB_LSM_O_LAT";
FRLN_demo_expert = "UK3CB_LSM_O_DEM";
FRLN_antiAirSpecialist = "UK3CB_LSM_O_AA";
FRLN_antiAirAssistant = "UK3CB_LSM_O_AA_ASST";

// Define recon units. They are 'special forces'
FRLN_recon_sectionLead = "UK3CB_LSM_O_SF_SL";
FRLN_recon_teamLead = "UK3CB_LSM_O_SF_TL";
FRLN_recon_medic = "UK3CB_LSM_O_SF_MD";
FRLN_recon_rifleman = "UK3CB_LSM_O_SF_RIF_1";
FRLN_recon_demo_expert = "UK3CB_LSM_O_SF_DEM";
FRLN_recon_autorifleman = "UK3CB_LSM_O_SF_AR";
FRLN_recon_lightAntiTank = "UK3CB_LSM_O_SF_LAT";
FRLN_recon_marksman = "UK3CB_LSM_O_SF_MK";

// Vehicles
FRLN_artillery = "UK3CB_LSM_O_BM21";
FRLN_antiAir = "UK3CB_LSM_O_ZsuTank";

// This is the bread and butter regular squad used basically everywhere
// They can carry pretty heavy equipment, they don't need to move a lot
FRLN_section = [
	FRLN_sectionLead,
	FRLN_teamLead,
	FRLN_medic,
	FRLN_marksman,
	FRLN_machineGunner,
	FRLN_ammoBearer,
	FRLN_engineer,
	FRLN_antiTank,
	FRLN_rifleman
];

// This is a fireteam, usually complementing the regular squad as a patrol
FRLN_fireTeam = [
	FRLN_teamLead,
	FRLN_lightAntiTank,
	FRLN_rifleman,
	FRLN_rifleman
];

// Anti-air fireteam. Usually guarding artillery installations
FRLN_AA_FireTeam = [
	FRLN_teamLead,
	FRLN_antiAirSpecialist,
	FRLN_antiAirAssistant,
	FRLN_rifleman
];

// Recon units act as a sort of 'special forces'
// they are often sent out on more dangerous tasks
FRLN_reconTeam = [
	FRLN_recon_sectionLead,
	FRLN_recon_teamLead,
	FRLN_recon_medic,
	FRLN_recon_rifleman,
	FRLN_recon_demo_expert,
	FRLN_recon_autorifleman,
	FRLN_recon_lightAntiTank,
	FRLN_recon_marksman
];

// Mechanized infantry. Basically a bit better equipped regular squad complemented -
// with a vehicle
FRLN_mechSection = [
	FRLN_sectionLead,
	FRLN_teamLead,
	FRLN_medic,
	FRLN_marksman,
	FRLN_machineGunner,
	FRLN_ammoBearer,
	FRLN_engineer,
	FRLN_rifleman,
	FRLN_antiTank,
	FRLN_demo_expert,
	"UK3CB_LSM_O_BMP2"
];

// One of these is always spawned at a sector. Values and weights
FRLN_sectorLightVehicles = [
	"UK3CB_LSM_O_Hilux_Open", 0.2,
	"UK3CB_LSM_O_Hilux_Spg9", 0.1,
	"UK3CB_LSM_O_Hilux_Pkm", 0.1,
	"UK3CB_LSM_O_Hilux_M2", 0.1,
	"UK3CB_LSM_O_Hilux_Dshkm", 0.1,
	"UK3CB_LSM_O_Hilux_Zu23", 0.1,
	"UK3CB_LSM_O_Hilux_Mortar", 0.1
];

// One of these is always spawned at a sector.
FRLN_sectorStatics = [
	"UK3CB_LSM_O_2b14_82mm",
	"UK3CB_LSM_O_DSHKM",
	"UK3CB_LSM_O_ZU23"
];

diag_log "Frontlines: 3CB Livonian Separatist preset loaded";
