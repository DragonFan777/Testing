extends Control

onready var clients_tree = get_node("HBoxContainer")

onready var current_food = get_node("Label")

export (PackedScene) var Client


export var max_clients: int
export var cur_clients = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	current_food.text = String(Global.score) + "$\n" + String(Global.food) + "\n" + String(cur_clients) + "/" + String(max_clients)
#	pass


func _on_Button_pressed():
	if(cur_clients==max_clients):
		pass
	else:
		cur_clients += 1
		var new_client = Client.instance()
		
		new_client.connect("lost_client", self, "loss")
		clients_tree.add_child(new_client)
		
		
		
	pass # Replace with function body.



func loss():
	cur_clients -= 1



func _on_Control_loss():
	cur_clients -= 1
	pass # Replace with function body.


