/// menu_list_init()
/// @desc Runs when a list menu is created.

// Model state
if (menu_model_current != null)
{
	for (var i = 0; i < menu_model_state.value_amount; i++)
		menu_add_item(menu_model_state.value_name[i], minecraft_asset_get_name("modelstatevalue", menu_model_state.value_name[i]))
		
	return 0
}

// Block state
if (menu_block_current != null)
{
	for (var i = 0; i < menu_block_state.value_amount; i++)
		menu_add_item(menu_block_state.value_name[i], minecraft_asset_get_name("blockstatevalue", menu_block_state.value_name[i]))
		
	return 0
}
			
switch (menu_name)
{
	case "benchskin":
	case "benchspblocktex":
	case "benchbodypartskin": // Skin (bench)
	case "libraryskin":
	case "libraryspblocktex":
	case "librarybodypartskin": // Skin (library)
	{
		var modelfile, texname;
		if (string_contains(menu_name, "bench"))
		{
			modelfile = bench_settings.model_file
			texname = bench_settings.model_texture_name
		}
		else
		{
			modelfile = temp_edit.model_file
			texname = temp_edit.model_texture_name
		}
		
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), null, icons.BROWSE)
		
		// Download from user
		if (modelfile.player_skin)
			menu_add_item(e_option.DOWNLOAD_SKIN, text_get("librarycharskindownload"), null, icons.DOWNLOAD_SKIN)
		
		// Default
		var tex;
		with (res_def)
			tex = res_get_model_texture(texname)
		menu_add_item(res_def, res_def.display_name, tex)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res = res_def)
				continue
				
			with (res)
				tex = res_get_model_texture(texname)
			
			menu_add_item(res, res.display_name, tex)
		}
			
		break
	}
	
	case "benchscenery":
	case "libraryscenery": // Terrain
	{
		// None
		menu_add_item(null, text_get("listnone"))
		
		// Import from world
		menu_add_item(e_option.IMPORT_WORLD, text_get("librarysceneryimport"), null, icons.IMPORT_FROM_WORLD)
		
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), null, icons.BROWSE)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res.type = "schematic")
				menu_add_item(res, res.display_name)
		}
		
		break
	}
	
	case "benchblocktex":
	case "libraryblocktex": // Block texture
	{
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), null, icons.BROWSE)
		
		// Default
		menu_add_item(res_def, res_def.display_name, res_def.block_preview_texture)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res != res_def && res.block_sheet_texture != null)
				menu_add_item(res, res.display_name, res.block_preview_texture)
		}
		
		break
	}
	
	case "benchitemtex":
	case "libraryitemtex": // Item texture
	{
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), null, icons.BROWSE)
		
		// Default
		menu_add_item(res_def, res_def.display_name, res_def.block_preview_texture)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res = res_def)
				continue
				
			if (res.type = "texture")
				menu_add_item(res, res.display_name, res.texture)
			else if (res.item_sheet_texture != null)
				menu_add_item(res, res.display_name, res.block_preview_texture)
		}
		break
	}
	
	case "benchbodypart": // Body part
	{
		for (var p = 0; p < ds_list_size(bench_settings.model_file.file_part_list); p++)
		{
			var part = bench_settings.model_file.file_part_list[|p];
			menu_add_item(part.name, minecraft_asset_get_name("modelpart", part.name))
		}
		break
	}
		
	case "templateeditorbodypart": // Body part
	{
		for (var p = 0; p < ds_list_size(temp_edit.model_file.file_part_list); p++)
		{
			var part = temp_edit.model_file.file_part_list[|p];
			menu_add_item(part.name, minecraft_asset_get_name("modelpart", part.name))
		}
		break
	}
		
	case "benchtextfont":
	case "librarytextfont": // Text font
	{
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), null, icons.BROWSE)
		
		// Default
		menu_add_item(res_def, res_def.display_name)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res != res_def && font_exists(res.font))
				menu_add_item(res, res.display_name)
		}
		break
	}
	
	case "benchshapetex":
	case "libraryshapetex": // Shape texture
	{
		// None
		menu_add_item(0, text_get("listnone"))
		
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), null, icons.BROWSE)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res.texture)
				menu_add_item(res, res.display_name, res.texture)
		}
		
		// Add existing cameras
		with (obj_timeline)
			if (type = "camera")
				menu_add_item(id, display_name)
			
		break
	}
	
	case "particleeditorspawnregiontype": // Particle editor spawn region type
	{
		menu_add_item("sphere", text_get("particleeditorspawnregiontypesphere"), spr_icons, icons.SPHERE)
		menu_add_item("cube", text_get("particleeditorspawnregiontypecube"), spr_icons, icons.CUBE)
		menu_add_item("box", text_get("particleeditorspawnregiontypebox"), spr_icons, icons.BOX)
		break
	}
	
	case "particleeditortypetemp": // Particle editor type library source
	{
		menu_add_item(null, text_get("particleeditortypesprite"))
		
		for (var i = 0; i < ds_list_size(lib_list.list); i++)
		{
			var temp = lib_list.list[|i];
			if (temp.type != "particles")
				menu_add_item(temp, temp.display_name)
		}
		break
	}
	
	case "particleeditortypespritetex": // Block texture
	{
		var img = ptype_edit.sprite_tex_image;
		
		// Add from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), null, icons.BROWSE)
		
		// Default
		menu_add_item(res_def, res_def.display_name, res_def.particles_texture[img])
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res != res_def && res.particles_texture[0])
				menu_add_item(res, res.display_name, res.particles_texture[img])
		}
		break
	}
	case "backgroundimage": // Background image
	{
		// None
		menu_add_item(null, text_get("listnone"))
		
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), spr_icons, icons.BROWSE)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res.texture)
				menu_add_item(res, res.display_name, res.texture)
		}
		break
	}
	
	case "backgroundimagetype": // Background image type
	{
		menu_add_item(0, text_get("backgroundimagetypeimage"))
		menu_add_item(1, text_get("backgroundimagetypesphere"))
		menu_add_item(2, text_get("backgroundimagetypebox"))
		break
	}
	
	case "backgroundskysuntex": // Background sky sun texture
	{
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), null, icons.BROWSE)
		
		// Default
		menu_add_item(res_def, res_def.display_name, res_def.sun_texture)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res = res_def)
				continue
			if (res.sun_texture)
				menu_add_item(res, res.display_name, res.sun_texture)
			else if (res.texture)
				menu_add_item(res, res.display_name, res.texture)
		}
		
		break
	}
	
	case "backgroundskymoontex": // Background sky moon texture
	{
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), spr_icons, icons.BROWSE)
		
		// Default
		menu_add_item(res_def, res_def.display_name, res_def.moon_texture[background_sky_moon_phase])
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res = res_def)
				continue
			if (res.moon_texture[0])
				menu_add_item(res, res.display_name, res.moon_texture[background_sky_moon_phase])
			else if (res.texture)
				menu_add_item(res, res.display_name, res.texture)
		}
		
		break
	}
	
	case "backgroundskymoonphase": // Background sky moon phase
	{
		for (var p = 0; p < 8; p++)
			menu_add_item(p, text_get("backgroundskymoonphase" + string(p + 1)), background_sky_moon_tex.moon_texture[p])
		break
	}
	
	case "backgroundskycloudstex": // Background sky clouds texture
	{
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), spr_icons, icons.BROWSE)
		
		// Default
		menu_add_item(res_def, res_def.display_name, res_def.clouds_texture)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res = res_def)
				continue
			if (res.clouds_texture)
				menu_add_item(res, res.display_name, res.clouds_texture)
			else if (res.texture)
				menu_add_item(res, res.display_name, res.texture)
		}
		
		break
	}
	
	case "backgroundgroundtex": // Background ground texture
	{
		// Import from file
		menu_add_item(e_option.BROWSE, text_get("listbrowse"), null, icons.BROWSE)
		
		// Default
		menu_add_item(res_def, res_def.display_name, res_def.block_preview_texture)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res != res_def && res.block_sheet_texture != null)
				menu_add_item(res, res.display_name, res.block_preview_texture)
		}
		break
	}
	
	case "backgroundbiome": // Background biome
	{
		for (var b = 0; b < ds_list_size(biome_list); b++)
			menu_add_item(b, text_get(biome_list[|b].name))
		break
	}
	
	case "resourcespackimage": // Resource pack preview image
	{
		menu_add_item("preview", text_get("resourcespackpreview"))
		menu_add_item("modeltextures", text_get("resourcespackmodeltextures"))
		menu_add_item("blocksheet", text_get("resourcespackblocksheet"))
		menu_add_item("colormap", text_get("resourcespackcolormap"))
		menu_add_item("itemsheet", text_get("resourcespackitemsheet"))
		menu_add_item("particlesheet", text_get("resourcespackparticlesheet"))
		menu_add_item("suntexture", text_get("resourcespacksuntexture"))
		menu_add_item("moontexture", text_get("resourcespackmoontexture"))
		menu_add_item("cloudtexture", text_get("resourcespackcloudtexture"))
		break
	}
	
	case "resourcespackimagemodeltexture": // Resource pack preview skin
	{
		for (var t = 0; t < ds_list_size(mc_assets.model_texture_list); t++)
			menu_add_item(mc_assets.model_texture_list[|t], mc_assets.model_texture_list[|t])
		break
	}
	
	case "frameeditorchartex":
	case "frameeditorspblocktex":
	case "frameeditorbodyparttex": // Timeline frame skin
	{
		// Default
		//menu_add_item(null, text_get("frameeditortexturedefault", tl_edit.temp.char_skin.display_name), tl_edit.temp.char_skin.mob_texture[tl_edit.temp.char_model.index])
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
		   // if (res != tl_edit.temp.char_skin && res.mob_texture[0])
		   //	menu_add_item(res, res.display_name, res.mob_texture[tl_edit.temp.char_model.index])
		}
		
		break
	}
	
	case "frameeditorblocktex": // Timeline frame block texture
	{
		// Default
		menu_add_item(null, text_get("frameeditortexturedefault", tl_edit.temp.block_tex.display_name), tl_edit.temp.block_tex.block_preview_texture)
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res != tl_edit.temp.block_tex && res.block_sheet_texture != null)
				menu_add_item(res, res.display_name, res.block_preview_texture)
		}
		
		break
	}
	
	case "frameeditorshapetex": // Timeline frame shape texture
	{
		if (tl_edit.temp.shape_tex)
		{
			if (tl_edit.temp.shape_tex.object_index = obj_timeline)
				menu_add_item(null, text_get("frameeditortexturedefault", tl_edit.temp.shape_tex.display_name))
			else
				menu_add_item(null, text_get("frameeditortexturedefault", tl_edit.temp.shape_tex.display_name), tl_edit.temp.shape_tex.texture)
			menu_add_item(0, text_get("listnone"))
		}
		else
			menu_add_item(null, text_get("frameeditortexturedefault", text_get("listnone")))
		
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res != tl_edit.temp.shape_tex && res.texture)
				menu_add_item(res, res.display_name, res.texture)
		}
		
		with (obj_timeline)
			if (id != tl_edit.temp.shape_tex && type = "camera")
				menu_add_item(id, display_name)
			
		break
	}
	 
	case "frameeditorsound": // Sound
	{
		// Default
		menu_add_item(null, text_get("listnone"))
		
		// Add existing resources
		for (var i = 0; i < ds_list_size(res_list.list); i++)
		{
			var res = res_list.list[|i];
			if (res.type = "sound")
				menu_add_item(res, res.display_name)
		}
		
		break
	}
	
	case "settingscamerabuffersize": // Camera surface detail
	{
		menu_add_item(64, text_get("settingscamerabuffersize64") + " (64x64)", null, 0)
		menu_add_item(128, text_get("settingscamerabuffersize128") + " (128x128)", null, 0)
		menu_add_item(256, text_get("settingscamerabuffersize256") + " (256x256)", null, 0)
		menu_add_item(512, text_get("settingscamerabuffersize512") + " (512x512)", null, 0)
		menu_add_item(1024, text_get("settingscamerabuffersize1024") + " (1024x1024)", null, 0)
		menu_add_item(2048, text_get("settingscamerabuffersize2048") + " (2048x2048)", null, 0)
		break
	}
	
	case "settingsrendershadowssunbuffersize":
	case "settingsrendershadowsspotbuffersize":
	case "settingsrendershadowspointbuffersize": // Shadow map detail
	{
		menu_add_item(256, text_get("settingsrendershadowsbuffersize256") + " (256x256)", null, 0)
		menu_add_item(512, text_get("settingsrendershadowsbuffersize512") + " (512x512)", null, 0)
		menu_add_item(1024, text_get("settingsrendershadowsbuffersize1024") + " (1024x1024)", null, 0)
		menu_add_item(2048, text_get("settingsrendershadowsbuffersize2048") + " (2048x2048)", null, 0)
		menu_add_item(4096, text_get("settingsrendershadowsbuffersize4096") + " (4096x4096)", null, 0)
		menu_add_item(8192, text_get("settingsrendershadowsbuffersize8192") + " (8192x8192)", null, 0)
		break
	}
	
	case "projectvideosize":
	case "exportmovievideosize":
	case "exportimageimagesize":
	case "frameeditorcameravideosize":
	{
		if (menu_name = "frameeditorcameravideosize")
			menu_add_item(null, text_get("frameeditorcameravideosizeuseproject"))
		with (obj_videotemplate)
			menu_add_item(id, name + " (" + string(width) + "x" + string(height) + ")")
		menu_add_item(0, text_get("projectvideosizecustom"))
		break
	}
	
	case "exportmovieformat":
	{
		menu_add_item("mp4", text_get("exportmovieformatmp4"))
		menu_add_item("mov", text_get("exportmovieformatmov"))
		menu_add_item("wmv", text_get("exportmovieformatwmv"))
		menu_add_item("png", text_get("exportmovieformatpng"))
		break
	}
	
	case "exportmovievideoquality":
	{
		with (obj_videoquality)
			menu_add_item(id, text_get(name))
		menu_add_item(0, text_get("exportmovievideoqualitycustom"))
		break
	}
	
	case "exportmovieframerate":
	{
		menu_add_item(24, "24")
		menu_add_item(30, "30")
		menu_add_item(60, "60")
		break
	}
}
