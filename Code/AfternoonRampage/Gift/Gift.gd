extends Node2D
class_name Gift

# enum gift types?

onready var sprite: AnimatedSprite = $Sprite

func _ready():
	sprite.frame = round(rand_range(0,3))

func _on_Gift_body_entered(body):
	if body is Player:
		queue_free()
