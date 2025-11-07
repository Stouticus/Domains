extends Node

func _ready():
	var campaign = Campaign.new()
	var player = Player.new()
	player.player_name = "Player 1"
	player.money = 25
	campaign.player = player
	add_child(campaign)
	
	var team_level = player.team.get_level()
	campaign.start_recruit_phase(team_level)

	# Hire the first recruit
	if campaign.shop.pool.size() > 0:
		campaign.shop.hire(player, 0)
	
		# Hire the first recruit
	if campaign.shop.pool.size() > 0:
		campaign.shop.hire(player, 0)

	print("\n--- Player Team ---")
	for m in player.team.members:
		m.print_info()
	print("Player Money: %d" % player.money)
