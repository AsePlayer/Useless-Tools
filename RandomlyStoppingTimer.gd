extends Node2D

@onready var line_edit = $LineEdit
@onready var timer = $Timer
@onready var random_stop_timer = $RandomStopTimer
@onready var button = $Button

var is_timer_active

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_timer_active:
		line_edit.text = str(timer.time_left)
		button.text = "Stop Timer"
	else:
		button.text = "Start Timer"


func _on_button_button_down():
	change_timer_state(timer.is_stopped())

func change_timer_state(state:bool):
	is_timer_active = state
	if state == true:
		timer.wait_time = float(line_edit.text)
		timer.start()
		random_stop_timer.wait_time = randf_range(1,10)
		random_stop_timer.start()
	else:
		timer.stop()
		random_stop_timer.stop()

func _on_random_stop_timer_timeout():
	change_timer_state(false)
	pass # Replace with function body.
