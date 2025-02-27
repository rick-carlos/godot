extends Sprite2D


var speed = 150

func _process(delta): #detecção das teclas WASD
	
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
	look_at(get_global_mouse_position()) #olha em direção ao mouse.
