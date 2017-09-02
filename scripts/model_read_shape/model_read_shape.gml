/// model_read_shape(map)
/// @arg map
/// @desc Adds a shape from the given map (JSON object)

var map = argument0;

if (!is_string(map[?"type"]))
{
	log("Missing parameter \"type\"")
	return null
}

if (!is_real(map[?"from"]) || !ds_exists(map[?"from"], ds_type_list))
{
	log("Missing array \"from\"")
	return null
}

if (!is_real(map[?"to"]) || !ds_exists(map[?"to"], ds_type_list))
{
	log("Missing array \"to\"")
	return null
}

if (!is_real(map[?"uv"]) || !ds_exists(map[?"uv"], ds_type_list))
{
	log("Missing array \"uv\"")
	return null
}

with (new(obj_model_shape))
{
	// Type
	type = map[?"type"]

	// Description (optional)
	if (is_string(map[?"description"]))
		description = map[?"description"]
	else
		description = ""
		
	// Texture (optional)
	if (is_string(map[?"texture"]))
	{
		texture_name = map[?"texture"]
		
		// Texture size
		if (!is_real(map[?"texture_size"]) || !ds_exists(map[?"texture_size"], ds_type_list))
		{
			log("Missing array \"texture_size\"")
			return null
		}
		var texturesizelist = map[?"texture_size"];
		texture_size = vec2(texturesizelist[|X], texturesizelist[|Y])
	}
	else
	{
		// Inherit
		texture_name = other.texture_name
		texture_size = other.texture_size
	}
		
	// Mirror (optional)
	if (is_real(map[?"texture_mirror"]))
		texture_mirror = map[?"texture_mirror"]
	else
		texture_mirror = false
	
	// Invert (optional)
	if (is_real(map[?"invert"]))
		invert = map[?"invert"]
	else
		invert = false
	
	// From/To
	var fromlist = map[?"from"]
	from = point3D(fromlist[|X], fromlist[|Z], fromlist[|Y])
	
	var tolist = map[?"to"];
	to = vec3(tolist[|X], tolist[|Z], tolist[|Y])
		
	// Rotation (optional) TODO: Will mess up bending? Try it..
	var rotlist = map[?"rotation"]
	if (is_real(rotlist) && ds_exists(rotlist, ds_type_list))
		rotation = vec3(rotlist[|X], rotlist[|Z], rotlist[|Y])
	else
		rotation = vec3(0, 0, 0)
		
	// Scale (optional)
	var scalist = map[?"scale"]
	if (is_real(scalist) && ds_exists(scalist, ds_type_list))
		scale = vec3(scalist[|X], scalist[|Z], scalist[|Y])
	else
		scale = vec3(1, 1, 1)
		
	// Bending
	bend_part = other.bend_part
	bend_axis = other.bend_axis
	bend_direction = other.bend_direction
	bend_offset = other.bend_offset
	
	// UV
	var uvlist = map[?"uv"];
	uv = vec2(uvlist[|X], uvlist[|Y])
		
	// Matrix applied to vertices
	vertex_matrix = matrix_create(from, rotation, scale)
	
	// Default bounds
	bounds_start = point3D(no_limit, no_limit, no_limit)
	bounds_end = point3D(-no_limit, -no_limit, -no_limit)
	
	// Generate
	if (type = "block")
	{
		vbuffer = vbuffer_start()
		model_read_shape_block()
		vbuffer_done()
		
		if (bend_part != null)
		{
			bend_vbuffer = vbuffer_start()
			model_read_shape_block(true)
			vbuffer_done()
		}
		else
			bend_vbuffer = null
	}
	else if (type = "plane")
	{
		to[Y] = from[Y]
		
		vbuffer = vbuffer_start()
		model_read_shape_plane()
		vbuffer_done()
		
		if (bend_part != null)
		{
			bend_vbuffer = vbuffer_start()
			model_read_shape_plane(true)
			vbuffer_done()
		}
		else
			bend_vbuffer = null
	}
	else
	{
		log("Invalid shape type", type)
		return null
	}
	
	// Update bounds
	other.bounds_start[X] = min(other.bounds_start[X], bounds_start[X])
	other.bounds_start[Y] = min(other.bounds_start[Y], bounds_start[Y])
	other.bounds_start[Z] = min(other.bounds_start[Z], bounds_start[Z])
	other.bounds_end[X] = max(other.bounds_end[X], bounds_end[X])
	other.bounds_end[Y] = max(other.bounds_end[Y], bounds_end[Y])
	other.bounds_end[Z] = max(other.bounds_end[Z], bounds_end[Z])
	
	return id
}