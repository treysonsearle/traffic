extends PathFollow2D

var stopped = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("click")):
		progress_ratio = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !stopped:
		progress += 1


func _on_area_2d_area_entered(area):
	stopped = true


func _on_area_2d_area_exited(area):
	stopped = false
