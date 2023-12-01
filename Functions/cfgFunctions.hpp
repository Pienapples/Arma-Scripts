// To be able to use Functions in any scripts throughout the mission file, you need to define the cfgFunctions in the description.ext file inside the mission folder.
class ER
{
    tag ="ER"; // The prefix used when calling the function; ER_fnc_myFunction
    class Clients
    {
        file = "Functions\Clients"; // File path to the function
        class AttachAndSetVector {}; // Follows the same name as the .sqf without the "fn_" at the start.
    };
};