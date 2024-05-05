extends Node2D

@onready var line_edit = $LineEdit
@onready var text = $ColorRect/Text
@onready var timer = $Timer
@onready var audio = $"../RedPanel/Audio"


func _on_encrypt_button_down():
	audio.play_click()
	var password:String = line_edit.text
	
	var counter = 0
	while counter < line_edit.text.length():
		password[counter] = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','!','@','#','$','%','^','&','*','(',')','-','=','+'].pick_random()
		counter+=1
		pass
	
	line_edit.text = ""
	text.text = password
	pass # Replace with function body.


func _on_decrypt_button_down():
	audio.play_click()
	if text.text != "": text.text = "That's a secret :)"
	pass # Replace with function body.


func _on_line_edit_gui_input(event):
	if event is InputEventKey and event.keycode == 4194309 and timer.is_stopped(): 
		if line_edit.text == "": _on_decrypt_button_down()
		else: _on_encrypt_button_down() # Enter key activates button
		timer.start()
