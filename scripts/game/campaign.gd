extends Node
class_name Campaign

# Player and Turn Info
var player: Player = Player.new()
var turn_number: int = 1

# Phase Management
enum Phase { RECRUIT, POSITIONING, BATTLE, REWARDS, END }
var current_phase: Phase = Phase.RECRUIT

# Managers
@onready var shop: Shop = Shop.new()
@onready var battle_manager: BattleManager = BattleManager.new()

# Called when the campaign starts
func _ready():
	print("Campaign started!")
	start_turn()

# Start a new turn
func start_turn():
	print("\n--- Turn %d ---" % turn_number)
	current_phase = Phase.RECRUIT
	player.start_turn()
	show_phase_info()

# --- Recruit Phase ---
func start_recruit_phase():
	current_phase = Phase.RECRUIT
	print("\n--- Recruit Phase ---")
	shop.generate_pool()
	print("Available recruits:")
	for i in range(shop.pool.size()):
		var r = shop.pool[i]
		print("%d: %s | Domain: %s | Rank: %d | Rarity: %s | Cost: %d" %
			[i, r.name, r.domain, r.rank, r.rarity, r.cost])
			
# Display phase info and trigger actions
func show_phase_info():
	match current_phase:
		Phase.RECRUIT:
			self.start_recruit_phase()
		Phase.POSITIONING:
			print("Positioning Phase: Arrange your Team on the Board.")
			# Placeholder for positioning logic
		Phase.BATTLE:
			print("Battle Phase: Fight the queued opponent!")
			var opponent_team = generate_opponent_team()
			battle_manager.start_battle(player.team, opponent_team)
		Phase.REWARDS:
			print("Rewards Phase: Gain Money, XP, and Items.")
			# Placeholder for reward distribution
		Phase.END:
			print("End of Turn.")
			turn_number += 1
			start_turn()

# Generate a temporary opponent team (AI placeholder)
func generate_opponent_team() -> Team:
	var team = Team.new()
	# Example: fill with 3 random recruits
	for i in range(3):
		var r = Recruit.new()
		r.randomize_stats()
		team.add_member(r)
	return team
