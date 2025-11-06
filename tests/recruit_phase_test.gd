extends Node

func _ready():
	var campaign = Campaign.new()
	var player = Player.new()
	player.player_name = "Player 1"
	player.money = 25
	campaign.player = player
	add_child(campaign)
	campaign.start_recruit_phase()

	# Hire the first recruit
	if campaign.shop.pool.size() > 0:
		campaign.shop.hire(player, 0)

	print("\n--- Player Team ---")
	for m in player.team.members:
		m.print_info()
	print("Player Money: %d" % player.money)
	
		# Hire the first recruit
	if campaign.shop.pool.size() > 0:
		campaign.shop.hire(player, 0)

	print("\n--- Player Team ---")
	for m in player.team.members:
		m.print_info()
	print("Player Money: %d" % player.money)
