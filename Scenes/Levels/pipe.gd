extends Sprite2D
var cooldown = 10

@onready var goomba = preload("res://Scenes/goomba.tscn")

func _process(delta: float) -> void:
	if(cooldown <= 0):
		var instance = goomba.instantiate()
		instance.position = position
		get_tree().current_scene.add_child(instance)
		cooldown = 10
	
	cooldown -= delta
