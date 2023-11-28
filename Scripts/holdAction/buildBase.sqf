[
	baseFlag, // Object the action is attached too.
	"Build Base", // Title of the Action.
	"\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
	"\a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
	"_this distance _target < 5", "_caller distance _target < 5",
	{}, {},
	{ execVM "Scripts\base.sqf" }, // execute another script, that "builds" the base.
	{}, [],
	2, 10,
	true, false
] remoteExec ["BIS_fnc_holdActionAdd", 0, baseFlag]; // MP compatible implementation.