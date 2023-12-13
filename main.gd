extends Control

# Declare member variables here.
onready var color_rect = get_node("HBoxContainer/ColorRect")
onready var controls = get_node("HBoxContainer/VBoxContainer")
onready var text_edit = get_node("HBoxContainer/VBoxContainer/TextEdit")

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.min_window_size = Vector2(200, 40)
	set_shader()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _unhandled_key_input(event):
	if event.pressed:
		if event.scancode == KEY_F11:
			OS.window_fullscreen = !OS.window_fullscreen
		if event.scancode == KEY_ESCAPE:
			controls.set_visible(!controls.is_visible())

func _on_Button_pressed():
	set_shader()

func set_shader():
	color_rect.material.get_shader().set_code(get_text())

func get_text():
	return text_edit.get_text()
