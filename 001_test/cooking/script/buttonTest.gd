extends Control

#signals
signal lost_client

onready var body = get_node("Button")

onready var info = get_node("ClientBody/ClientInfo")

onready var pat = get_node("Patience")
onready var timer = get_node("Patience/Timer")



export(Resource) var mind 

# Called when the node enters the scene tree for the first time.
func _ready():

	#set up the rest
	info.text = String(mind.cname)  + "\n" + String(mind.order)
	pat.max_value = mind.patience
	pat.value = mind.patience
	timer.start()
	pass # Replace with function body.



func _on_Timer_timeout():
	pat.value -= 1
	if(pat.value==0):
		
		served(false)
		queue_free()
		
	pass # Replace with function body.


func test():
	if(Global.food == mind.order):
		served(true)
		queue_free()
	pass # Replace with function body.



func served(done):
	emit_signal("lost_client")
	if(done):
		Global.score += mind.points
	else:
		Global.score -= (mind.points * 2)


