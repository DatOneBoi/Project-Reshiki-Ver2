instance_deactivate_all(true);
audio_pause_all();

audio_play_sound(bgm_battle, 1, 0);

units = [];
turn = 0;
unitTurnOrder = [];
unitRenderOrder = [];

turnCount = 0;
roundCount = 0;
battleWaitTimeFrames = 30;
battleWaitTimeRemaining = 0;
currentUser = noone;
currentAction = 0;
currentTargets = noone

battleText = "";

//make targeting cursor
cursor = 
{
	activeUser: noone,
	activeTarget: noone,
	activeAction: -1,
	targetSide: -1,
	targetIndex: 0,
	targetAll: false,
	confirmDelay: 0,
	active: false,
}

//make enemies
for (var i = 0; i < array_length(enemies); i++)
{
	enemyUnits[i] = instance_create_depth(x+250+(i*10), y+110+(i*20), depth-10, obj_battle_unit_enemy, enemies[i])
	array_push(units, enemyUnits[i]);
	
}

//make party
for (var i = 0; i < array_length(global.party); i++)
{
	partyUnits[i] = instance_create_depth(x+30+(i*10), y+110+(i*20), depth-10, obj_battle_unit_pc, global.party[i])
	array_push(units, partyUnits[i]);
	
}

//shuffle turn order
unitTurnOrder = array_shuffle(units);

//get render order

RefreshRenderOrder = function()
{
	unitRenderOrder = [];
	array_copy(unitRenderOrder, 0, units, 0, array_length(units));
	array_sort(unitRenderOrder, function(_1, _2)
	{
		return _1.y - _2.y;
	}
	);

}
RefreshRenderOrder();


