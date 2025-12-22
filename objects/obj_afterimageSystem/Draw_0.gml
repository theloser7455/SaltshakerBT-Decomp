if (!ds_list_empty(afterimages))
{
    for (var i = 0; i < ds_list_size(afterimages); i++)
    {
        var q = ds_list_find_value(afterimages, i)
        
        with q
        {
			var _shd = false
			var _blend = c_white
			
			switch type
			{
			    case afterimagetype.normal:
			        _blend = image_blend
			        gpu_set_blendmode(bm_add)
			        break
			    
			    case afterimagetype.fade:
			        pal_swap_set(obj_player.spr_palette, obj_player.palIndex, false)
			        _blend = image_blend
			        _shd = true
			        break
			    
			    case states.buzzsaw:
			        var _col2 = 0x785030
			        var _col = 0x482911
			        var col = [color_get_red(_col) / c_red, color_get_green(_col) / c_red, color_get_blue(_col) / c_red]
			        var col2 = [color_get_red(_col2) / c_red, color_get_green(_col2) / c_red, color_get_blue(_col2) / c_red]
			        shader_set(shd_fullshade)
			        shader_set_uniform_f_array(other.uniformLight, [col[0], col[1], col[2]])
			        shader_set_uniform_f_array(other.uniformDark, [col2[0], col2[1], col2[2]])
			        gpu_set_blendmode(bm_add)
			        _shd = true
			        break
			    
			    case afterimagetype.attack:
			        break
			    
			    case afterimagetype.unknown3:
			        break
			}
			
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, _blend, image_alpha * alpha)
			
			if (_shd)
			    shader_reset()
			
			gpu_set_blendmode(bm_normal)
        }
    }
}
