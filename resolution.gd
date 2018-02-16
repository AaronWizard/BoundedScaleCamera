extends Node

var base_size

func _ready():
	var width = ProjectSettings.get("display/window/size/width")
	var height = ProjectSettings.get("display/window/size/height")
	base_size = min(width, height)

	get_tree().connect("screen_resized", self, "_screen_resized")

func _screen_resized():
	var new_window_size = OS.window_size

	assert(new_window_size.x > 0)
	assert(new_window_size.y > 0)

	var scale
	if new_window_size.x > new_window_size.y:
		scale = Vector2(new_window_size.x / new_window_size.y, 1)
	else:
		scale = Vector2(1, new_window_size.y / new_window_size.x)

	get_tree().get_root().set_size_override(true, scale * base_size)