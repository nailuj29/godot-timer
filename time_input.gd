extends CenterContainer
class_name TimeInput

signal done(time: int)

var time: String

func _on_cancel_button_pressed() -> void:
	done.emit(-1)
