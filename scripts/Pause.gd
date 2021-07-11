extends Control

func _ready():
	$Options/Voltar.connect("pressed", self, "_on_options_back_pressed")
	exchange_language()

func exchange_language():
	$"Pause/Pause Title".text = Options.lang_content["game_paused"]
	$"Pause/Opcoes".text = Options.lang_content["options"]
	$"Pause/Salvar e sair".text = Options.lang_content["save_and_leave"]
	$"Pause/Salvar".text = Options.lang_content["save"]
	$"Pause/Voltar a tela inicial".text = Options.lang_content["return_to_home_screen"]

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and not Playervariables.anti_pause:
		if get_tree().paused:
			get_tree().paused = false
			$Pause.visible = true
			$Options.visible = false
			visible = false
		else:
			get_tree().paused = true
			visible = true

func _on_save_pressed():
	Playervariables.create_save()

func _on_quit_pressed():
	Playervariables.create_save()
	get_tree().quit()

func _on_back_to_homescreen_pressed():
	Playervariables.reset_vars()
	get_tree().paused = false
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/TelaInicial.tscn")

func _on_options_pressed():
	$Pause.visible = false
	$Options.visible = true

func _on_options_back_pressed():
	$Options.visible = false
	$Pause.visible = true
	Options.create_save()
