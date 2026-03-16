extends AudioStreamPlayer
var on = true

func _process(_delta):
	if Input.is_action_just_pressed("volume"):
		print("d")
		if(on):
			on = false
		else:
			on = true
	if(on):
		volume_db = 0.0
	else:
		volume_db = -80.0
