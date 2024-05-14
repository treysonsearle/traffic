extends Sprite2D

var stop = false
@onready var collision_shape_2d = $Area2D/CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(0,1,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if stop:
		modulate = Color(0,1,0)
		stop = false
		collision_shape_2d.disabled = true
	else:
		modulate = Color(1,0,0)
		stop = true
		collision_shape_2d.disabled = false
