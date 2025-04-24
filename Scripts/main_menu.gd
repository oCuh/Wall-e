extends Control

@onready var mainTheme = $mainTheme
@onready var timer = $Timer
@onready var startOst = $startOST

func _on_menu_button_pressed():
	mainTheme.stop()
	startOst.play()

func _on_start_ost_finished():
	timer.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