function BattleStateSelectAction()
{
	if (!instance_exists(obj_menu))
	{
		//get current unit
		var _unit = unitTurnOrder[turn];
	
		//is the unit dead or unable to act?
		if (!instance_exists(_unit)) || (_unit.hp <=0)
		{
			battleState = BattleVictoryCheck;
			exit;
		}
	
		//select an action to perform
		//BeginAction(_unit.id, global.actionLibrary.attack, _unit.id)
	
		//if unit is player controlled:
		if (_unit.object_index == obj_battle_unit_pc)
		{
				////attack random party member
				//var _action = global.actionLibrary.attack;
				//var _possibleTargets = array_filter(obj_battle_system.enemyUnits, function(_unit, _index)
				//{
				//	return (_unit.hp > 0);
				//});
				//var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
				//BeginAction(_unit.id, _action, _target);
				
				//compile the action menu
				var _menuOptions = [];
				var _subMenus = {};
				
				var _actionlist = _unit.actions;
				
				for (var i = 0; i < array_length(_actionlist); i++)
				{
					var _action = _actionlist[i];
					var _available = true;
					var _nameAndCount = _action.name;
					if (_action.subMenu == -1)
					{
						array_push(_menuOptions, [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
					}
					else
					{
						//create or add to a submenu
						if (is_undefined(_subMenus[$ _action.subMenu]))
						{
							variable_struct_set(_subMenus, _action.subMenu, [[_nameAndCount, MenuSelectAction, [_unit, _action], _available]]);
						}
						else
						{
							array_push(_subMenus[$ _action.subMenu], [_nameAndCount, MenuSelectAction, [_unit, _action], _available]);
						}
					}
				}
				
					//turn sub menus into an array
					var _subMenusArray = variable_struct_get_names(_subMenus);
					for (var i = 0; i < array_length(_subMenusArray); i++)
					{
						//sort submenu if needed
						//(here)
						
						//add the back option at the end of each subMenu
						array_push(_subMenus[$ _subMenusArray[i]], ["Back", MenuGoBack, -1, true]);
						//add submenu into main menu
						array_push(_menuOptions, [_subMenusArray[i], SubMenu, [_subMenus[$ _subMenusArray[i]]], true]);
					}	
				
				Menu(x+10, y+140, _menuOptions, , 74, 64);
		}
		else
		{
			//if unit is AI controlled:
			var _enemyAction = _unit.AIscript();
			if (_enemyAction != 1) BeginAction(_unit.id, _enemyAction[0], _enemyAction[1]);
		
		}
	}
}

function BeginAction(_user, _action, _targets)
{
	currentUser = _user;
	currentAction = _action;
	currentTargets = _targets;
	battleText = string_ext(_action.description, [_user.name]);
	if (!is_array(currentTargets)) currentTargets = [currentTargets];
	battleWaitTimeRemaining = battleWaitTimeFrames;
	with (_user)
	{
		acting = true;
		//play user animation if it is defined for the action, and that user
		if (!is_undefined(_action[$ "userAnimation"])) && (!is_undefined(_user.sprites[$ _action.userAnimation]))
		{
			sprite_index = sprites[$ _action.userAnimation];
			image_index = 0;
		}
	}
	battleState = BattleStatePerformAction;
}

function BattleStatePerformAction()
{

	//if animation ect is still playing
	if(currentUser.acting)
	{
		//when it ends, perform action effect if it exists
		if (currentUser.image_index >= currentUser.image_index -1)
		{
			with(currentUser)
			{
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			
			if (variable_struct_exists(currentAction, "effectSprite"))
			{
				if (currentAction.effectOnTarget == MODE.ALWAYS) || ((currentAction.effectOnTarget == MODE.VARIES) && (array_length(currentTargets) <= 1))
				{
					for (var i = 0; i < array_length(currentTargets); i++)
					{
						instance_create_depth(currentTargets[i].x,currentTargets[i].y,currentTargets[i].depth-1,obj_battle_effect,{sprite_index : currentAction.effectSprite});
					}
				}
				else //play it at 0,0
				{
					var _effectSprite = currentAction.effectSprite
					if (variable_struct_exists(currentAction, "effectSpriteNoTarget")) _effectSprite = currentAction.effectSpriteNoTarget;
					instance_create_depth(x,y,depth-100,obj_battle_effect,{sprite_index : _effectSprite});
				}
			}
			currentAction.func(currentUser, currentTargets);
		}
	}
	else //wait for delay and then end the turn
	{
		if (!instance_exists(obj_battle_effect))
		{
			battleWaitTimeRemaining--
			if (battleWaitTimeRemaining == 0)
			{
				battleState = BattleVictoryCheck;
			}
		}
	}
}

function BattleVictoryCheck()
{
	refreshPartyHealthOrder = function()
	{
		partyUnitsByHp = [];
		array_copy(partyUnitsByHp, 0, partyUnits, 0, array_length(partyUnits));
		array_sort(partyUnitsByHp, function(_1, _2)
		{
			return _2.hp - _1.hp;
		});
	}
	refreshPartyHealthOrder();
	
	refreshEnemyHealthOrder = function()
	{
		enemyUnitsByHp = [];
		array_copy(enemyUnitsByHp, 0, enemyUnits, 0, array_length(enemyUnits));
		array_sort(enemyUnitsByHp, function(_1, _2)
		{
			return _2.hp - _1.hp;
		});
	}
	refreshEnemyHealthOrder()
	
	if (partyUnitsByHp[0].hp <= 0)
	{
		//room_goto(rm_gameover); make a gameover screen
	}
	
	if (enemyUnitsByHp[0].hp <= 0)
	{
		for (var i =0; i < array_length(global.party); i++)
		{
			global.party[i].hp = partyUnits[i].hp
		}
		instance_activate_all();
		instance_destroy(creator);
		instance_destroy();
		audio_stop_sound(bgm_battle);
		audio_play_sound(snd_lvlup,1,false);
		audio_resume_all();
	}
	
	battleState = BattleStateTurnProgression;
}

function BattleStateTurnProgression()
{
	battletext = "";
	turnCount++
	turn++;
	//loops turns
	if (turn > array_length(unitTurnOrder)-1)
	{
		turn = 0;
		roundCount++;
	}
	battleState = BattleStateSelectAction;
}

battleState = BattleStateSelectAction;