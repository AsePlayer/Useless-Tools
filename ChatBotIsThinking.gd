extends LineEdit

@onready var timer = $Timer

func _on_timer_timeout():
	if text == " Bad-GPT is thinking...":
		text = " Bad-GPT is thinking."
		return
	if text == " Bad-GPT is thinking..":
		text = " Bad-GPT is thinking..."
		return
	if text == " Bad-GPT is thinking.":
		text = " Bad-GPT is thinking.."
		return
