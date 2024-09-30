extends Node2D
var expPlayer : int
var level : int = 1

func _ready():
	%GameOver.visible = false
	Globalscript.game_ended = false

func spawn_mob():
	var new_mob = preload("res://enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_spawner_timeout():
	spawn_mob()

func _on_player_health_depleted():
	%GameOver.visible = true
	Globalscript.game_ended = true


func _on_button_pressed():
	get_tree().reload_current_scene()
