extends Area2D

# 1. Khai báo các biến
@export var interaction_text: String = "Chào mừng bạn!"
@export var is_wall: bool = false 
@export var is_collectible: bool = false # MỚI: Tích vào nếu muốn nhặt xong biến mất


var player_inside = false
var is_collected = false # Trạng thái đã nhặt hay chưa

# 2. Hàm Ready chạy khi món đồ vừa xuất hiện
func _ready():
	# Kiểm tra xem có node con StaticBody2D không trước khi tắt/mở để tránh lỗi
	if has_node("StaticBody2D/CollisionShape2D"):
		$StaticBody2D/CollisionShape2D.disabled = !is_wall

# 3. Hàm Process xử lý việc nhấn nút
func _process(_delta):
	if is_collected: return # Nếu nhặt rồi thì không làm gì nữa
	if DialogueBox.is_active: return
	
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		DialogueBox.show_message(interaction_text)
		
		# Nếu là đồ thu thập được
		if is_collectible:
			collect_item()
		
func collect_item():
	is_collected = true
	GameManager.add_treasure() # Cộng điểm vào bộ não
	# Làm cho món đồ biến mất (hoặc bạn có thể đổi hình ảnh sang rương rỗng)
	self.visible = false 
	# Tắt va chạm để không đụng phải đồ đã biến mất
	set_deferred("monitoring", false) 
	if has_node("StaticBody2D/CollisionShape2D"):
		$StaticBody2D/CollisionShape2D.disabled = true

# 4. Các hàm xử lý va chạm (Tín hiệu - Signals)
func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
