extends Area2D

var speed = 500
var direction = 1
var life = 1


func _ready() -> void:
	#name = "fireball_" + str(Mario.balls)
	name = "enemy fireball_" + str(Boss.enemyfire)
	print("I exist now")
	
	print(position.x, " ", position.y)

func _process(delta: float) -> void:
	position.x += speed * direction * delta
	print(position)
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "Goomba"):
		print(area.name) 
		queue_free() 

func _on_area_entered(area: Area2D) -> void:
	if(area.name == "Goomba"):
		print(area.name) 
		queue_free()
