depth = -9999;
money = 0;
global.objectives = false;
global.objectivesdesc = "";

//item constructor
function create_item(_name, _desc, _spr, _effect) constructor
	{
	name = _name;
	description = _desc;
	sprite = _spr;
	effect = _effect;
	}
	


//create the items

global.item_list = {

coin : new create_item(
"Coin",
"Use to increase money",
spr_coin,

function()
	{
		global.money += 5;
		
		//get rid of the item
		audio_play_sound(snd_use, 1, 0);
		array_delete(inv, selected_item, 1);
	}

),
	

}

//create the inventory

inv = array_create(0);

selected_item = -1;

inv_max = 2;

//for drawing and mouse positions
sep = 10;
screen_bord = 4;

// Apply loaded inventory after room changes
if (variable_global_exists("ss_loaded_inventory_keys") && is_array(global.ss_loaded_inventory_keys))
{
	inv = ss_inventory_from_keys(global.ss_loaded_inventory_keys);
	global.ss_loaded_inventory_keys = undefined;
}