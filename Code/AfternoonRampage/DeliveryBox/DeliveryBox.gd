extends Area2D
class_name DeliveryBox


onready var sprite: AnimatedSprite = $Sprite
enum{
	Box,
	Cake,
	Necklace,
	Duck
}
export var gift: int

func _ready():
	gift = randi() % 3

func _process(delta):
	match gift:
		Box:
			sprite.frame = Box
		Cake:
			sprite.frame = Cake
		Necklace:
			sprite.frame = Necklace
		Duck:
			sprite.frame = Duck


func _on_DeliveryBox_body_entered(body):
	if body is Player:
		if body.invetory == gift:
			body.dropoff()
			gift = 4


func _on_DeliveryBox_body_exited(body):
	if body is Player:
		if body.invetory == gift:
			gift = randi() % 3
