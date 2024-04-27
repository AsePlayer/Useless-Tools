extends Node2D

@onready var chat_box = $ChatBox
@onready var chat_message = $LineEdit
@onready var message_list:ItemList = $ChatBox/ItemList
@onready var chat_button = $ChatButton
@onready var chat_bot_is_thinking = $ChatBotIsThinking

@export var chat_bot_greetings:Array[String]
@export var chat_bot_rejections:Array[String]

var ai_typing:bool = false
@onready var ai_timer = $Timer

var scroll_bar:VScrollBar

var old_scroll_value

# Called when the node enters the scene tree for the first time.
func _ready():
	scroll_bar = message_list.get_v_scroll_bar()
	old_scroll_value = scroll_bar.max_value
	#print(message_list.add_theme_font_override(""))
	ai_send_greeting()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if old_scroll_value != scroll_bar.max_value:
		update_scrollbar()
	
	if ai_typing:
		chat_button.disabled = true
		chat_bot_is_thinking.visible = true
	else:
		chat_button.disabled = false
		chat_bot_is_thinking.visible = false
	pass


func _on_chat_button_button_down():
	message_list.add_item(" You: " + chat_message.text)
	chat_message.text = ""
	ai_typing = true
	ai_timer.wait_time = randf_range(3,15)
	ai_timer.start()
	
	
func ai_send_message():
	var message:String
	var constructed_message:String
	var counter:int = 0
	
	message = chat_bot_rejections.pick_random()
	message_list.add_item(" Bad-GPT: ")
	
	while counter < len(message):
		constructed_message += message[counter]
		counter += 1
		message_list.set_item_text(message_list.item_count - 1," Bad-GPT: " + constructed_message)
		await get_tree().create_timer(.02).timeout
	pass

func ai_send_greeting():
	var message:String
	message = chat_bot_greetings.pick_random()
	message_list.add_item(" Bad-GPT: " + message)
	pass
	


func update_scrollbar():
	scroll_bar.value = scroll_bar.max_value
	old_scroll_value = scroll_bar.max_value


func _on_timer_timeout():
	ai_send_message()
	ai_typing = false
	pass # Replace with function body.

func _on_line_edit_gui_input(event):
	if event is InputEventKey and event.keycode == 4194309 and ai_typing == false: 
		ai_typing = true
		_on_chat_button_button_down() # Enter key activates button
