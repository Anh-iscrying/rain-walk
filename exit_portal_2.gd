extends Area2D

func _ready():
	# Kết nối tín hiệu chạm vào (nếu bạn chưa nối ở tab Signals)
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		# Hiện thông báo chiến thắng
		DialogueBox.show_message("Chúc mừng! Bạn đã vượt qua mê cung tăm tối và tìm thấy lối thoát.")
		
		# Sau khi hiện chữ, bạn có thể chọn:
		# 1. Quay lại Map 1 để chơi lại
		# 2. Hoặc hiện một màn hình "The End"
		# Tạm thời tui để chờ 3 giây rồi in ra chữ "Win" nhé
		await get_tree().create_timer(3.0).timeout
		print("Người chơi đã thắng!")
