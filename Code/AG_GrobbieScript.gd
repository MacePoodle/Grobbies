extends KinematicBody2D

#VARIABLES

export var TOPSPEED : Vector2
export var DIRECTION : int   #1 = North, 2 = South, 3= East, 4 = West
export var GRAVITY: int = -100



#BUILT-IN GODOT FUNCTIONS
func _ready():
	pass # Replace with function body.
	TOPSPEED.y = -850

func _physics_process(delta):
	#pass
	TOPSPEED.y += delta * GRAVITY
	
	var Collision = move_and_collide(TOPSPEED * delta)
	
	if Collision:
		TOPSPEED.y = 0
		GRAVITY = 0
		#print("COLLING")
		
	
		#print("NOT COLLIDING")
		
	
	
#GODOT SIGNAL FUNCTION

func _on_Area2D_body_exited(body):
	print("BODY HAS EXITED")
	TOPSPEED.y = -850
	GRAVITY = -10
	
