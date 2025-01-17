extends Area2D
class_name Win_condition
signal win


func _on_body_entered(body):
	win.emit()
	pass # Replace with function body.
