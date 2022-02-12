extends Area2D

#Variables
export var row : int
export var col : int


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	pass
	

	#if body.is_in_group("player"):
	#    print(str('Player has entered')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_12_body_entered(body):
	print(str('Body entered: ', body.get_name()))
	#print(str('Variable RowPosition Being Read: ', body.RowPosition ))
	
	#Set The Grobbies curent Row and Column number.
	body.RowPosition = row
	body.ColPosition = col
	#TODO Read VAriable From Grobbie
	#TODO Set Variable To Grobbie
