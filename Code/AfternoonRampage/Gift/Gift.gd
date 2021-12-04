extends Area2D
class_name Gift

var gift_type

enum{
	Red,
	Blue
}

func _ready():
	if round(rand_range(0,1)) == 0:
		gift_type = Red
	else:
		gift_type = Blue

func _on_Gift_body_entered(body):
	if body is Player:
		body.pick_up_gift(gift_type)
		queue_free()
