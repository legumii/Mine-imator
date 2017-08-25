/// project_save_background()

json_export_object_start("background")

	json_export_var("biome", background_biome)
	
	json_export_var_bool("ground_show", background_ground_show)
	json_export_var_obj("ground_tex", background_ground_tex)
	json_export_var("ground_name", background_ground_name)
	
	json_export_var_bool("image_show", background_image_show)
	json_export_var_obj("image", background_image)
	json_export_var("image_type", background_image_type)
	json_export_var_bool("image_stretch", background_image_stretch)
	json_export_var_bool("image_box_mapped", background_image_box_mapped)
	
	json_export_var_color("sky_color", background_sky_color)
	json_export_var("sky_time", background_sky_time)
	json_export_var("sky_rotation", background_sky_rotation)
	
	json_export_var("sunlight_range", background_sunlight_range)
	json_export_var_bool("sunlight_follow", background_sunlight_follow)
	json_export_var_obj("sky_sun_tex", background_sky_sun_tex)
	json_export_var_obj("sky_moon_tex", background_sky_moon_tex)
	json_export_var("sky_moon_phase", background_sky_moon_phase)

	json_export_var_bool("sky_clouds_show", background_sky_clouds_show)
	json_export_var_obj("sky_clouds_tex", background_sky_clouds_tex)
	json_export_var_bool("sky_clouds_flat", background_sky_clouds_flat)
	json_export_var("sky_clouds_speed", background_sky_clouds_speed)
	json_export_var("sky_clouds_z", background_sky_clouds_z)
	json_export_var("sky_clouds_size", background_sky_clouds_size)
	json_export_var("sky_clouds_height", background_sky_clouds_height)
	json_export_var_color("sky_clouds_color", background_sky_clouds_color)
	
	json_export_var_bool("fog_show", background_fog_show)
	json_export_var_bool("fog_sky", background_fog_sky)
	json_export_var_bool("fog_color_custom", background_fog_color_custom)
	json_export_var_color("fog_color", background_fog_color)
	json_export_var("fog_distance", background_fog_distance)
	json_export_var("fog_size", background_fog_size)
	json_export_var("fog_height", background_fog_height)

	json_export_var_color("sunlight_color", background_sunlight_color)
	json_export_var_color("ambient_color", background_ambient_color)
	json_export_var_color("night_color", background_night_color)
	
	json_export_var_bool("wind", background_wind)
	json_export_var("wind_speed", background_wind_speed)
	json_export_var("wind_strength", background_wind_strength)
	
	json_export_var_bool("opaque_leaves", background_opaque_leaves)
	json_export_var("texture_animation_speed", background_texture_animation_speed)

json_export_object_done()