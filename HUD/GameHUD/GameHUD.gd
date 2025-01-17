extends CanvasLayer
class_name GameHud

@onready var player_name_label: Label = $VBoxContainer/LblPlayerName
@onready var turn_time_label: Label = $VBoxContainer/LblTurnTime
@onready var weapon_name_label: Label = $VBoxContainerWeapon/LblWeaponName
@onready var winner_label: Label = $VBoxContainerWinner/LblWinner
@onready var return_timer: Timer = $ReturnTimer
@onready var win_sound: AudioStreamPlayer2D = $WinnerSound

signal game_over

func _ready():
	winner_label.hide()

func update_hud(player_name: String, turn_time: float, weapon: WeaponStrategy):
	player_name_label.text = "Turno de: " + player_name
	turn_time_label.text = "Tiempo restante: " + str(int(turn_time)) + "s"
	weapon_name_label.text = weapon.get_weapon_description()

func show_winner(player_name: String):
	win_sound.play()
	winner_label.show()
	winner_label.text = "Ganadooor: " + player_name + "!!" 
	turn_time_label.hide()
	weapon_name_label.hide()
	player_name_label.hide()
	return_timer.start()

func _on_return_timer_timeout():
	emit_signal("game_over")
