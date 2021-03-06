extends Node

var slot
var money = 0 setget set_money, get_money
var drink_value
var game_1 = 0
var game_2 = 0
var date = {'day': 1, 'hour': 0}
var shop = {
	'permissions': ["wallpaper/1", "chairs/1", "cabinet/1"],
	'equipped': {'chairs': "1:4", 'cabinet': "1:5", 'wallpaper': "1:0"}}

var positon
var can_walk = true
var busy = false


func set_yield():
	var gain = drink_value * (game_1 + game_2) / 2
	self.money += gain

func clear_yield():
	game_1 = 0
	game_2 = 0

func set_money(value):
	money = value
	get_node("/root/Game/VBoxContainer/Money").text = Options.lang_content["money"] % value

func get_money():
	return money

func load_save():
	var file = File.new()
	var error = file.open_encrypted_with_pass(slot, File.READ, 'zito20201805')
	if error:
		print(error)
	else:
		var data = file.get_var()
		return data
	file.close()

func create_save():
	var file = File.new()
	var error = file.open_encrypted_with_pass(slot, File.WRITE, 'zito20201805')
	var data = {
		'money': money,
		'position': positon,
		'data': date,
		'shop': shop
		}
	if error:
		print(error)
	else:
		file.store_var(data)
	file.close()

func reset_vars():
	money = 0
	game_1 = 0
	game_2 = 0
	date = {'day': 1, 'hour': 0}
	positon = 0
	shop = {
		'permissions': ["wallpaper/1", "chairs/1", "cabinet/1"],
		'equipped': {'chairs': "1:4", 'cabinet': "1:5", 'wallpaper': "1:0"}}
