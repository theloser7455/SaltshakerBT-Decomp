function send_data(dta)
{
    var _buff = buffer_create(12, buffer_grow, 1)
    buffer_seek(_buff, buffer_seek_start, 0)
    var q = json_stringify(dta, true)
    buffer_write(_buff, buffer_string, q)
    self.network_send_packetServ(_buff, buffer_tell(_buff))
    buffer_delete(_buff)
}
function instance_create_online(_x, _y, _depth, _obj, _vars = {})
{
    var struct = {}
    struct.x = _x
    struct.y = _y
    struct.depth = _depth
    struct.obj = _obj
    struct.room = room
    struct.onlineID = onlineID
    struct.type = asyncTypes.existingPlayers
    struct.vars = _vars
    send_data(struct)
}