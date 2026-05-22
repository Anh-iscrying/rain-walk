extends CharacterBody2D

@export var speed = 300
@onready var sprite = $Sprite2D

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	if Input.is_action_pressed("ui_down"):
		direction.y += 1

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	velocity = direction.normalized() * speed
	move_and_slide()
	
	# 2. PHẦN MỚI: Hoạt ảnh nhún nhảy
	if velocity.length() > 0:
		# Nếu đang di chuyển: Làm con mèo phập phồng theo thời gian
		# Dùng hàm sin() để tạo chuyển động nhịp nhàng lên xuống
		var bounce = sin(Time.get_ticks_msec() * 0.015) * 0.2
		sprite.scale.y = 1.0 + bounce
		sprite.scale.x = 1.0 - bounce
	else:
		# Nếu đứng im: Trả tỉ lệ về bình thường (1.0)
		sprite.scale.y = move_toward(sprite.scale.y, 1.0, delta * 5)
		sprite.scale.x = move_toward(sprite.scale.x, 1.0, delta * 5)


func _on_interactable_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
