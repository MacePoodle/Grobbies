
extends Node2D
onready var gridOverlay = $TextureRect_Overlay 


#Grid Variables
export (int) var columns
export (int) var rows
export (int) var x_start
export (int) var y_start
export (int) var offset

#Grobbies
#var possible_grobbies = [
#	preload('res://Scenes/LevelEditor/GridBlock.tscn')
#]

# Grobbie Choices
var possible_grobbies = [
	preload('res://Scenes/Grobbies/Orange_Grobbie.tscn'),
	preload('res://Scenes/Grobbies/Purple_Grobbie.tscn'),
	preload('res://Scenes/Grobbies/Yellow_Grobbie.tscn'),
	preload('res://Scenes/Grobbies/Red_Grobbie.tscn'),
	preload('res://Scenes/Grobbies/Blue_Grobbie.tscn'),
	preload('res://Scenes/Grobbies/Green_Grobbie.tscn')
]

# All Grobbies in scene
var all_grobbies = []

#Touch Variables
var touch_position = Vector2.ZERO
var touch_releast_position = Vector2.ZERO

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	all_grobbies = make_2d_array()
	print(all_grobbies)
	
	spawn_grobbies()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	touch_input()
	#if Input.is_action_just_pressed("ui_touch"):
		#y_start = y_start + 1260
		#spawn_grobbies()
		
	if Input.is_action_just_pressed("debug_restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("debug_fadegrid"):
		#lerp oppasity on grid texture
		gridOverlay.visible = !gridOverlay.visible


#CUSTOM FUNCTIONS
func touch_input():
	if Input.is_action_just_pressed("ui_touch"):
		touch_position = get_global_mouse_position()
		var grid_position = pixel_to_grid(touch_position.x, touch_position.y)
		print(grid_position)
	if Input.is_action_just_released("ui_touch"):
		touch_releast_position = get_global_mouse_position()	
	
func grid_to_pixel(column, row):
	var new_x = x_start + offset * column
	var new_y = y_start + -offset * row
	return Vector2(new_x, new_y)

func pixel_to_grid(pixel_x, pixel_y):
		var column = round((pixel_x - x_start) / offset)
		var row = round((pixel_y - y_start) / -offset)
		
		return Vector2(column, row)
		
		
func make_2d_array():
	var array = []
	for x in columns:
		array.append([])
		for y in rows:
			array[x].append(null)
	return array
	
func spawn_grobbies():
	for x in columns:
		for y in rows:
			#choose random number and store it
			var rand = floor(rand_range(0, possible_grobbies.size()))	
			#insance that piece from the array
			var grobbie = possible_grobbies[rand].instance()
			add_child(grobbie)
			grobbie.position = grid_to_pixel(x,y)
			all_grobbies[x][y] =  grobbie

#func match_at(column, row, color):
#	if column > 1:
#		if all_grobbies[i-1][j] != null && all_grobbies[i-2][j] != null:
#			pass


