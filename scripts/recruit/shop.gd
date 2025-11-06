extends Node
class_name Shop

@export var pool_size: int = 3  # Number of recruits per turn

var pool: Array = []  # Current recruit pool

# Generate a new pool of recruits
func generate_pool():
	pool.clear()
	for i in range(pool_size):
		var r = Recruit.new()
		r.randomize_stats()
		pool.append(r)

# Player tries to hire a recruit at index
func hire(player: Node, index: int) -> bool:
	if index >= pool.size():
		print("Invalid recruit index!")
		return false

	var recruit = pool[index]
	if player.money < recruit.cost:
		print("%s cannot afford %s (Cost: %d)" % [player.player_name, recruit.name, recruit.cost])
		return false

	if player.team.is_full():
		print("%s's team is full!" % player.player_name)
		return false

	# Deduct money and add recruit to team
	player.money -= recruit.cost
	player.team.add_member(recruit)
	pool.remove_at(index)
	print("%s hired %s!" % [player.player_name, recruit.name])
	return true
