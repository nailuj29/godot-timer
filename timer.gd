extends Control

@onready var edit_time_button: Button = %EditTimeButton
@onready var time_input: TimeInput = %TimeInput
@onready var time_label: Label = %TimeLabel
@onready var pause_button: Button = %PauseButton
@onready var alarm_player: AudioStreamPlayer = $AlarmPlayer

var original_time := 120.0
var time: float = 120.0:
	set(value):
		if value >= 0:
			time = value
			var int_time := int(ceil(time))
			var hours: int = floor(int_time / (60 * 60))
			var left := int_time % (60 * 60)
			var minutes: int = floor(left / 60)
			var seconds = left % 60
			time_label.text = str(hours).lpad(2, "0") \
				+ ":" + str(minutes).lpad(2, "0") + ":" \
				+ str(seconds).lpad(2, "0")
		else:
			time = 0
			time_label.text = "00:00:00"


var paused := false:
	set(value):
		paused = value
		if value:
			pause_button.text = "Unpause"
		else:
			pause_button.text = "Pause"


func  _process(delta: float) -> void:
	if not paused:
		time -= delta
		
	if time == 0 and not alarm_player.playing:
		alarm_player.play()
		pause_button.disabled = true


func _on_edit_time_button_pressed() -> void:
	edit_time_button.visible = false
	time_input.visible = true
	pause_button.disabled = true
	time_input.time = "000000"
	paused = true


func _on_time_input_done(time: int) -> void:
	time_input.visible = false
	edit_time_button.visible = true
	pause_button.disabled = false
	paused = false
	if (time > 0):
		original_time = time
		self.time = time


func _on_pause_button_pressed() -> void:
	paused = not paused


func _on_reset_button_pressed() -> void:
	time = original_time
	pause_button.disabled = false
	alarm_player.stop()
