// A simple holdAction script for an object named "myLaptop" that let's you "hack" and tells you when you've completed it as well as if you
// were interrupted during the "hacking" process.

// Use as a base for understanding the parameters for holdActions
[
	myLaptop, // Object the action is attached too. (Variable Name)
	"Hack Laptop", // Title of the Action. (What you see on screen and in context menu)
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", // Idle icon shown on screen.
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", // Progress icon shown on screen.
	"_this distance _target < 3", // Condition for the action to be shown. (Check if the player (_target_) is within 3m)
	"_caller distance _target < 3", // Condition for the action to progress. (Check if the player (_caller) stays within 3m)
	{ _caller playMove "Acts_Accessing_Computer_in", _caller playMove "Acts_Accessing_Computer_Loop" }, // Code executed when action starts.
	{}, // Code executed on every progress tick.
	{ _this call hint "Computer Hacked", _caller playMoveNow "Acts_Accessing_Computer_Out_Short" }, // Code executed on completion.
	{ _this call hint "Hack Incomplete.", _caller playMoveNow "Acts_Accessing_Computer_Out_Short" }, // Code executed on interrupted.
	[], // Arguments passed to the scripts as _this select 3
	10, // Action duration in seconds.
	10, // Priority (How high up the context menu list the action is listed. 0 = lowest priority. (bottom of list))
	true, // Remove on completion.
	false // Show in unconscious state.
] remoteExec ["BIS_fnc_holdActionAdd", 0, myLaptop]; // MP compatible implementation.