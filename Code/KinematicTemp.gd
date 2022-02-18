
extends KinematicBody2D
var GRAVITY = -750.0
var velocity = Vector2()
var CurrentPosition = Vector2()

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
	pass
#	CurrentPosition = get_position()
#
#
#	if get_node('RayCast2D').is_colliding():
#		self.able = false
#	if !get_node('RayCast2D').is_colliding():
#		self.able = true
#
#	if able:
#		velocity.y += delta * GRAVITY
#		#velocity.x += delta * GRAVITY
#		var collision = move_and_collide(velocity * delta)
#
#		#var motion = velocity * delta
#	if !able:
#		velocity.y = 0
#		velocity.x = 0
#
#
#
#	if !able:
#		self.transform.origin.x = CurrentPosition.x 
#		self.transform.origin.y = CurrentPosition.y 
#
#	if Input.is_action_just_pressed("debug_toggle"):
#		pass
		#PauseMode
		#able = !able
	
		#Destroy Mode
		#self.queue_free()

func _physics_process(delta):
	CurrentPosition = get_position()
	
	if get_node('RayCast2D').is_colliding():
		self.able = false
	if !get_node('RayCast2D').is_colliding():
		self.able = true
		
	if able:
		velocity.y += delta * GRAVITY
		#velocity.x += delta * GRAVITY
		var collision = move_and_collide(velocity * delta)
		
		#var motion = velocity * delta
	if !able:
		velocity.y = 0
		velocity.x = 0
	
	
	
	if !able:
		self.transform.origin.x = CurrentPosition.x 
		self.transform.origin.y = CurrentPosition.y 


	
	#self.axis_lock_motio\n_x = true
#	CurrentPosition = get_position()
#
#
#	if get_node('RayCast2D').is_colliding():
#		self.able = false
#	if !get_node('RayCast2D').is_colliding():
#		self.able = true
#
#	if able:
#		velocity.y += delta * GRAVITY
#		#velocity.x += delta * GRAVITY
#		var collision = move_and_collide(velocity * delta)
#
#		#var motion = velocity * delta
#	if !able:
#		velocity.y = 0
#		velocity.x = 0
	# Using move_and_collide.
	#var collision = move_and_collide(velocity * delta)
#	
	#Extend Not Able to fix petruding intersections due to velicity
#	if !able:
#		self.transform.origin.x = CurrentPosition.x 
#		self.transform.origin.y = CurrentPosition.y 
