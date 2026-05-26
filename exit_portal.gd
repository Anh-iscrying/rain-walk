extends Area2D

func _ready():
	# Kết nối tín hiệu bằng code cho chắc (hoặc bạn làm ở tab Signals cũng được)
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		# GameManager là cái Autoload bạn đã làm lúc nãy
		if GameManager.total_treasures >= 5:
			DialogueBox.show_message("Cánh cổng tỏa sáng rực rỡ! Đã đến lúc rời khỏi đây.")
			# Đợi 2 giây cho người chơi đọc chữ rồi mới chuyển màn
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://map_2.tscn")
		else:
			DialogueBox.show_message("Cánh cổng vẫn im lìm. Bạn cần đủ 5 rương báu để kích hoạt nó.")
