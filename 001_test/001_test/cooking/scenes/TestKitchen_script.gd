extends Control

onready var clients_tree = get_node("HBoxContainer")

onready var current_food = get_node("Label")

export (PackedScene) var Client


export var max_clients: int
export var cur_clients = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	update_clients()
	pass # Replace with function body.


func _process(delta):
	current_food.text = str(Global.score) + "$\n" + str(Global.food) + "\n" + str(cur_clients) + "/" + str(max_clients)
#	pass


func _on_Button_pressed():
	if(cur_clients!=max_clients):

		var new_client = Client.instance()
		
		new_client.connect("lost_client", self, "loss")
		clients_tree.add_child(new_client)
		update_clients()
		

func update_clients():
	cur_clients = clients_tree.get_child_count()

func loss():
	update_clients()



func _on_Control_loss():
	update_clients()
	pass # Replace with function body.


