extends TileMap

var points_array := [Vector2i()]
@onready var path_2d = $"../Path2D"

var astar_grid := AStarGrid2D.new()
func _ready():
	path_2d.global_position = Vector2(8,8)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.region = get_used_rect()
	var used_cells = get_used_cells(0)

	#astar_grid.set_point_solid()
	astar_grid.cell_size = Vector2(16, 16)
	for row in astar_grid.region.size.x:
		for column in astar_grid.region.size.y:
			points_array.push_back(Vector2i(row,column))
	astar_grid.update()
	for point in points_array:
		if !used_cells.has(point):
			astar_grid.set_point_solid(point)
	$Line2D.global_position = Vector2(8,8)

func _input(event):
	if event.is_action_pressed("click"):
		path_2d.curve.clear_points()
		var path_points = astar_grid.get_point_path(Vector2i(0, 0), get_global_mouse_position()/16 as Vector2i)
		$Line2D.points = path_points
		for point in path_points:
			path_2d.curve.add_point(point)

