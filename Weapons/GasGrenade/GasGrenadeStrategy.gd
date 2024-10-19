extends WeaponStrategy
class_name GasGrenadeStrategy

var gas_grenade_scene: PackedScene = preload("res://Weapons/GasGrenade/GasGrenade.tscn")

func _init():
	ammo = 0

func shoot(start_position: Vector2, direction: Vector2) -> Node2D:
	if not has_ammo():  # Verifica si hay munición antes de disparar
		print("No hay munición para disparar la granada.")
		return null
	
	var grenade = gas_grenade_scene.instantiate()
	grenade.position = start_position
	grenade.linear_velocity = direction * get_projectile_speed()
	grenade.set_damage(get_damage())
	ammo -= 1
	return grenade

func get_damage() -> int:
	return 2

func get_projectile_speed() -> float:
	return 600.0  

func get_weapon_description() -> String:
	return "Granada de humo"
