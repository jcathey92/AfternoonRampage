extends Area2D

var container: Array = [] 

func _on_DeliveryBox_body_entered(body):
	if body is Player:
		if body.Inventory.size() >= 1:
			container.append(body.Inventory)
			body.drop_off_gift()
func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_end"):
		print("DeliveryBox: " + String(container))
