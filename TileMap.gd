extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_cell(10,1,1)
	set_cell(10,2,get_cell(10,1))
	pass # Replace with function body.

func _input(event):
	if(event is InputEventMouseButton):
		if(event.is_pressed()):
			print(event.position)
			# Use global mouse position to work with camera
			# https://godotengine.org/qa/58255/getting-location-position-tilemaps-world_to_map-incorrect
			var tilemap_pos=world_to_map(get_global_mouse_position())
			if(get_cellv(tilemap_pos) == -1):
				set_cellv(tilemap_pos, 0)
			else:
				set_cellv(tilemap_pos, -1)
				
			
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var clean = 0
	if(Input.is_action_pressed("ui_right")):
		$Sprite.global_position.x+=10
	if(Input.is_action_pressed("ui_left")):
		$Sprite.global_position.x-=10
	if(Input.is_action_pressed("ui_up")):
		$Sprite.global_position.y-=10
	if(Input.is_action_pressed("ui_down")):
		$Sprite.global_position.y+=10

	if(Input.is_action_pressed("ui_accept")):
		clean=1
	
	var tilemap_pos=world_to_map($Sprite.global_position)
	#if(get_cellv(tilemap_pos) == -1):
	if(clean):
		set_cellv(tilemap_pos, -1)
	else:
		set_cellv(tilemap_pos, 1)
