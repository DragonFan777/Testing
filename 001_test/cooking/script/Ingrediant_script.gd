extends Control

export var ingrediant = 0


onready var button = get_node("Button")

func _ready():
	button.text = String(Global.food_dic[ingrediant])
	pass # Replace with function body.





func _on_Button_pressed():
	if(Global.food.size()<3):
		Global.food.append(Global.food_dic[ingrediant])
	pass # Replace with function body.
