extends Node2D
@onready var timer = $Timer
@onready var line_edit = $LineEdit
@onready var fake_apology = $ColorRect/FakeApologyText

@export var fake_apologies:Array[String]
@export var fake_excuses:Array[String]

func _on_button_button_down():
	generate_fake_apology(line_edit.text)

func generate_fake_apology(apologizing_for:String):
	fake_apology.text = fake_apologies.pick_random() + " " + apologizing_for + " " + fake_excuses.pick_random()

func _on_line_edit_gui_input(event:InputEventKey):
	if event.keycode == 4194309 and timer.is_stopped(): 
		_on_button_button_down() # Enter key activates button
		timer.start()
