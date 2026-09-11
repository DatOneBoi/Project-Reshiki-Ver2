//Room saving
function save_room()
{
//add obj_coin
	var _coinNum = instance_number(obj_coin);	
	
//add text box	
	var _tbSpeakNum = instance_number(obj_wall);
	
	var _roomStruct = 
	{
	
		coinNum : _coinNum,
		coinData : array_create(_coinNum),
		
		tbsNum : _tbSpeakNum,
		tbsData : array_create(_tbSpeakNum),
	
	}
	
	
//get the data from the different savable objects

	//coin data	
	for(var i =0; i < _coinNum; i++){
		
		var _inst = instance_find(obj_coin, i);
		
		_roomStruct.coinData[i] = 
		{
		x : _inst.x,
		y : _inst.y,
		}
		
	}
	
	//tbSpeak data	
	for(var i =0; i < _tbSpeakNum; i++){
		
		var _inst = instance_find(obj_wall, i);
		
		_roomStruct.tbsData[i] = 
		{
		x : _inst.x,
		y : _inst.y,
		}
		
	}
	
	//store the room specific structure in global.levelData's variable meant for that level
	if room == rm_Test_room2 {global.levelData.level_1 = _roomStruct;};
	if room == rm_Test_room {global.levelData.level_2 = _roomStruct;};
	if room == rm_Red_Forrest_Bridge {global.levelData.level_3 = _roomStruct;};
	if room == rm_Red_Forrest_Cabin {global.levelData.level_4 = _roomStruct;};
	if room == rm_base {global.levelData.level_5 = _roomStruct;};
	//if room == rm_base {global.levelData.Base1 = _roomStruct;};
	
}


function load_room()
{
	var _roomStruct = 0;
	
	//get the correct struct for the room youre in
	if room == rm_Test_room2 {_roomStruct = global.levelData.level_1;};
	if room == rm_Test_room {_roomStruct = global.levelData.level_2;};
	if room == rm_Red_Forrest_Bridge {_roomStruct = global.levelData.level_3;};
	if room == rm_Red_Forrest_Cabin {_roomStruct = global.levelData.level_4;};
	if room == rm_base {_roomStruct = global.levelData.level_5;};
	//if room == rm_base {_roomStruct = global.levelData.Base1;};
	
	
	//exit if _roomstruct isnt a struct
	if !is_struct(_roomStruct) {exit;};
	
	//removes the default room editor coins
	//creates new coins with all of the data prevoiusly saved
	if instance_exists(obj_coin) {instance_destroy(obj_coin);};
	for (var i = 0; i < _roomStruct.coinNum; i++) 
	{
		instance_create_depth(_roomStruct.coinData[i].x, _roomStruct.coinData[i].y, layer, obj_coin);
	}
	
	//creates new coins with all of the data prevoiusly saved
	if instance_exists(obj_wall) {instance_destroy(obj_wall);};
	for (var i = 0; i < _roomStruct.tbsNum; i++) 
	{
		instance_create_depth(_roomStruct.tbsData[i].x, _roomStruct.tbsData[i].y, layer, obj_wall);
	}
}

//Overall Saving

function osave_game(_fileNum = 0)
{

	var _saveArray = array_create(0);
	
	//save the room 
	save_room();
	
	//set and save stat related data
	global.statData.save_x = obj_guy.x;
	global.statData.save_y = obj_guy.y;
	global.statData.save_rm = room_get_name(room);
	
	global.statData.money = global.money;
	global.statData.coins = global.coins;
	
	//global.statData.item_inv = global.item_inv;
	array_push(_saveArray, global.statData);
	
	//save all the room data
	array_push(_saveArray, global.levelData);
	
	//actual saving
	var _filename = "savedata" + string(_fileNum) + ".sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	
	buffer_save(_buffer, _filename);
	
	buffer_delete(_buffer);

}


function oload_game(_fileNum = 0)
{

//loading the saved data
	var _filename = "savedata" + string(_fileNum) + ".sav";
	if !file_exists(_filename) exit;
	
	//load the buffer, get the JSON, delete the buffer to free memory
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	//unstringify and get the data array
	var _loadArray = json_parse(_json);
	
	//set the data in our game to match our loaded data
	global.statData = array_get(_loadArray, 0);
	global.levelData = array_get(_loadArray, 1);
	
	global.coins = global.statData.coins;
	global.money = global.statData.money;
	
	//use our new data to get back to where we were in game
		//go to the correct room
		var _loadRoom = asset_get_index(global.statData.save_rm);
		room_goto(_loadRoom);
		
			//make sure our obj_saveload doesnt save the room were exiting from
			obj_saveload.skipRoomSave = true;
		
		//create the player object
		if instance_exists(obj_guy) {instance_destroy(obj_guy);};
		instance_create_layer(global.statData.save_x, global.statData.save_y, layer, obj_guy);
		
		//manually load the room
		load_room();
	
}