extends Area2D

# 1. Khai báo các biến
@export var interaction_text: String = "Chào mừng bạn!"
@export var is_wall: bool = false 

var player_inside = false

# 2. Hàm Ready chạy khi món đồ vừa xuất hiện
func _ready():
	# Kiểm tra xem có node con StaticBody2D không trước khi tắt/mở để tránh lỗi
	if has_node("StaticBody2D/CollisionShape2D"):
		$StaticBody2D/CollisionShape2D.disabled = !is_wall

# 3. Hàm Process xử lý việc nhấn nút
func _process(_delta):
	# Nếu đang hiện hộp thoại rồi thì không làm gì cả
	if DialogueBox.is_active: 
		return
		
	# Nếu người chơi đang đứng trong vùng và nhấn nút Enter/Space
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		DialogueBox.show_message(interaction_text)

# 4. Các hàm xử lý va chạm (Tín hiệu - Signals)
func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
