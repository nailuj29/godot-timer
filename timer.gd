extends Control

@onready var edit_time_button: Button = %EditTimeButton
@onready var time_input: TimeInput = %TimeInput
@onready var time_label: Label = %TimeLabel

var time: float = 0:
	set(value):
		if value >= 0:
			time = value
			var int_time := int(time)
			var hours: int = floor(int_time / (60 * 60))
			var left := int_time % (60 * 60)
			var minutes: int = floor(left / 60)
			var seconds = left % 60
			time_label.text = str(hours).lpad(2, "0") \
				+ ":" + str(minutes).lpad(2, "0") + ":" \
				+ str(seconds).lpad(2, "0")

func _on_edit_time_button_pressed() -> void:
	edit_time_button.visible = false
	time_input.visible = true
	time_input.time = "000000"

func _on_time_input_done(time: int) -> void:
	time_input.visible = false
	edit_time_button.visible = true
	if (time != -1):
		self.time = time
