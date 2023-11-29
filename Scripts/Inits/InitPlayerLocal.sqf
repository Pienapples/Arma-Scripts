// Script was written, documented, and designed by Pienapples for educational and direct use and requires the use of the ACE mod.
[player, true, false] call ace_arsenal_fnc_addVirtualItems; // Add the ACE Arsenal and all of the items to the player.
[player, ["NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F","optic_nightstalker","optic_tws","optic_tws_mg"]] call ace_arsenal_fnc_removeVirtualItems; // Remove items in the array from the ACE Arsenal.
arsenal = {[player, player, false] call ace_arsenal_fnc_openBox}; // Assigning a variable to call, that simply "Opens" the ACE Arsenal
inMainBase = {player inArea "mainBase"}; // Assigning a variable for a True/False statement to check if a player is in a predefined area.

// Create the Classes within ACE Menu
errorMenuClass = ["errorClass","404 Menu","","",{true}] call ace_interact_menu_fnc_createAction; // Assign a menu in ACE, a variable to be called later.
[player, 1,["ACE_SelfActions"],errorMenuClass] call ace_interact_menu_fnc_addActionToObject; // Add the previous menu created to the ACE Self-Interact menu.
teleportMenuClass = ["teleportClass","Teleports","","",inMainBase] call ace_interact_menu_fnc_createAction; // Assign a menu in ACE, a variable to be called later.
[player, 1,["ACE_SelfActions", "errorClass"],teleportMenuClass] call ace_interact_menu_fnc_addActionToObject; // Add the new menu created to the ACE Self-Interact menu and further the previous "404 Menu."
callsignMenuClass = ["callsignClass","Callsigns","","",{true}] call ace_interact_menu_fnc_createAction; // Assign a menu in ACE, a variable to be called later.
[player, 1,["ACE_SelfActions", "errorClass"],callsignMenuClass] call ace_interact_menu_fnc_addActionToObject; // Add the new menu created to the ACE Self-Interact menu and further the previous "404 Menu."
// This code essentially creates a new menu in Self-Interact called "404 Menu" then when hovered over or selected spits out two new menus defined as "Teleports" and "Callsigns."

// Create the Arsenal to be accessed
playerArsenal = ["BaseArsenal","Arsenal","",arsenal,inMainBase] call ace_interact_menu_fnc_createAction; // Assign a menu in ACE, a variable to be called later, using the previous variable "arsenal."
[player, 1,["ACE_SelfActions", "errorClass"], playerArsenal] call ace_interact_menu_fnc_addActionToObject; // Add the new menu created to the ACE Self-Interact menu and further the previous "404 Menu."
// This code is essentially the same as above but when clicked / released on the "Arsenal" it will run the statement code from the variable "arsenal" and open the ACE Arsenal.

// Everything beyond this point is a bit more advanced using more advanced scripting techniques, however I have done my best to document them
// all to the best of my ability to give as much detail as to what is happening in each

/*
_x params ["_teleportPoint", "_name"];
//-->
private _teleportPoint = _x select 0;
private _name = _x select 1;
*/
// 'params' and 'select' are the same thing however it's easier to write params for a multitude of items for something like;
// params ["_1st",.....,"_10th"];
// Than to write 10 lines of;
/*
_1st = this select 0;
..
_10th = this select 9;
*/

// Create the Teleports around "Main Base"
{
    _x params ["_target", "_name"]; // As previously mentioned these can be written differently as two 'select' variables rather than one params.
    private _action = [_name, _name, "", // Name is grabbed from the forEach statement defined below, to use for the functions 'action name' and 'displayed name.' it is "1" so it will always be the second value in the 'forEach.'
{
    params ["_actionTarget", "_player", "_actionParams"]; // Better described below.
    _actionParams params ["_target"];
    player setPosATL (getPosATL _target); // The "Teleport" gets the position of the defined object, then sets the players position to the value, Target is grabbed below from the forEach.
}, inMainBase, nil, _target] call ace_interact_menu_fnc_createAction; // Writing nil or {} is the same but required so we can use the Action Parameters argument.
    [player, 1, ["ACE_SelfActions", "errorClass", "teleportClass"], _action] call ace_interact_menu_fnc_addActionToObject; // Assigning a new interactable option to the "Teleport Menu" that can be a near infinite number of teleports defined by the 'forEach.'
} forEach [
    [MBTP, "Main Base"],
    [HPTP, "Helipads"],
	[LATP, "Light Armour"],
	[HBTP, "Hanger Bay"],
	[ATTP, "Artillery"]
]; // _x is a globalVariable for 'forEach' statements.
/*
{
    params ["_target", "_player", "_actionParams"]; 
// params 
//_target <- Where current action is attached, 
//_player <- player who uses current action
//_actionParams args that are sent to action , can be used in condition, statement
 _actionParams params ["_firstSendArg"];
// params of _actionParams, its array of args. So you define what ever you want to them to use in statement/conditions.
    player setPosATL (getPosATL _firstSendArg); // and use args in statement from _actionParams.
}
*/

// Using everything from above we can do the same thing but for "Groups" in arma to assign them names/callsigns
{
    _x params ["_callsign", "_name"];
    private _action = [_name, _name, "",
{
    params ["_actionTarget", "_player", "_actionParams"];
    _actionParams params ["_callsign"];
    group player setGroupIdGlobal [_callsign]; // Finds the group of the player then sets the Group ID to what is defined below in the 'forEach.'
}, {true}, nil, _callsign] call ace_interact_menu_fnc_createAction; // Condition is set to always be true so they can be changed whenever.
    [player, 1, ["ACE_SelfActions", "errorClass", "callsignClass"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach [
    ["PAPA BEAR", "High Command"], // The first value is what the GroupID is set to, the second value is what is displayed in the Menu.
    ["ODIN", "Zeus"],
    ["SUNLIGHT", "Command"],
	["DAGGER", "Infantry"],
	["ANGEL", "Medievac"],
	["THUNDER", "CAS Fixed"],
	["GUNSLAVE", "CAS Rotary"],
	["IRONCLAD", "Armour"]
];