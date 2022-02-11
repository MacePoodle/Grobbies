
extends KinematicBody2D
var GRAVITY = -750.0
var velocity = Vector2()

var able = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#Ready Self Components
onready var raycast = $RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	raycast.cast_to.y = -75

func _process(delta):
	if Input.is_action_just_pressed("debug_toggle"):
		pass
		#PauseMode
		#able = !able
	
		#Destroy Mode
		#self.queue_free()

func _physics_process(delta):
	#self.axis_lock_motion_x = true
	if able:
		velocity.y += delta * GRAVITY
		#velocity.x += delta * GRAVITY
		
		#var motion = velocity * delta
	if !able:
		velocity.y = 0
		velocity.x = 0
	
	
	# Using move_and_collide.
	var collision = move_and_collide(velocity * delta)
#	if collision:
#		#pass
#		self.able = false
#	if !collision:
#		#pass
#		self.able = true
	
	if get_node('RayCast2D').is_colliding():
		self.able = false
	if !get_node('RayCast2D').is_colliding():
		self.able = true
		
	
	
		#GREGIE TODO: THIS PREKS WHEN WE UNPAUSE, OBJECTS WITH SAME CONFIG COULD MOVE 1PXl, UPDATE SODE SO IT ONLY becomes ABLE to opects with no NORTH RAYCAST SIGNAL.  
		
		
	#var collision = move_and_collide(velocity * delta)
	#if collision:
	#	GRAVITY = 0
		#print("I collided with ", collision.collider.name)
#		velocity.y = 0 * delta
#		velocity.x = 0 * delta
#		move_and_collide(velocity * delta)
	
#	set_physics_process(false
	#if is_on_floor():
	#	pause_mode = Node.PAUSE_MODE_STOP	
