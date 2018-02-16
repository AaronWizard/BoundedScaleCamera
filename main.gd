extends Node

func _ready():
	$icon/Camera2D.world_size = $background.texture.get_size()

func _process(delta):
	var move = Vector2()
	if Input.is_action_pressed("ui_up"):
		move.y -= 1
	if Input.is_action_pressed("ui_down"):
		move.y += 1
	if Input.is_action_pressed("ui_left"):
		move.x -= 1
	if Input.is_action_pressed("ui_right"):
		move.x += 1
	$icon.position += move * delta * 100