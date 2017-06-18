/// action_lib_shape_invert(invert)
/// @arg invert

var invert;

if (history_undo)
	invert = history_data.oldval
else if (history_redo)
	invert = history_data.newval
else
{
	invert = argument0
	history_set_var(action_lib_shape_invert, temp_edit.shape_invert, invert, false)
}

with (temp_edit)
{
	shape_invert = invert
	temp_update_shape()
}
lib_preview.update = true
