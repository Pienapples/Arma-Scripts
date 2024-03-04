//Create using ACRE a list of languages for Babel and apply to them a side, BLUFOR/OPFOR/IND/CIVPOP and create Translators.
private _availableLanguages = [
    ["en", "English"],
    ["fr", "French"],
    ["ru", "Russian"],
    ["fa", "Farsi"]
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
                ["en","fr"], // BLUFOR spoken and speaking languages
                ["ru", "fa"], // OPFOR spoken and speaking languages
                ["fr"], // Independent spoken and speaking languages
                ["fr"] // CIVPOP spoken and speaking languages
            ];

            _playerLanguages = _defaultLanguages param [[west,east,resistance,civilian] find playerSide, ["fi"]];
        };

        [acre_api_fnc_babelSetSpokenLanguages, _playerLanguages] call CBA_fnc_directCall;
    };
};

// Use the code commented below to create a translator. The code block goes inside of the init of the UNIT which you want to be the translator.
// this setVariable ["mission_languages", ["en", "fr", "ru", "fa"]];