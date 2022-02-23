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
	#pass
	TOPSPEED.y += delta * GRAVITY
	
	var Collision = move_and_collide(TOPSPEED * delta)
	
	if Collision:
		TOPSPEED.y = 0
		GRAVITY = 0
		print("HELLO")
		
	if !Collision:
		TOPSPEED.y = -750
		GRAVITY = -750
		print("HELLO")
		
	
	
#CUSTOM FUNCTION

