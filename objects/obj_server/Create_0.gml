enum asyncTypes
{
	notif, // 0
	playerUpdate, // 1
	serverClose, // 2
	addParticle, // 3
	addAfterimage, // 4
	createSound, //5
	sendConnections, // 6
	existingPlayers, // 7
}
randomize()
onlineID = irandom_range(0, 1000000)
notifs = ds_list_create()
connections = ds_list_create()

network_send_packetServ = function(_bufferId, _size) {
    if global.client == noone
    {
        var i = ds_list_size(connections) 
        while i--
			network_send_packet(ds_list_find_value(connections, i), _bufferId, _size)
    }
    if global.server == noone
        network_send_packet(global.client, _bufferId, _size)
}

create_notifAsync = function(_text, _color)
{
	var p = {type: asyncTypes.notif, text: _text, color: _color, alpha: 1, gotime: 90},
		buff = buffer_create(1, buffer_grow, 1);
	buffer_write(buff, buffer_string, json_stringify(p)); 
	network_send_packetServ(buff, buffer_tell(buff)); buffer_delete(buff);
	ds_list_add(notifs, p);
}
playerInRoom = 0