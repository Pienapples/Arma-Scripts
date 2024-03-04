private _availableLanguages = [
    ["en", "English"],
    ["ru", "Russian"],
    ["fr", "French"]
];

{
    _x call acre_api_fnc_babelAddLanguageType;
} forEach _availableLanguages;

if (hasInterface) then {
    [] spawn {
        waitUntil {!isNull player};

        private _playerLanguages = player getVariable ["mission_languages", []];
        if (_playerLanguages isEqualTo []) then {
            private _defaultLanguages = [
                ["en"], // BLUFOR side STARTS with these languages already known.
                ["ru"], // OPFOR side STARTS with these languages already known.
                ["fr"], // Independent side STARTS with these languages already known.
                ["fr"] // CIVPOP side STARTS with these languages already known.
            ];

            _playerLanguages = _defaultLanguages param [[west,east,resistance,civilian] find playerSide, ["en"]];
        };

        [acre_api_fnc_babelSetSpokenLanguages, _playerLanguages] call CBA_fnc_directCall;
    };
};

// Add this line into the `init` section of the player character you wish to be a translator or have multiple extra languages they can speak.
// this setVariable ["mission_languages",["en", "ru", "fr"]];