extends AnimatedSprite

# Declare member variables here. Examples:
#onready var ray = $RayCast2D

export (int) var speed = 256
var tile_size = 128

var last_position = Vector2()
var target_position = Vector2()
var moveDir = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	#Make sure the unit is snapped to the grid
	position = position.snapped(Vector2(tile_size, tile_size))
	last_position = position
	target_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if ray.is_colliding():
	#	position = last_position
	#	target_position = last_position
	
	position += speed * moveDir * delta
	if position.distance_to(last_position) >= tile_size:
		position = target_position
	
	if position == target_position:
		get_moveDir()
		last_position = position
		target_position += moveDir * tile_size

func get_position():
	return position

func get_moveDir():
	var LEFT = Input.is_action_pressed('ui_left')
	var RIGHT = Input.is_action_pressed('ui_right')
	var UP = Input.is_action_pressed('ui_up')
	var DOWN = Input.is_action_pressed('ui_down')
	
	moveDir.x = -int(LEFT) + int(RIGHT)
	moveDir.y = -int(UP) + int(DOWN)
	
	if moveDir.x != 0 && moveDir.y != 0:
		moveDir = Vector2.ZERO
#	if moveDir != Vector2.ZERO:
#		ray.cast_to = moveDir * tile_size / 2
