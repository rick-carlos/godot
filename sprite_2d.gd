extends CharacterBody2D


var speed = 150.0

#Essa função é adequada pra movimentação e colisões, roda consistemente 
#independente da taxa de FPS
func _physics_process(delta: float) -> void: #detecção das teclas WASD
	
	var direção = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direção.y -= 1
	if Input.is_action_pressed("ui_down"):
		direção.y += 1
	if Input.is_action_pressed("ui_left"):
		direção.x -= 1
	if Input.is_action_pressed("ui_right"):
		direção.x += 1
	
	#normalizar a velocidade nas diagonais
	if direção.length() > 0:
		direção = direção.normalized() * speed * delta
	
	#move o objeto, sem o speed definido, a velocidade fica em 1px por segundo
	position += direção * speed * delta
	#se não colocar a rotação depois da posição, vai gerar tremores.
	move_and_slide()
	
	look_at(get_global_mouse_position()) #olha em direção ao mouse.
	
