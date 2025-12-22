image_index = global.combo.dropped
grav = 1
i2 = 0
vsp = -8
image_speed = 0
dontdraw = false
particles = ds_list_create()
hspeed = -5
particleStatic = function(_sprite, _x, _y, _xscale, _depth = 1)
{
	var par =
	{
		type: 0,
		sprite_index: _sprite,
		image_index: 0,
		image_angle: 0,
		x: _x,
		y: _y,
		image_xscale: _xscale,
		depth: _depth,
		hsp: 0,
		vsp: 0,
		grav: 0,
		image_speed: 0.35,
	}
	ds_list_add(particles, par)
	return par;
}
particleDebri = function(_sprite, _index, _x, _y, _xscale, _depth = 1, _angle = random_range(0, 360), _vsp = random_range(-5, 5), _hsp = random_range(10, -10))
{
	var par = particleStatic(_sprite, _x, _y, _xscale, _depth)
	with par
	{
		hsp = _hsp
		vsp = _vsp
		grav = 0.4
		image_index = _index
		image_angle = _angle
		image_speed = 0
	}
	return par;
}