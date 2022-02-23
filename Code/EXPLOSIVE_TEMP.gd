extends KinematicBody2D

#VARIABLES

export var TOPSPEED : Vector2
export var DIRECTION : int   #1 = North, 2 = South, 3= East, 4 = West
export var GRAVITY: int



#BUILT-IN GODOT FUNCTIONS
func _ready():
	pass # Replace with function body.
	TOPSPEED.y = -750

func _physics_process(delta):
	if Input.is_action_just_pressed("debug_toggle"):
		self.queue_free()
	
	
	#pass
	TOPSPEED.y += delta * GRAVITY
	
	move_and_collide(TOPSPEED * delta)
	
	
	
#CUSTOM FUNCTION
