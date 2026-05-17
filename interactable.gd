extends Area2D

@export var interaction_text: String = "Chào mừng bạn!"
var player_inside = false

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		# Gọi Autoload DialogueBox
		if DialogueBox:
			DialogueBox.show_message(interaction_text)

func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
