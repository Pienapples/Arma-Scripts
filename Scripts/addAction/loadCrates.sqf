// One time use script to "load" a set amount of objects to a vehicle, then unload them.
car1 setVariable ["vehicleLoaded", [], true]; // Setup of a variable within the vehicle.
vehicleLoad = car1 getVariable "vehicleLoaded"; // Define the array with a variable.

box addAction // The Object Variable name
[
"<img size='1.25' image='\a3\ui_f\data\igui\cfg\actions\arrow_up_gs.paa' /> Load To Vehicle", // Title, what is written in the Action Menu/Shown in Action Menu.
{ [box, car1,[-0.3,-1.1,-0.5],[1,0,0],[0,0,1]] call ER_fnc_AttachAndSetVector, vehicleLoad set [0, box], _this removeAction 0 }, // Script that's run on activation.
nil, // Arguments to pass to script if any.
10, // Priority, how high up the action menu this is listed.
true, // TitleText shown in the center of screen as players approach or have the action selected.
true, // Hide the Action Menu and TitleText after activation.
"", // Shortcut for keybinding
"true", // Condition for being able to activate the script.
2, // Radius for the action to appear.
false // Can it be seen in an unconscious state.
];

box1 addAction // The Object Variable name
[
"<img size='1.25' image='\a3\ui_f\data\igui\cfg\actions\arrow_up_gs.paa' /> Load To Vehicle", // Title, what is written in the Action Menu/Shown in Action Menu.
{ [box1, car1,[0.22,-1.15,-0.5],[-1,0,0],[0,0,1]] call ER_fnc_AttachAndSetVector, vehicleLoad set [1, box1], _this removeAction 0 }, // Script that's run on activation.
nil, // Arguments to pass to script if any.
10, // Priority, how high up the action menu this is listed.
true, // TitleText shown in the center of screen as players approach or have the action selected.
true, // Hide the Action Menu and TitleText after activation.
"", // Shortcut for keybinding
"true", // Condition for being able to activate the script.
2, // Radius for the action to appear.
false // Can it be seen in an unconscious state.
];

car1 addAction // The Object Variable name
[
"<img size='1.25' image='\a3\ui_f\data\igui\cfg\actions\arrow_down_gs.paa' /> Unload Vehicle", // Title, what is written in the Action Menu/Shown in Action Menu.
{ box attachTo [car1, [-0.3,-3.5,-0.5]], box1 attachTo [car1, [0.22,-3.5,-0.5]], detach box, detach box1, car1 setVariable ["vehicleLoaded", [], true] }, // Script that's run on activation.
nil, // Arguments to pass to script if any.
4, // Priority, how high up the action menu this is listed.
true, // TitleText shown in the center of screen as players approach or have the action selected.
true, // Hide the Action Menu and TitleText after activation.
"", // Shortcut for keybinding
"car1 getVariable ['vehicleLoaded', []] isNotEqualTo []", // Condition for being able to activate the script.
5, // Radius for the action to appear.
false // Can it be seen in an unconscious state.
];