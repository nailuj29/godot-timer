extends Control

@onready var edit_time_button: Button = %EditTimeButton
@onready var time_input: TimeInput = %TimeInput


func _on_edit_time_button_pressed() -> void:
	edit_time_button.visible = false
	time_input.visible = true


func _on_time_input_done(time: int) -> void:
	time_input.visible = false
	edit_time_button.visible = true
