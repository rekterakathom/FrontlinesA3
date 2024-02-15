class cfgFunctions 
{
    class FRLN
    {
        class functions
        {
            // All init functions
            file = "functions";

            class initPlayerServer {};
        };
        class AI
        {
            // All AI functions
            file = "functions\AI";

            class defensiveLine {};
            class difficultyScaling {};
            class opforBrain {};
            class opforSpawnAntiAir {};
            class opforSpawnArtillery {};
        };
        class cleanup
        {
            // All cleanup functions
            file = "functions\cleanup";

            class cleanupUnit {};
        };
        class client
        {
            // All client functions
            file = "functions\client";

            class hudLoop {};
        };
        class curator
        {
            // All curator functions
            file = "functions\curator";

            class setAddons {};
        };
        class dialog
        {
            // All dialog functions
            file = "functions\dialog";

            class initVehicleOrderMenu {};
            class vehicleOrderButtonClicked {};
            class vehicleOrderMenuSelected {};
        };
        class events
        {
            // All event handler functions
            file = "functions\events";

            class buildingDamagedHandler {};
            class deathHandler {};
            class healedHandler {};
            class playerConnected {};
            class playerDisconnected {};
        };
        class headless
        {
            // All functions related to headless clients
            file = "functions\headless";

            class broadcast {};
            class getLeastLoadedHC {};
        };
        class object
        {
            // All functions related to objects (including units)
            file = "functions\object";

            class combatReady {};
            class createManagedUnit {};
            class faceBluforSector {};
            class setPlayerBranch {};
            class setPlayerRank {};
            class spawnFormation {};
            class unitsInRadius {};
        };
        class save
        {
            // All functions related to saving / loading
            file = "functions\save";

            class autoSaveLoop {};
            class savePlayerData {};
        };
        class sector
        {
            // All functions related to sectors
            file = "functions\sector";

            class despawnSector {};
            class findNearestSector {};
            class initSectors {};
            class monitorSectors {};
            class sectorContested {};
            class spawnSector {};
        };
        class util
        {
            // All utility functions like logging
            file = "functions\util";
            
            class findEmptyPosition {};
            class writeToLog {};
        };
    };
};