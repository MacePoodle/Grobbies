
extends KinematicBody2D

#Connection prep
onready var raycast = $RayCast2D

#Coonstants
var GobbieColor = "BLUE"
var GrobbiePosition : int


#Movement Variables
var GRAVITY = -750.0
var velocity = Vector2()
var able = true

var restPosition = Vector2.ZERO

#Raycast Variables
var CollisionDetectionRaycastLength = -75
var NeighborDetectionRaycastLength = 75
var NeighborsChecked = 0
var NeighborsIDArray = []

#Location Variables   -- TODO MAKE A COLLIDER LAYER, MAKE A COLLIDER ON THE GRID, MAKE A RAY CAST TO DETECT, PRINT
var RowPosition : int
var ColPosition : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	raycast.cast_to.y = CollisionDetectionRaycastLength 
	print(RowPosition)

func _process(delta):
	if Input.is_action_just_pressed("debug_toggle"):
#		print(RowPosition)
#		print(ColPosition)
#		print(restPosition.x)	
#		print(restPosition.y)
		self.position.x = restPosition.x
		self.position.y = restPosition.y
#
		#Destroy Mode
		#self.queue_free()

func _physics_process(delta):
	
	
	
	if able:
		velocity.y += delta * GRAVITY
		#velocity.x += delta * GRAVITY

	if !able:
		velocity.y = 0
		velocity.x = 0
	
	var collision = move_and_collide(velocity * delta)
	
	#HANDLE COLLSION
	if get_node('RayCast2D').is_colliding():
		self.able = false
		self.position.x = restPosition.x
		self.position.y = restPosition.y
		
		#NOW CORRECT FOR WEIRD COLLISION OVERSHOOT ANNOYANCE DUE TO FRAMERATE
		##get_node('RayCast2D').get_collider()
		###USE AREA BODY COLLISION WITH ROW/COL AREA BODY AND THEN USE THEIR 
		
		
	if !get_node('RayCast2D').is_colliding():
		self.able = true

