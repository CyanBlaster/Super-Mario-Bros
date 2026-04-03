extends Node2D


func _process(_delta):
	if Input.is_action_just_pressed("jump"):  
		get_tree().change_scene_to_file("res://Scenes/Levels/boss_fight.tscn")
	
