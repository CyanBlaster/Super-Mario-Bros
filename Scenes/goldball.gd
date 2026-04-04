extends Area2D

var speed = 500
var direction = 1
var life = 1


func _ready() -> void:
	#position.y = Mario.position.y
	#direction = Mario.d 
	name = "goldball_" + str(Mario.balls)
	position.y -= 15
	pass

func _process(delta: float) -> void: 
	position.x += speed * direction * delta 


func _on_area_entered(area: Area2D) -> void:
	if(area.name == "GoombaPlayerDetector" || area.name == "GoombaWallDetector" || area.name == "Koopa_Wall_Detector" || area.name == "Player_Detector" || area.name.begins_with("Ice_")):
		queue_free()
	if(area.name == "PeachHitDetector"):
		Peach.boss_health -= 5
		print(Peach.boss_health)
		queue_free()
