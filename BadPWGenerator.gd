extends Node2D
@onready var first_name_line_edit = $LineEdit
@onready var last_name_line_edit = $LineEdit2

@onready var fake_pw_text = $ColorRect/FakePWText
@onready var timer = $Timer

func _on_button_button_down():
	fake_pw_text.text = first_name_line_edit.text + last_name_line_edit.text
	var first_name = first_name_line_edit.text
	var last_name = last_name_line_edit.text
	
	for i in range(len(first_name)):
		if randi_range(0,3) > 1:
			first_name[i] = first_name[i].capitalize()
			
	for i in range(len(last_name)):
		if randi_range(0,3) > 1:
			last_name[i] = last_name[i].capitalize()
	
	fake_pw_text.text = " New Password: " + first_name + last_name + str(randi_range(0,55))
	pass # Replace with function body.
	

func _on_line_edit_2_gui_input(event):
	if event is InputEventKey and event.keycode == 4194309 and timer.is_stopped(): 
		_on_button_button_down() # Enter key activates button
		timer.start()


func _on_line_edit_gui_input(event):
	if event is InputEventKey and event.keycode == 4194309 and timer.is_stopped(): 
		_on_button_button_down() # Enter key activates button
		timer.start()
