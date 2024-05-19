extends CenterContainer
class_name TimeInput

signal done(time: int)

var time: String = "000000":
	set(value):
		time = value
		time_label.text = time.substr(0, 2) + ":" + time.substr(2, 2) + ":" + time.substr(4, 2)

@onready var time_label: Label = %TimeLabel

func add_num(num: String):
	time = (time + num).substr(len(num))


func _on_cancel_button_pressed() -> void:
	done.emit(-1)


func _on_done_button_pressed() -> void:
	var hours = int(time.substr(0, 2))
	var minutes = int(time.substr(2, 2))
	if minutes > 59:
		minutes = 59
	var seconds = int(time.substr(4, 2))
	if seconds > 59:
		seconds = 59
	
	done.emit(hours * 60 * 60 + minutes * 60 + seconds)


func _on_1button_pressed() -> void:
	add_num("1")


func _on_2button_pressed() -> void:
	add_num("2")


func _on_3button_pressed() -> void:
	add_num("3")


func _on_4button_pressed() -> void:
	add_num("4")


func _on_5button_pressed() -> void:
	add_num("5")


func _on_6button_pressed() -> void:
	add_num("6")


func _on_7button_pressed() -> void:
	add_num("7")


func _on_8button_pressed() -> void:
	add_num("8")


func _on_9button_pressed() -> void:
	add_num("9")


func _on_0button_pressed() -> void:
	add_num("0")


func _on_00button_pressed() -> void:
	add_num("00")
