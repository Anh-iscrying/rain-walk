extends Node

var total_treasures = 0 # Số rương đã nhặt

# Hàm này để các món đồ gọi khi bị nhặt
func add_treasure():
	total_treasures += 1
	print("Đã nhặt: ", total_treasures)
	if total_treasures == 5:
		DialogueBox.show_message("Bạn đã thu thập đủ 5 mảnh ký ức! Hãy tìm cánh cổng để thoát khỏi rừng mưa.")
	
