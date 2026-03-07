extends AudioStreamPlayer
var power = false

func _process(_delta: float) -> void:
	if(Mario.powerup != Mario.oldpower):	
		if(power == false):
			power = true
			play()
			Mario.oldpower = Mario.powerup
			power = false
