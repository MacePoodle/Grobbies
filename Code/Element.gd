extends KinematicBody2D

const GRAVITY = -750.0
var velocity = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(delta):
	#self.axis_lock_motion_x = true
	if !is_on_floor():
		velocity.y += delta * GRAVITY
		velocity.x = 0 * delta
		#var motion = velocity * delta
		move_and_collide(velocity * delta)
	
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		#print("I collided with ", collision.collider.name)
		velocity.y = 0 * delta
		velocity.x = 0 * delta
		move_and_collide(velocity * delta)
	
#	set_physics_process(false
	#if is_on_floor():
	#	pause_mode = Node.PAUSE_MODE_STOP	
