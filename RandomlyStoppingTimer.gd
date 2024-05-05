extends Node2D

@onready var line_edit = $LineEdit
@onready var timer = $Timer
@onready var random_stop_timer = $RandomStopTimer
@onready var button = $Button
@onready var audio = $"../RedPanel/Audio"

@onready var audio_stream_player_2d = $AudioStreamPlayer2D
const RIZZ_SOUND_EFFECT = preload("res://Assets/sounds/rizz.mp3")
const TIMER_SOUND_EFFECT = preload("res://Assets/sounds/Timer Sound Effect.mp3")

var is_timer_active

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_timer_active:
		line_edit.text = str(timer.time_left)
		button.text = "Stop Timer"
	else:
		button.text = "Start Timer"


func _on_button_button_down():
	audio.play_click()
	change_timer_state(timer.is_stopped())

func change_timer_state(state:bool):
	is_timer_active = state
	if state == true and float(line_edit.text) > 0:
		audio_stream_player_2d.stream = TIMER_SOUND_EFFECT
		audio_stream_player_2d.autoplay = true
		audio_stream_player_2d.play()
		
		timer.wait_time = float(line_edit.text)
		timer.start()
		random_stop_timer.wait_time = randf_range(2,5)
		random_stop_timer.start()
	else:
		audio_stream_player_2d.playing = false
		audio_stream_player_2d.autoplay = false
		timer.stop()
		random_stop_timer.stop()
		is_timer_active = false

func _on_random_stop_timer_timeout():
	change_timer_state(false)
	pass # Replace with function body.


func _on_line_edit_gui_input(event):
	if event is InputEventKey and event.keycode == 4194309 and timer.is_stopped(): 
		_on_button_button_down() # Enter key activates button
		timer.start()
		



func _on_timer_timeout():
	audio_stream_player_2d.autoplay = false
	audio_stream_player_2d.stream = RIZZ_SOUND_EFFECT
	audio_stream_player_2d.play()
	pass # Replace with function body.
