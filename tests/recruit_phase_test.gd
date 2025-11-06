extends Node

func _ready():
	var campaign = Campaign.new()
	var player = Player.new()
	player.player_name = "Player 1"
	campaign.player = player
	add_child(campaign)
	campaign.start_recruit_phase()

	# Hire the first recruit
	if campaign.shop.pool.size() > 0:
		campaign.shop.hire(player, 0)

	print("\n--- Player Team ---")
	for m in player.team.members:
		print("- %s | Domain: %s | Rank: %d | HP: %d" %
			[m.member_name, m.domain, m.rank, m.health])
	print("Player Money: %d" % player.money)
	
		# Hire the first recruit
	if campaign.shop.pool.size() > 0:
		campaign.shop.hire(player, 0)

	print("\n--- Player Team ---")
	for m in player.team.members:
		print("- %s | Domain: %s | Rank: %d | HP: %d" %
			[m.member_name, m.domain, m.rank, m.health])
	print("Player Money: %d" % player.money)
