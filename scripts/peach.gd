extends RigidBody2D

signal game_over

var initial_velocity = 200

@onready var detection_area = $Area2D

func _ready():
	var angle = randf_range(-0.5, 0.5)
	linear_velocity = Vector2(initial_velocity * angle, -initial_velocity)
	angular_velocity = 0
	angular_damp = 1
	
	detection_area.area_entered.connect(_on_area_entered)

func _integrate_forces(state):
	state.angular_velocity = 0
	
	for contact in state.get_contact_count():
		var collider = state.get_contact_collider_object(contact)
		if collider and collider.is_in_group("paddle"):
			state.linear_velocity.y = -200

func _on_area_entered(area):
	print("Area entered: ", area.name)
	if area.name == "FailZone":
		print("Game Over!")
		game_over.emit()
		queue_free()
