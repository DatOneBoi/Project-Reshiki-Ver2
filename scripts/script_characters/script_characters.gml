//action library
global.actionLibrary =
{
	attack:
	{
		name: "Attack",
		description: "{0} attacks!",
		subMenu: -1,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.NEVER,
		userAnimation: "attack",
		effectSprite: spr_bonk,
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = ceil(_user.str + random_range(-_user.str * 0.25, _user.str * 0.25));
			BattleChangeHP(_targets[0], -_damage, 0);
			audio_play_sound(snd_hurt,1,false)
		}
	},
	
	words:
	{
		name: "Words",
		description: "{0} said something.",
		subMenu: "Magic",
		mpCost: 2,
		targetRequired: true,
		targetEnemyByDefault: true,
		targetAll: MODE.VARIES,
		userAnimation: "attack",
		effectSprite: spr_bonk, //change sprite to casting
		effectOnTarget: MODE.ALWAYS,
		func: function(_user, _targets)
		{
			for (var i = 0; i < array_length(_targets); i++)
			{
				var _damage = irandom_range(10,15);
				if (array_length(_targets) > 1) _damage = ceil(_damage*0.75);
				BattleChangeHP(_targets[i], -_damage);
				audio_play_sound(snd_hurt,1,false)
			}
			//BattleChangeMp(_user, -mpCost);
		}
	
	}

}

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2,
}

//party data
global.party =
[

	{
		name: "Alex",
		hp: 50,
		hpMax: 50,
		mp: 8,
		mpMax: 8,
		str: 2,
		sprites : {idle: spr_player_idle, attack: spr_player_attack, defend: spr_player_idle, down: spr_player_downed},
		actions: [global.actionLibrary.attack, global.actionLibrary.words],
		
	}

]
//enemy data
global.enemies =
{
	Spaniard: 
	{
	
		name: "Spaniard",
		hp: 20,
		hpMax: 20,
		str: 2,
		sprites : {idle: spr_spaniard, attack: spr_spaniard, defend: spr_spaniard, down: spr_spaniard},
		actions: [global.actionLibrary.attack],
		xpValue: 15,
		AIscript: function()
		{
			//attack random party member
			var _action = actions[0];
			var _possibleTargets = array_filter(obj_battle_system.partyUnits, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
			return [_action, _target]
		}
	
	}
	
}