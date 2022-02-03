extends Node2D

#Grid Variables
export (int) var width
export (int) var height
export (int) var x_start
export (int) var y_start
export (int) var offset


var possible_grobbies = [
	preload('res://Scenes/Grobbies/Orange_Grobbie.tscn'),
	preload('res://Scenes/Grobbies/Purple_Grobbie.tscn')
]

var all_grobbies = []


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	all_grobbies = make_2d_array()
	print(all_grobbies)
	
	spawn_grobbies()

func make_2d_array():
	var array = []
	for i in width:
		array.append([])
		for j in height:
			array[i].append(null)
	return array
	
func spawn_grobbies():
	for i in width:
		for j in height:
			#choose random number and store it
			var rand = floor(rand_range(0, possible_grobbies.size()))	
			#insance that piece from the array
			var grobbie = possible_grobbies[rand].instance()
			add_child(grobbie)
			grobbie.position = grid_to_pixel(i,j)

func grid_to_pixel(column, row):
	var new_x = x_start + offset * column
	var new_y = y_start + -offset * row
	return Vector2(new_x, new_y)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


