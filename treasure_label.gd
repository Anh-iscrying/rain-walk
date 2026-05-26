extends Label

func _process(_delta):
	# Luôn hiển thị số rương từ GameManager
	text = "Kho báu: " + str(GameManager.total_treasures) + "/5"
