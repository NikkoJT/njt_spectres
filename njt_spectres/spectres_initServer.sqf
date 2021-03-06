// NJT_SPECTRES
// Resilient, quippy AI allies for use in Arma 3 missions.
// This script should be run from init.sqf (with an isServer check) or initServer.sqf


// Define the units to be used, their teams (used for terminal associations) and names
_spectreTeamA = [
	
	["unitSPECTRE_Foehammer",["419 Foehammer","419","Foehammer"]],
	["unitSPECTRE_Redjack",["243 Redjack","243","Redjack"]],
	["unitSPECTRE_Dare",["597 Dare","597","Dare"]]
];

_spectreTeamB = [
	["unitSPECTRE_Lopez",["270 Lopez","270","Lopez"]],
	["unitSPECTRE_Epsilon",["061 Epsilon","061","Epsilon"]],
	["unitSPECTRE_Texas",["060 Texas","060","Texas"]]
];

_spectreTeamC = [
	["unitSPECTRE_Moose",["333 Moose","333","Moose"]],
	["unitSPECTRE_Ducky",["201 Ducky","201","Ducky"]],
	["unitSPECTRE_Crispy",["368 Crispy","368","Crispy"]]
];

_spectreTeamD = [
	["unitSPECTRE_Phoebe",["003 Phoebe","003","Phoebe"]],
	["unitSPECTRE_Spyglass",["422 Spyglass","422","Spyglass"]],
	["unitSPECTRE_Bishop",["121 Bishop","121","Bishop"]]
];

_spectreTeamE = [
	["unitSPECTRE_Shocker",["069 Shocker","069","Shocker"]],
	["unitSPECTRE_Steffie",["111 Steffie","111","Steffie"]],
	["unitSPECTRE_Windblade",["057 Windblade","057","Windblade"]]
];

// Turn these into hashmaps for performance etc and make them public so all clients can use them
njt_spectres_listA = createHashMapFromArray _spectreTeamA;
njt_spectres_listB = createHashMapFromArray _spectreTeamB;
njt_spectres_listC = createHashMapFromArray _spectreTeamC;
njt_spectres_listD = createHashMapFromArray _spectreTeamD;
njt_spectres_listE = createHashMapFromArray _spectreTeamE;
publicVariable "njt_spectres_listA";
publicVariable "njt_spectres_listB";
publicVariable "njt_spectres_listC";
publicVariable "njt_spectres_listD";
publicVariable "njt_spectres_listE";

// Make a combined list of all Spectres for later use
_spectresAllTeams = (_spectreTeamA + _spectreTeamB + _spectreTeamC + _spectreTeamD + _spectreTeamE);
njt_spectres_listAll = createHashMapFromArray _spectresAllTeams;
publicVariable "njt_spectres_listAll";

// Perform initial setup on all Spectres
{
	_spectre = missionNamespace getVariable [_x,objNull];
	_spectre enableSimulationGlobal false;
	[_spectre,true] remoteExec ["setCaptive"];
} forEach keys njt_spectres_listAll;

// Add the dialogue EH for when Spectres get kills
addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	
		// You can add a faction check (NOT SIDE) on _unit as well if you don't want Spectres to brag about friendly fire.
		if ((str _killer in keys njt_spectres_listAll) && (_unit isKindOf "Man")) then {
					["targetKilled",_killer] remoteExec ["njt_fnc_spectres_dialogue",2];
		};
}];

// Add action to terminals for activating Spectres.
{
	[_x,
	"Activate Spectre team",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"((_target distance _this) < 5) && !(_target getVariable [""spectres_terminalActivated"",false])",
	"((_target distance _this) < 5) && !(_target getVariable [""spectres_terminalActivated"",false])",
	{},
	{},
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target,_caller] call njt_fnc_spectres_init;
		_target setVariable ["spectres_terminalActivated",true,true];
	},
	{},
	[],
	3,
	0,
	false,
	false,
	true
	] remoteExec ["BIS_fnc_holdActionAdd",0,true];
} forEach [spectres_terminalA,spectres_terminalB,spectres_terminalC,spectres_terminalD,spectres_terminalE];