[
	quarterMaster, // Object the action is attached too. (Variable Name)
	"Change your Equipment", // Title of the Action. (What you see on screen and in context menu)
	"a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa","a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa", // Idle Icon & Progress Icon.
	"_this distance _target < 7", // Condition for the action to be shown. (Check if the player (_target) is within 7m)
	"_caller distance _target < 7", // Condition for the action to progress. (Check if the player (_caller) stays within 7m)
	{},{}, // Code Executed when action starts and every tick.
	{[_this] execVM "Scripts\ExecVM\arsenal.sqf"}, // Code excuted on completion.
	{}, // Code executed on interrupted.
	[], // Arguments passed to the scripts as _this select 3
	0.5, // Action duration in seconds.
	0, // Priority (How high up the context menu list the action is listed. 0 = lowest priority. (bottom of list))
	false, // Remove on completeion
	false // Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, quarterMaster]; // MP Compatible implementation