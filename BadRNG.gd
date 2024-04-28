extends Node2D

@onready var line_edit = $LineEdit
@onready var timer = $Timer

func _on_button_button_down():
	line_edit.text = str([1,50,100,69].pick_random())


func _on_line_edit_gui_input(event):
	if event is InputEventKey and event.keycode == 4194309 and timer.is_stopped(): 
		_on_button_button_down() # Enter key activates button
		timer.start()
