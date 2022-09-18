extends Resource

class_name order
#old method for making orders below \/
#enum test {Strawberry, Water, Meat}

const menu = ["Strawberry", "Water", "Meat"]

#export(Array, test) var order
#export(Array, menu) var order2

#Array where you can pick menu
export(Array, String, "Strawberry", "Water", "Meat") var order
