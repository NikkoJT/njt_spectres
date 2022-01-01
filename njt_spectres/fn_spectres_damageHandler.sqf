params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

_hitTime = serverTime;
_currentDamage = damage _unit;
if (_selection != "") then {
	_currentDamage = _unit getHit _selection;
};

// Continue without dialogue if we're working on a hit that's already been processed on a different hit event or happened very recently
if !(_hitTime < ((_unit getVariable ["lastHit",0]) + 10)) then {
	// Record what time this hit happened so the previous check can happen
	_unit setVariable ["lastHit",_hitTime,true];
	
	if !(isPlayer _unit) then {
		["incomingFire",_unit,_source] remoteExec ["njt_fnc_spectres_dialogue",2];
	};
};

// Determine if the projectile is a bullet etc.
if (!(_projectile == "") and ((_projectile isKindOf "BulletBase") or (_projectile isKindOf "RocketBase"))) then {
		
		//  Determine how big it is
		_calibre = getNumber (configFile >> "CfgAmmo" >> _projectile >> "caliber");
		
		// Chonky bullet do more damage
		if (_calibre > 2) then { 
			//	systemChat "high calibre (dialogue)";
				_damage = _currentDamage + 0.2;
		} else {
				// Tiny baby bullet do less damage
			//	systemChat "low calibre (dialogue)";
				_damage = _currentDamage + 0.08;
				};
		
} else {  
		// Things that aren't bullets don't hurt much
	//	systemChat "non bullet (dialogue)";
		_damage = _currentDamage;
};
//	systemChat "final damage output";
_damage