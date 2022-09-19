extends Control

#signals
signal lost_client

onready var body = get_node("Button")

onready var info = get_node("ClientBody/ClientInfo")

onready var pat = get_node("Patience")
onready var timer = get_node("Patience/Timer")


#Here you have a resource that hosts are the data about the client.
#If someone wants to change one aspect of a specific client class, they can just edit the file, instead of the whole scene
export(Resource) var mind 

# Called when the node enters the scene tree for the first time.
func _ready():

	#set up the rest
	info.text = String(mind.cname)  + "\n" + String(mind.wants.order)
	pat.max_value = mind.patience
	pat.value = mind.patience
	timer.wait_time = mind.patience
	timer.start()
	pass # Replace with function body.


func _process(delta):
	pat.value = timer.time_left


func _on_Timer_timeout():
	served(false)
	queue_free()


func test():
	Global.food.sort()
	mind.wants.order.sort()
	if(Global.food == mind.wants.order):
		served(true)
		queue_free()
	pass # Replace with function body.


#signal emitted every time client exits the game
#(either by time-out or) 
func served(done):
	emit_signal("lost_client")
	#Check if client was properly served
	if(done):
		Global.score += mind.points
	else:
		Global.score -= (mind.points * 2)


