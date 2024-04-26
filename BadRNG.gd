extends Node2D

@onready var line_edit = $LineEdit

func _on_button_button_down():
	line_edit.text = str([1,50,100,69].pick_random())
