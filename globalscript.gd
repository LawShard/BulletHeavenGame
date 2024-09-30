extends Node

var game_ended = false
var exp
var level = 1
func _physics_process(delta):
	if exp == 10:
		level_up()
func level_up():
	level += 1
