/// Centralized save/load system
/// Provides JSON-based serialization of core game state

function ss_collect_current_room_state() {
	// Collect lightweight, room-scoped state (e.g., coins)
	var coinCount = instance_number(obj_coin);
	var coinArray = array_create(coinCount);
	for (var i = 0; i < coinCount; i++) {
		var inst = instance_find(obj_coin, i);
		coinArray[i] = {
			x: inst.x,
			y: inst.y,
		};
	}
	return {
		roomName: room_get_name(room),
		coins: coinArray,
	};
}

function ss_apply_room_state(roomState) {
	if (!is_struct(roomState)) return;
	// Remove editor-placed coins and rebuild from saved data
	if (instance_exists(obj_coin)) {
		instance_destroy(obj_coin);
	}
	var coins = roomState.coins;
	if (is_array(coins)) {
		var count = array_length(coins);
		for (var i = 0; i < count; i++) {
			var c = coins[i];
			if (is_struct(c)) {
				instance_create_depth(c.x, c.y, layer, obj_coin);
			}
		}
	}
}

function savegame_save(_filename) {
	var filename = is_string(_filename) ? _filename : "savegame.json";
	var state = {
		version: 1,
		roomName: room_get_name(room),
		player: {
			x: obj_guy.x,
			y: obj_guy.y,
		},
		globals: {
			coins: (variable_global_exists("coins") ? global.coins : 0),
			item_inv: (variable_global_exists("item_inv") ? array_create(array_length(global.item_inv)) : array_create(0)),
		},
		roomState: ss_collect_current_room_state(),
	};

	// Copy inventory if present
	if (variable_global_exists("item_inv")) {
		var invLen = array_length(global.item_inv);
		for (var i = 0; i < invLen; i++) {
			state.globals.item_inv[i] = global.item_inv[i];
		}
	}

	var json = json_stringify(state);
	var fh = file_text_open_write(filename);
	file_text_write_string(fh, json);
	file_text_close(fh);
	show_debug_message("Saved game to " + filename);
}

function savegame_load(_filename) {
	var filename = is_string(_filename) ? _filename : "savegame.json";
	if (!file_exists(filename)) {
		show_debug_message("No save file found: " + filename);
		return false;
	}
	var fh = file_text_open_read(filename);
	var json = "";
	while (!file_text_eof(fh)) {
		json += file_text_read_string(fh);
		file_text_readln(fh);
	}
	file_text_close(fh);

	var parsed = json_parse(json);
	if (!is_struct(parsed)) {
		show_debug_message("Save parse failed.");
		return false;
	}

	// Prepare to position player when changing rooms
	global.load_x = parsed.player.x;
	global.load_y = parsed.player.y;
	global.load_pending = true;

	// Restore globals if present
	if (is_struct(parsed.globals)) {
		if (variable_global_exists("coins") && is_real(parsed.globals.coins)) {
			global.coins = parsed.globals.coins;
		}
		if (variable_global_exists("item_inv") && is_array(parsed.globals.item_inv)) {
			var invLen = array_length(parsed.globals.item_inv);
			global.item_inv = array_create(invLen);
			for (var i = 0; i < invLen; i++) {
				global.item_inv[i] = parsed.globals.item_inv[i];
			}
		}
	}

	// Stash room state to apply on Room Start
	global.ss_loaded_room_state = parsed.roomState;
	global.ss_loaded_room_name = parsed.roomName;

	// Change rooms using room name when possible (no iteration required)
	var targetRoomName = parsed.roomName;
	var targetRoomIndex = room;
	if (is_string(targetRoomName)) {
		var idx = asset_get_index(targetRoomName);
		if (idx != -1) {
			targetRoomIndex = idx;
		}
	}
	// If loading into the current room, set position immediately and apply state without room change
	if (targetRoomIndex == room) {
		if (instance_exists(obj_guy)) {
			with (obj_guy) {
				x = global.load_x;
				y = global.load_y;
			}
		}
		ss_apply_room_state(parsed.roomState);
		global.load_pending = false;
		show_debug_message("Loaded game from " + filename + ", staying in room: " + room_get_name(room));
		return true;
	}

	room_goto(targetRoomIndex);
	show_debug_message("Loaded game from " + filename + ", going to " + string(targetRoomIndex));
	return true;
}

function ss_apply_loaded_room_state_if_any() {
	if (variable_global_exists("ss_loaded_room_state") && is_struct(global.ss_loaded_room_state)) {
		var expected = is_string(global.ss_loaded_room_name) ? global.ss_loaded_room_name : "";
		if (expected == room_get_name(room)) {
			ss_apply_room_state(global.ss_loaded_room_state);
			global.ss_loaded_room_state = undefined;
			global.ss_loaded_room_name = undefined;
		}
	}
}


