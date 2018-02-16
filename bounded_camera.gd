extends Camera2D

export(Vector2) var world_size = Vector2() setget _set_world_size

func _ready():
	get_tree().get_root().connect("size_changed", self, "_set_bounds")
	_set_world_size(world_size)

func _set_world_size(value):
	world_size = value
	_set_bounds()

func _set_bounds():
	var viewport = get_viewport()
	if viewport != null:
		var view_size = viewport.get_visible_rect().size

		if view_size.x <= world_size.x:
			limit_left = 0
			limit_right = world_size.x
		else:
			var margin = (view_size.x - world_size.x) / 2
			limit_left = -margin
			limit_right = world_size.x + margin

		if view_size.y <= world_size.y:
			limit_top = 0
			limit_bottom = world_size.y
		else:
			var margin = (view_size.y - world_size.y) / 2
			limit_top = -margin
			limit_bottom = world_size.y + margin