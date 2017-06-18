/// project_write_particles()

buffer_write_byte(pc_spawn_constant)
buffer_write_int(pc_spawn_amount)

buffer_write_byte(pc_spawn_region_use)
buffer_write_string_int(pc_spawn_region_type)
buffer_write_double(pc_spawn_region_sphere_radius)
buffer_write_double(pc_spawn_region_cube_size)
buffer_write_double(pc_spawn_region_box_size[XPOS])
buffer_write_double(pc_spawn_region_box_size[YPOS])
buffer_write_double(pc_spawn_region_box_size[ZPOS])

buffer_write_byte(pc_bounding_box_type)
buffer_write_double(pc_bounding_box_ground_z)
buffer_write_double(pc_bounding_box_custom_start[XPOS])
buffer_write_double(pc_bounding_box_custom_start[YPOS])
buffer_write_double(pc_bounding_box_custom_start[ZPOS])
buffer_write_double(pc_bounding_box_custom_end[XPOS])
buffer_write_double(pc_bounding_box_custom_end[YPOS])
buffer_write_double(pc_bounding_box_custom_end[ZPOS])
buffer_write_byte(pc_bounding_box_relative)

buffer_write_byte(pc_destroy_at_animation_finish)
buffer_write_byte(pc_destroy_at_amount)
buffer_write_int(pc_destroy_at_amount_val)
buffer_write_byte(pc_destroy_at_time)
buffer_write_double(pc_destroy_at_time_seconds)
buffer_write_byte(pc_destroy_at_time_israndom)
buffer_write_double(pc_destroy_at_time_random_min)
buffer_write_double(pc_destroy_at_time_random_max)

buffer_write_int(pc_types)
for (var t = 0; t < pc_types; t++) 
{
	with (pc_type[t])
	{
		buffer_write_int(iid)
		buffer_write_string_int(name)
		buffer_write_int(iid_get(temp))
		if (temp)
			temp.save = true
		buffer_write_string_int(text)
		buffer_write_double(spawn_rate)
		buffer_write_int(iid_get(sprite_tex))
		sprite_tex.save = true
		buffer_write_byte(sprite_tex_image)
		buffer_write_int(sprite_frame_width)
		buffer_write_int(sprite_frame_height)
		buffer_write_int(sprite_frame_start)
		buffer_write_int(sprite_frame_end)
		buffer_write_double(sprite_animation_speed)
		buffer_write_byte(sprite_animation_speed_israndom)
		buffer_write_double(sprite_animation_speed_random_min)
		buffer_write_double(sprite_animation_speed_random_max)
		buffer_write_byte(sprite_animation_onend)
		buffer_write_byte(rot_extend)
		buffer_write_byte(spd_extend)
		buffer_write_byte(rot_spd_extend)
		
		for (var a = XPOS; a <= ZPOS; a++)
		{
			buffer_write_double(spd[a])
			buffer_write_byte(spd_israndom[a])
			buffer_write_double(spd_random_min[a])
			buffer_write_double(spd_random_max[a])
			buffer_write_double(spd_add[a])
			buffer_write_byte(spd_add_israndom[a])
			buffer_write_double(spd_add_random_min[a])
			buffer_write_double(spd_add_random_max[a])
			buffer_write_double(spd_mul[a])
			buffer_write_byte(spd_mul_israndom[a])
			buffer_write_double(spd_mul_random_min[a])
			buffer_write_double(spd_mul_random_max[a])
			
			buffer_write_double(rot[a])
			buffer_write_byte(rot_israndom[a])
			buffer_write_double(rot_random_min[a])
			buffer_write_double(rot_random_max[a])
			buffer_write_double(rot_spd[a])
			buffer_write_byte(rot_spd_israndom[a])
			buffer_write_double(rot_spd_random_min[a])
			buffer_write_double(rot_spd_random_max[a])
			buffer_write_double(rot_spd_add[a])
			buffer_write_byte(rot_spd_add_israndom[a])
			buffer_write_double(rot_spd_add_random_min[a])
			buffer_write_double(rot_spd_add_random_max[a])
			buffer_write_double(rot_spd_mul[a])
			buffer_write_byte(rot_spd_mul_israndom[a])
			buffer_write_double(rot_spd_mul_random_min[a])
			buffer_write_double(rot_spd_mul_random_max[a])
		}
		
		buffer_write_double(scale)
		buffer_write_byte(scale_israndom)
		buffer_write_double(scale_random_min)
		buffer_write_double(scale_random_max)
		buffer_write_double(scale_add)
		buffer_write_byte(scale_add_israndom)
		buffer_write_double(scale_add_random_min)
		buffer_write_double(scale_add_random_max)
		
		buffer_write_double(alpha)
		buffer_write_byte(alpha_israndom)
		buffer_write_double(alpha_random_min)
		buffer_write_double(alpha_random_max)
		buffer_write_double(alpha_add)
		buffer_write_byte(alpha_add_israndom)
		buffer_write_double(alpha_add_random_min)
		buffer_write_double(alpha_add_random_max)
		
		buffer_write_int(color)
		buffer_write_byte(color_israndom)
		buffer_write_int(color_random_start)
		buffer_write_int(color_random_end)
		buffer_write_byte(color_mix_enabled)
		buffer_write_int(color_mix)
		buffer_write_byte(color_mix_israndom)
		buffer_write_int(color_mix_random_start)
		buffer_write_int(color_mix_random_end)
		buffer_write_double(color_mix_time)
		buffer_write_byte(color_mix_time_israndom)
		buffer_write_double(color_mix_time_random_min)
		buffer_write_double(color_mix_time_random_max)
		
		buffer_write_byte(spawn_region)
		buffer_write_byte(bounding_box)
		buffer_write_byte(bounce)
		buffer_write_double(bounce_factor)
		buffer_write_byte(orbit)
	}
}
