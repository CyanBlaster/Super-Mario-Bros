extends Area2D

var speed = 500
var direction = 1
var life = 1


func _ready() -> void:
	#position.y = Mario.position.y
	#direction = Mario.d
	name = "fireball_" + str(Mario.balls)
	position.y -= 15
	pass

func _process(delta: float) -> void:
	position.x += speed * direction * delta
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.name == "Goomba"):
		print(area.name)
		queue_free()
