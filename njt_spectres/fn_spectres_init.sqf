// This function is called when a Spectre team is activated from a terminal.

params ["_target","_caller"];

_spectresList = [];

// Detect what terminal is being used and get the group associated with it

switch (vehicleVarName _target) do {
	case "spectres_terminalA"	: {
		_spectresList = njt_spectres_listA;
	};
	case "spectres_terminalB"	: {
		_spectresList = njt_spectres_listB;
	};
	case "spectres_terminalC"	: {
		_spectresList = njt_spectres_listC;
	};
	case "spectres_terminalD"	: {
		_spectresList = njt_spectres_listD;
	};
	case "spectres_terminalE"	: {
		_spectresList = njt_spectres_listE;
	};
};

// Run setup on Spectres to be activated - enable their simulation and give them all their special attributes.
{
	_spectre = missionNamespace getVariable [_x,objNull];
	if (isNull _spectre) exitWith {};
	
	_spectre enableSimulationGlobal true;

	private _name = (_spectresList get str _spectre);

	[_spectre,_name] remoteExec ["setName",0,true];
	[_spectre,1.5] remoteExec ["setAnimSpeedCoef",0,true];
	[_spectre,false] remoteExec ["enableAimPrecision",0,true];
	[_spectre,false] remoteExec ["enableStamina",0,true];
	[_spectre,false] remoteExec ["enableFatigue",0,true];
	[_spectre,0] remoteExec ["setCustomAimCoef",0,true];
	[_spectre,"NoVoice"] remoteExec ["setSpeaker",0,true];
	[_spectre,"UP"] remoteExec ["setUnitPos",0,true];
	[_spectre,"RADIOPROTOCOL"] remoteExec ["disableAI",0,true];
	[_spectre,false] remoteExec ["setCaptive",0,true];

	// This is the damage handler that makes them harder to kill
	[_spectre,["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
		
		_finalDamage = [_unit, _selection, _damage, _source, _projectile, _hitIndex, _instigator, _hitPoint] call njt_fnc_spectres_damageHandler;
		
		_finalDamage;
		
		}]
	] remoteExec ["addEventHandler",0,true];
	
	// Add them to the group of the person who activated the terminal.
	[_spectre] join _caller;
	sleep 0.5;
	["spectreJoin",_spectre] remoteExec ["njt_fnc_spectres_dialogue",(group _spectre)];
	
	// Don't shake the lightbulb
	[_spectre,
		[	"Talk to Spectre",	// title
			{
				params ["_target", "_caller", "_actionId", "_arguments"];
				["spectreTalk",_target] remoteExec ["njt_fnc_spectres_dialogue",(side _target)]; // script
			},
			nil,		// arguments
			1.5,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"(side _this) == (side _target)", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint};
	]] remoteExec ["addAction",0,true];
	
	// Fireteam leaders can recruit Spectres from other fireteams
	[_spectre,
		[	"Add Spectre to fireteam",	// title
			{
				params ["_target", "_caller", "_actionId", "_arguments"];
				[_target] join _caller;
				sleep 0.5;
				["spectreJoin",_target] remoteExec ["njt_fnc_spectres_dialogue",(group _caller)];
			},
			nil,		// arguments
			1.5,		// priority
			true,		// showWindow
			true,		// hideOnUse
			"",			// shortcut
			"((side _this) == (side _target)) && {(_this == (leader _this)) && !(_this == leader _target)}", 	// condition
			3,			// radius
			false,		// unconscious
			"",			// selection
			""			// memoryPoint};
	]] remoteExec ["addAction",0,true];

	
} forEach keys _spectresList;