/// action_lib_pc_bounding_box_custom_start(value, add)
/// @arg value
/// @arg add

var val, add;
add = false

if (history_undo)
	val = history_data.oldval
else if (history_redo)
	val = history_data.newval
else
{
	val = argument0
	add = argument1
	history_set_var(action_lib_pc_bounding_box_custom_start, temp_edit.pc_bounding_box_custom_start[axis_edit], temp_edit.pc_bounding_box_custom_start[axis_edit] * add + val, true)
}

temp_edit.pc_bounding_box_custom_start[axis_edit] = temp_edit.pc_bounding_box_custom_start[axis_edit] * add + val
