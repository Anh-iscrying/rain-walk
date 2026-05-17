extends CanvasLayer

@onready var text_label = $Panel/DialogueText
@onready var timer = $TypeTimer
@onready var panel = $Panel

var is_active = false

func _ready():
	panel.visible = false # Ẩn hộp thoại khi mới vào

# Hàm để bắt đầu hiện hội thoại
func show_message(text: String):
	panel.visible = true
	is_active = true
	text_label.text = text
	
	# Hiệu ứng chữ chạy từ từ (Typewriter)
	text_label.visible_ratio = 0
	var tween = create_tween()
	tween.tween_property(text_label, "visible_ratio", 1.0, 1.0) # Chạy trong 1 giây

func _input(event):
	# Nếu đang hiện hội thoại mà nhấn phím Enter/Space (ui_accept) thì đóng lại
	if is_active and event.is_action_pressed("ui_accept"):
		panel.visible = false
		is_active = false
