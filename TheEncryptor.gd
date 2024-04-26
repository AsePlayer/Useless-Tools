extends Node2D

@onready var line_edit = $LineEdit
@onready var text = $ColorRect/Text

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_encrypt_button_down():
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
	if text.text != "": text.text = "That's a secret :)"
	pass # Replace with function body.
