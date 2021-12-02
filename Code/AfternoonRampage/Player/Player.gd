extends KinematicBody2D
class_name Player

var speed: float = 50.0
var direction: Vector2
	

func _ready():
	Main.TestPrint("Hello Main!")

func _process(delta):
	if Input.is_action_pressed("P1_move_up"):
		#direction.y -= speed 
		print("Move Up")
	if Input.is_action_pressed("P1_move_down"):
		print("Move Down")
