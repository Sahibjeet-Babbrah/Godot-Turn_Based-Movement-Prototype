extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()
var target = Vector2()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x += -1
	if Input.is_action_pressed('ui_up'):
		velocity.y += -1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
#	get_input()
#	velocity = move_and_slide(velocity)
	velocity = (target - position).normalized() * speed
	if (target - position).length() > 5:
		velocity = move_and_slide(velocity)

func move_to_locations(input: Vector2):
	target = input

func _input(event):
	if event.is_action_pressed('click'):
		target = get_global_mouse_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
