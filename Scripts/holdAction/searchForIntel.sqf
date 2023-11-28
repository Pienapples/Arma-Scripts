// A simple addAction script that let's any unit defined as "squadLeader" to have a search for intel action once they have died.
[
	squadLeader,
	"Search For Intel",
	"\a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa", // Magnifying Glass Icon
	"\a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa",
	"(_this distance _target < 3) && (!alive squadLeader)", // Check if the player (_target) is within 3m AND if the object is destroyed/dead
	"_caller distance _target < 3",
	{}, {},
	{ _this call hint "Intel Found!" }, // Code executed on completion.
	{ _this call hint "Search incomplete." }, // Code executed on interrupted.
	[],
	5, 10,
	true, false
] remoteExec ["BIS_fnc_holdActionAdd", 0, squadLeader];