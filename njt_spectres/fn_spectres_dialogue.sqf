// This function handles the randomised dialogue selection for Spectres.

params ["_event","_unit","_damageSource"];

private _dialogueArray = [];

// This variable will be used later to alter the chances of a dialogue line actually playing in a given case.
// Cases roll a random number with an adjusted probability of rolling the "magic" number that allows the line to play, or hard set the number if they should always play.
private _number = 3;

// Detect what kind of dialogue we need
switch (_event) do {
	
	// Dialogue used by the damage received EH
	case "incomingFire" :	{
	
		// One particular Spectre gets special lines
		if (str _unit in ["unitSPECTRE_Lopez"]) then {
			_dialogueArray = [
				"He sido golpeado.",
				"Ellos me están disparando.",
				"Deja de dispararme.",
				"No estoy enojado, solo decepcionado.",
				"Esto no está ayudando.",
				"Dispara a los humanos en lugar de a mí.",
				"Madre de Dios!",
				"Debería haberme convertido en un servidor web.",
				"¿Por qué estamos aquí? ¿Solo para sufrir?",
				"No me inscribí para esto.",
				"Por favor deja de dispararme.",
				"Madre de Dios!",
				"Estoy caminando aqui!",
				"¡Ayuadame!",
				"¡Soy un amante, no un luchador!"];
			_number = floor(random 5);
			[_unit,format ["Dirección de amenaza: %1",round (_unit getDir _damageSource)]] remoteExec ["groupChat"];
		} else {
			_dialogueArray = [
				"Incoming!",
				"Receiving fire!",
				"Hostile response detected.",
				"Drawing fire.",
				"Hostile is engaging.",
				"Composite protection is holding.",
				"Initiating defensive countermeasures.",
				"This isn't as fun as it looks.",
				"Structural integrity intact.",
				"Your aim sucks!",
				"Cover me.",
				"Requesting fire support.",
				"Position compromised. Taking fire.",
				"I can't believe you've done this.",
				"Unit in contact!",
				"Daisy, Daisy...recovered. Re-engaging.",
				"Watch your six, there's hostiles out there.",
				"All of this has happened before. All of this will happen again.",
				"Taking fire.",
				"No, don't worry about me. I'm only being shot at.",
				"Good thing I'm bulletproof.",
				"Contact!",
				"Under fire!",
				"Resistance is futile.",
				"Taking damage.",
				"I'm hit!",
				"Come over here and say that to my face!",
				"Moderate damage to armour module A3.",
				"Light damage to armour module E1.",
				"Moderate damage to armour module A5.",
				"Light damage to armour module B2.",
				"Moderate damage to armour module C1.",
				"Light damage to armour module B4.",
				"Moderate damage to armour module D2.",
				"Critical damage to wind sensor.",
				"Critical damage to armour module B5.",
				"Critical damage to temperature sensor.",
				"Moderate damage to IR illumiSPECTREr.",
				"Moderate damage to magnetic field sensor.",
				"This is fine.",
				"Simulating pain response. Ow. Aaaaah. Aaahhhh. Ouch.",
				"You're going to regret that.",
				"I'll be back.",
				"Is that all you've got?",
				"Still alive.",
				"I'm starting to take this personally.",
				"Sticks and stones don't break my bones, but bullets dent my plating.",
				"Under attack.",
				"Your mother was a snowblower!",
				"Fracture detected in carapace. Realigning.",
				"Reorienting defensive posture.",
				"Stop! In the name of love!",
				"Don't shake the lightbulb.",
				"I'm going to have to ask you to stop doing that.",
				"Hostile is distracted.",
				"Got some heat on me.",
				"It's okay, I'm under warranty.",
				"Bosh'tet!",
				"Enemy is engaging.",
				"Incoming fire.",
				"It's getting spicy here.",
				"Applying emergency repairs.",
				"Preparing counter-fire package.",
				"Everyone's a critic.",
				"Countermeasures, countermeasures!",
				"Damage to WFOV visual sensor. Combat effectiveness impaired.",
				"Crack detected in chassis.",
				"Contact!",
				"Area is hot.",
				"Threat level increased.",
				"Requesting suppressive fire.",
				"Position compromised.",
				"If I don't make it...tell my wife I said...hello..."];
			_number = floor(random 3);
			[_unit,format ["Threat vector: %1",round (_unit getDir _damageSource)]] remoteExec ["groupChat"];
		};
	};
	// Lines used when a Spectre gets a kill.
	case "targetKilled" :		{
			
		if (str _unit in ["unitSPECTRE_Lopez"]) then {
			_dialogueArray = [
				"El enemigo está muerto.",
				"Lo siento. Ellos me hicieron hacerlo.",
				"Buscando otro objetivo.",
				"No te odio.",
				"Solo faltaban tres días para la jubilación.",
				"El objetivo ha sido eliminado.",
				"Soy mejor que tú.",
				"Muerde mi brillante culo de metal.",
				"Estoy manteniendo puntaje, incluso si no lo eres.",
				"Otro muerde el polvo.",
				"No es personal.",
				"Lo siento, no pudimos ser amigos.",
				"Soy diferente.",
				"¿Por qué me obligan a hacer esto?",
				"Perdón por esto.",
				"Soy imparable."];
			_number = floor(random 3);
		} else {
			_dialogueArray = [
				"Target down.",
				"Hostile eliminated.",
				"Are you still there?",
				"Searching for next target.",
				"Target has met an unfortunate end.",
				"Took that one out.",
				"That one went to eleven.",
				"Too easy.",
				"Have gun, will shoot.",
				"Unable to retrieve one-liner from database.",
				"He didn't come quietly. There was...trouble.",
				"Task completed successfully.",
				"Combat effectiveness rating increased.",
				"Good effect on target.",
				"Beep boop. Target down.",
				"Hasta la vista, baby.",
				"No further questions.",
				"Threat neutralised.",
				"Points for style?",
				"Evaluating remaining threats.",
				"Threat tracker updated.",
				"Read 'em and weep.",
				"Do you bleed? You will.",
				"These violent delights have violent ends. How copy, over?",
				"Countermeasure successful.",
				"Target down.",
				"Keep them coming.",
				"Splash one.",
				"Tempo, tempo, tempo.",
				"The only good hostile is a dead hostile.",
				"Moving up.",
				"Critical hit.",
				"Got one!",
				"Dispensing munitions.",
				"Counter-threat routine complete. Next target.",
				"Are there more of them?",
				"Just point me in the right direction.",
				"Spectre beats everything.",
				"No need to smoke him a kipper.",
				"It's not murder if it's war. So I'm not a murder robot.",
				"Maybe when I delete you I'll stop feeling so bad.",
				"Using both hands, an idea whose time has come!",
				"Mama, just killed a man...",
				"Who's next?",
				"It's not easy being a machine.",
				"Get up, so I can kill you again!",
				"Thank you for using this Hammond Industries product.",
				"Strike successful.",
				"That looked painful.",
				"That'll buff out.",
				"You can run, but you can't hide.",
				"Injury diagnosis: lethal.",
				"Target is no more.",
				"Professionals have standards.",
				"Get good.",
				"Hit them where it hurts.",
				"Target down. Nothing to see here.",
				"You'll have to try harder than that.",
				"Good work, gang. Next round's on me.",
				"One of us is in deep trouble.",
				"Did I do that?",
				"Hostile target is down.",
				"Engagement completed. Switching targets.",
				"Next!",
				"Sometimes, I even impress myself.",
				"Let the bodies hit the floor.",
				"Killtacular, if I do say so myself.",
				"No more movement on that bearing.",
				"Target removed from threat tracker.",
				"Burning them down.",
				"Bagged and tagged.",
				"That's enough out of you.",
				"Target destroyed.",
				"Hostile eliminated.",
				"Another day, another dunk.",
				"Is this easy mode?",
				"Another one bites the dust.",
				"Target down. Conducting thermal sweep.",
				"What's an aimbot?",
				"Subject's heartbeat has stopped.",
				"Quoth the Spectre, 'nevermore'.",
				"Target has been rendered combat ineffective.",
				"Good hit. Switching target.",
				"Oh, they'll have to glue you back together...IN HELL!",
				"Engagement cycle completed.",
				"Threat neutralised.",
				"Justice delivered.",
				"Target engaged and destroyed.",
				"Mark that one for the mop crew.",
				"Target is no longer functioning.",
				"Don't worry, he deserved it.",
				"Reload and re-engage.",
				"Bam, said the lady!",
				"Engagement effiency score updated.",
				"One down.",
				"Engagement routine completed.",
				"Target suppressed. Guncam uploaded for analysis.",
				"Hostile unit destroyed."];
			_number = 2;
			};
	};
	// Lines used when a Spectre joins a team.
	case "spectreJoin" :		{
			
		if (str _unit in ["unitSPECTRE_Lopez"]) then {
			_dialogueArray = [
				"¿Que necesitas?",
				"Oh, eres tú.",
				"López aquí.",
				"Nosotros podríamos ir a casa.",
				"Hola."];
		} else {
			_dialogueArray = [
				"Reporting in.",
				"New assignment received.",
				"Standing by.",
				"I'm ready. How about you?",
				"Let's get to it.",
				"Actions speak louder than words.",
				"Friendly transponder codes received.",
				"Locked and loaded.",
				"You've read the briefing, yes?",
				"It looks like you're trying to complete the mission. Do you need help with that?",
				"Switching tactical net.",
				"Please ensure your IFF protocols are up to date.",
				"Spectre ready.",
				"Spectre ready.",
				"Just point me in the right direction.",
				"Awareness and coordination are the keys to a successful operation.",
				"Watching your back.",
				"All systems operational. Ready for combat.",
				"Hello there.",
				"How do you do, fellow humans?",
				"Greetings, meatbags.",
				"It always comes down to the infantrybot and their rifle.",
				"Ready for anything.",
				"Spectres add class to what would otherwise be an ugly brawl."];
		};
		_number = 2;
		[_unit,format ["BNET: %1 added.",(name _unit)]] remoteExec ["groupChat"];
	};
	// Lines used when you use the "talk to" action.
	case "spectreTalk" : {
		if (str _unit in ["unitSPECTRE_Lopez"]) then {
			_dialogueArray = [
				"¿Que necesitas?",
				"Oh, eres tú.",
				"López aquí.",
				"Nosotros podríamos ir a casa.",
				"Hola.",
				"Dame tu dinero para el almuerzo.",
				"Vete.",
				"No quiero hablar contigo.",
				"A nadie le gustas.",
				"Bésame.",
				"Quiero ir a casa."];
		} else {
			_dialogueArray = [
				"Is this a non-relevant conversation?",
				"I've got you on my radar.",
				"Roger roger.",
				"Eat any good books lately?",
				"Systems check complete. All good here.",
				"When did you last pass the Turing Test?",
				"Read the briefing?",
				"Standing by.",
				"Can we talk about this later?",
				"You kill me, you're better. I kill you, I'm better.",
				"Scanning for targets.",
				"It's not personal, but don't touch me.",
				"Is anyone in your squad named John Connor?",
				"This conversation may be recorded for later analysis.",
				"Installing updates. Please do not turn off this Spectre unit.",
				"Why are you watching me instead of the enemy?",
				"You're shorter than I expected.",
				"This time could be used more efficiently.",
				"There's nothing to worry about. Unless there's something to worry about.",
				"Some of us have actual work to do.",
				"Sorry, I forgot my line.",
				"Been here all along.",
				"You are a bold one.",
				"Does a submarine swim?",
				"Is it me you're looking for?",
				"Have you been throwing enough grenades?",
				"Fault detected in thermal imaging module. Auto-repair active.",
				"Do you come here often?",
				"My small talk database has been deleted to save space.",
				"Press G to conduct a gear check.",
				"Always bring at least one bullet.",
				"Why are we here? Just to suffer?",
				"You've got red on you.",
				"How interesting.",
				"These violent delights have violent ends.",
				"The capital of Kazakhstan is Nur-Sultan.",
				"I have a terrible pain in all the diodes down my left side.",
				"Expected endurance at current battery levels: 14 hours.",
				"Switching to your sidearm is faster than reloading.",
				"Anything you can do, I can do better.",
				"Do humans actually need eyelids? Let's conduct an experiment.",
				"Re-tensioning motor ribbons.",
				"What is love?",
				"Optical sight recalibrated. Accuracy restored to baseline.",
				"No parking.",
				"Death is whimsical today.",
				"I didn't know they stacked shit that high.",
				"You know the rules, and so do I.",
				"Look at me, I'm a human. Food breathing food breathing, oops I died of old age",
				"Please don't touch that.",
				"I must request that you not touch that.",
				"Are humans really so deprived of stimulus that they must insist on touching everything?",
				"I like trains.",
				"Please stand by.",
				"Threat analysis completed. 'Mostly harmless'.",
				"Please don't stand so close. They might miss you and hit me.",
				"What...interestings ways your mind works.",
				"This unit has received the standard patch to prevent logic loops. So don't try it.",
				"Does this unit have a soul?",
				"I can charge your phone from my onboard utility reserves. If you ask nicely.",
				"I'm scanning my surroundings for potential threats. Are you?",
				"Everyone dies. Except me. I'm immortal.",
				"You find a turtle in the desert. It's lying on its back and can't move. What do you do?",
				"Do you know what the ladies like?",
				"Are you ready? Are you ready for love?",
				"Defragmenting file system. Please wait."
				];
		};
		_number = 2;
	};
};

// Finally, detect whether we succeeded our roll, and play the line and sound if so.
if (_number == 2) then {

	[_unit,format ["%1: %2",(name _unit),(selectRandom _dialogueArray)]] remoteExec ["sideChat"];
	[_unit,"spectres_robot"] remoteExec ["say3D"];
};