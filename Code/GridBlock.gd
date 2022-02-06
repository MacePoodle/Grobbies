extends Node2D

onready var spriteImage = $Sprite_Image
onready var spriteGrid = $Sprite_Grid

var currentElement = 0

#Grobbies
onready var possible_elements = [
	'res://Art/Sprites/null_20x20.png',
	'res://Art/Sprites/Grobbie_Blue.png',
	'res://Art/Sprites/Grobbie_Green.png',
	'res://Art/Sprites/Grobbie_Orange.png',
	'res://Art/Sprites/Grobbie_Purple.png',
	'res://Art/Sprites/Grobbie_Red.png',
	'res://Art/Sprites/Grobbie_Yellow.png'
]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#print(possible_elements.size())
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if spriteGrid.get_rect().has_point(to_local(event.position)):
			spriteGrid.modulate = Color.blueviolet
	
			#increment counter
			currentElement += 1
			
			#check if counter is at the end of the selection list, if so reset back to zero and set Sprite_Image to null
			if currentElement >= possible_elements.size():
				currentElement = 0

			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spriteImage.texture = load(possible_elements[currentElement])
