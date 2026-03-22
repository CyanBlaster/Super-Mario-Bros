extends Node2D


func _process(_delta):
	if Input.is_action_just_pressed("fireball"):
		get_tree().change_scene_to_file("res://Scenes/Levels/world_1_1.tscn")
