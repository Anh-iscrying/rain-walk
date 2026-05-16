extends Area2D

var player_inside = false

func _process(delta):

	if player_inside and Input.is_action_just_pressed("ui_accept"):
		get_node("../MessageLabel").visible = true

func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
		get_node("../MessageLabel").visible = false
