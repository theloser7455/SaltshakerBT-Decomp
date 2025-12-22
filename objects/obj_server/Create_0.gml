enum asyncTypes
{
	notif, // 0
	playerUpdate, // 1
	serverClose, // 2
	addParticle, // 3
	addAfterimage, // 4
	deleteObject, // 5
	createSound, //6
	modifyPlayers, // 7
	sendConnections, // 8
	existingPlayers, // 9
	addPlayerInfo, // 10
	chatMessage // 11
}
randomize()
onlineID = irandom_range(0, 1000000)
notifs = ds_list_create()
connections = ds_list_create()

network_send_packetServ = function(arg0, arg1)
{
    if (global.client == -4)
    {
        var i = ds_list_size(connections)
        
        while (i--)
			network_send_packet(ds_list_find_value(connections, i), arg0, arg1)
    }
    
    if global.server == -4
        network_send_packet(global.client, arg0, arg1)
}

create_notifAsync = function(arg0, arg1)
{
    var p = 
    {
        type: asyncTypes.notif,
        text: arg0,
        color: arg1,
        alpha: 1,
        gotime: 90
    }
    var buff = buffer_create(32, buffer_grow, 1)
    buffer_write(buff, buffer_string, json_stringify(p))
    network_send_packetServ(buff, buffer_tell(buff))
    buffer_delete(buff)
    ds_list_add(notifs, p)
}

playerInRoom = 0
