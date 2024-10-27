extends Node

var leagues

var ita_teams
var maritime_teams
var north_american_teams
var swiss_teams
var international_teams
var international_women_teams
var australian_teams
var ontario_teams
var world_cup_teams


var break_team


#next team ID 93

func load_teams():
	
	var break_icon = load("res://assets/gamebreak.png")
	
	break_team = 	 {"colors" : ["#eed220", "#313431", "#e6eaee"], "short_name" :  "BRK","id" : 0, "name":"Game break","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 1, 
						 "lost":0, "icon" : break_icon, "goal_difference":0, "price":0}
	
	
	_load_ita_teams()
	_load_maritime_teams()
	_load_north_american_teams()
	_load_swiss_league()
	_load_international_teams()
	_load_internationa_women_teams()
	_load_australian_teams()
	_load_ontario_teams()
	_load_worldcup_teams()
	leagues  = [{"name":"World Cup", "teams" : world_cup_teams, "played" : 0, "won" : 0},
				{"name":"Italian Broomball League", "teams" : ita_teams, "played" : 0, "won" : 0},
				{"name":"Maritime Broomball Association", "teams":maritime_teams, "played" : 0, "won" : 0},
				{"name":"North American League", "teams" : north_american_teams, "played" : 0, "won" : 0},
				{"name":"Swiss Broomball Association", "teams" : swiss_teams, "played" : 0, "won" : 0},
				{"name":"International League", "teams" : international_teams, "played" : 0, "won" : 0},
				{"name":"International Women League", "teams" : international_women_teams, "played" : 0, "won" : 0},
				{"name":"Penrith Broomball Competition", "teams" : australian_teams, "played" : 0, "won" : 0},
				{"name":"Ontario League", "teams" : ontario_teams, "played" : 0, "won" : 0},
				]
				
	

func _load_ita_teams():
	var vikings_icon = load("res://assets/teams/italian-teams/leifers.png")
	var badboys_icon = load("res://assets/teams/italian-teams/badboys.png")
	var bcbelluno_icon = load("res://assets/teams/italian-teams/belluno.png")
	var blackwolves_icon = load("res://assets/teams/italian-teams/pochi.png")
	var bulldogs_icon = load("res://assets/teams/italian-teams/neumarkt.png")
	var groeden_icon = load("res://assets/teams/italian-teams/groeden.png")
	var neumarkt_icon = load("res://assets/teams/italian-teams/neumarkt.png")
	var pochi_icon = load("res://assets/teams/italian-teams/pochi.png")
	var sharks_icon = load("res://assets/teams/italian-teams/sharks.png")
	var stilfes_icon = load("res://assets/teams/italian-teams/stilfes.png")
	var agordino_bears_icon = load("res://assets/teams/italian-teams/agordino-bears.png")
	var dolomiti_warriors_icon = load("res://assets/teams/italian-teams/dolomiti-warriors.png")

	ita_teams = [ 
	 {"colors" : ["#EA2129", "#FFFFFF", "#EA2129"], "short_name" :  "BDN","id" : 1, "name":"Bulldogs","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 1, 
						 "lost":0, "icon" : bulldogs_icon, "goal_difference":0, "price":0},
	 {"colors" : ["#F6F121", "#1E56A6", "#e6eaee"], "short_name" :  "BCB","id" : 2, "name":"BC Belluno","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 2, 
						 "lost":0, "icon" : bcbelluno_icon, "goal_difference":0, "price":0},
	{"colors" : ["#ED1C24", "#231F20", "#e6eaee"], "short_name" :  "BBS","id" : 3, "name":"Badboys Steinhaus","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 2, 
						 "lost":0, "icon" : badboys_icon, "goal_difference":0, "price":20000},
	 {"colors" : ["#F6DB34", "#000000", "#e6eaee"], "short_name" :  "PBW","id" : 4, "name":"Blackwolves","position": 2, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" :4, "power" : 3, 
						 "lost":0, "icon" : blackwolves_icon, "goal_difference": 0, "price":20000},
	{"colors" : ["#3BAA34", "#442F1D", "#e6eaee"], "short_name" :  "AGB","id" : 20, "name":"Agordino Bears","position": 12, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" :4, "power" : 5, 
						 "lost":0, "icon" : agordino_bears_icon, "goal_difference": 0, "price":30000},
	{"colors" : ["#000000", "#F6DB34", "#e6eaee"], "short_name" :  "P89","id" : 7, "name":"Pochi 89","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 4, 
						 "lost":0, "icon" : pochi_icon, "goal_difference":0, "price":30000},
	{"colors" : ["#FF1416", "#FFB02F", "#e6eaee"], "short_name" :  "RDS","id" : 9, "name":"Red Devils","position": 8, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 2, 
						 "lost":0, "icon" : stilfes_icon, "goal_difference":0, "price":30000},
	 {"colors" : ["#6D1517", "#DCA409", "#e6eaee"], "short_name" :  "BCG","id" : 5, "name":"ASV Groeden","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 4, 
						 "lost":0, "icon" : groeden_icon, "goal_difference":0, "price":40000},
	 {"colors" : ["#FFFFFF", "#EA2129", "#e6eaee"], "short_name" :  "NKT","id" : 6, "name":"Neumarkt","position": 5, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 7, 
						 "lost":0, "icon" : neumarkt_icon, "goal_difference":0, "price":40000},
	 {"colors" : ["#E02333", "#FBFAFE", "#e6eaee"], "short_name" :  "VKS","id" : 10, "name":"Vikings","position": 9, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 6, 
						 "lost":0, "icon" : vikings_icon, "goal_difference":0 , "price": 50000},
	{"colors" : ["#9BC1F1", "#FCFCFC", "#e6eaee"], "short_name" :  "SRK","id" : 8, "name":"Sharks","position": 7, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 9, 
						 "lost":0, "icon" : sharks_icon, "goal_difference":0, "price":100000},
	{"colors" : ["#1E6F39", "#B7B7B7", "#e6eaee"], "short_name" :  "DOW","id" : 19, "name":"Dolomiti Warriors","position": 11, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 9, "power" : 10, 
						 "lost":0, "icon" : dolomiti_warriors_icon, "goal_difference":0, "price":100000}
	]


func _load_maritime_teams():
	var tatamagouche_icon = load("res://assets/teams/maritime-teams/tatamagouche_broomball.png")
	var brooklyn_knights_icon = load("res://assets/teams/maritime-teams/brooklyn_knights.png")
	var neguac_lumberjacks_icon = load("res://assets/teams/maritime-teams/neguac_lumberjacks.png")
	var avondale_lackbear_icon = load("res://assets/teams/maritime-teams/avondale_blackbear.png")
	var hants_bruins_icon = load("res://assets/teams/maritime-teams/hants_bruins.png")
	var nor_easters_icon = load("res://assets/teams/maritime-teams/nor_easters.png")
	var lobster_fishermen_icon = load("res://assets/teams/maritime-teams/maritime_lobster_fishermen.png")
	var most_wanted_icon = load("res://assets/teams/maritime-teams/most_wanted.png")
	
		
	
	maritime_teams = [ 
	 {"colors" : ["#D1052A", "#E6C18A", "#e6eaee"], "short_name" :  "TBC","id" : 11, "name":"Tatamagouche BC","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 6, 
						 "lost":0, "icon" : tatamagouche_icon, "goal_difference":0, "price":20000},
	 {"colors" : ["#024F2F", "#D7D6DB", "#e6eaee"], "short_name" :  "BKN","id" : 12, "name":"Brooklyn Knights","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 4, 
						 "lost":0, "icon" : brooklyn_knights_icon, "goal_difference":0, "price":20000},
	{"colors" : ["#E94243", "#96D8E8", "#e6eaee"], "short_name" :  "NLJ","id" : 13, "name":"Neguac Lumberjacks","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 7, 
						 "lost":0, "icon" : neguac_lumberjacks_icon, "goal_difference":0, "price":30000},
	 {"colors" : ["#707271", "#0C0C0C", "#e6eaee"], "short_name" :  "ABB","id" : 14, "name":"Avondale Blackbear","position": 2, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 6, 
						 "lost":0, "icon" : avondale_lackbear_icon, "goal_difference": 0, "price":40000},
	 {"colors" : ["#F3A250", "#3F2808", "#e6eaee"], "short_name" :  "HBB","id" : 15, "name":"Hants Bruins","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 7, 
						 "lost":0, "icon" : hants_bruins_icon, "goal_difference":0, "price":50000},
	 {"colors" : ["#EF0805", "#080564", "#e6eaee"], "short_name" :  "NRE","id" : 16, "name":"Nor Easters","position": 5, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" :9, "power" : 5, 
						 "lost":0, "icon" : nor_easters_icon, "goal_difference":0, "price":60000},
	  {"colors" : ["#FE0000", "#EEEEEE", "#e6eaee"], "short_name" :  "LFM","id" : 17, "name":"Lobster Fishermen","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 9, 
						 "lost":0, "icon" : lobster_fishermen_icon, "goal_difference":0, "price":80000},
	 {"colors" : ["#DA251C", "#BBBBBB", "#e6eaee"], "short_name" :  "MWB","id" : 18, "name":"Most Wanted","position": 7, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 9, "power" : 10, 
						 "lost":0, "icon" : most_wanted_icon, "goal_difference":0, "price":120000}
	]


func _load_north_american_teams():
	var boston_icon = load("res://assets/teams/north-american-league/boston.png")
	var wizards_icon = load("res://assets/teams/north-american-league/wizards.png")
	var capitol_icon = load("res://assets/teams/north-american-league/capitol.png")
	var charmcity_icon = load("res://assets/teams/north-american-league/charmcity.png")
	var juvenile_boys_quebec_icon = load("res://assets/teams/north-american-league/juvenile-boys-quebec.png")
	var juvenile_girls_quebec_icon = load("res://assets/teams/north-american-league/juvenile-girls-quebec.png")
	var senior_women_quebec_icon = load("res://assets/teams/north-american-league/senior-women-quebec.png")
	var roadrunners_icon = load("res://assets/teams/north-american-league/roadrunners.png")
	var cleveland_icon = load("res://assets/teams/north-american-league/cleveland.png")
	var regulators_icon = load("res://assets/teams/north-american-league/regulators.png")
	var broomshack_icon = load("res://assets/teams/north-american-league/broom-shack.png")
	var steels_icon = load("res://assets/teams/north-american-league/steeld.png")
	var minesota_icon = load("res://assets/teams/north-american-league/minesota.png")
	var kelly_lake_icon = load("res://assets/teams/north-american-league/kellylake.png")
	var ottawa_icon = load("res://assets/teams/north-american-league/ottawa.png")
	var top_shelf_icon = load("res://assets/teams/north-american-league/top-shelf.png")
	
	north_american_teams = [ 
	 {"colors" : ["#7C4B5B", "#D5B795", "#e6eaee"], "short_name" :  "SWQ","id" : 21, "name":"SR Women Quebec","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 3, 
						 "lost":0, "icon" : senior_women_quebec_icon, "goal_difference":0, "price":20000},
	{"colors" : ["#000000", "#FFFFFF", "#e6eaee"], "short_name" :  "REG","id" : 22, "name":"Regulators","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 3, "power" : 5, 
						 "lost":0, "icon" : regulators_icon, "goal_difference":0, "price":20000},
	 {"colors" : ["#232962", "#94C8D8", "#e6eaee"], "short_name" :  "RUN","id" : 23, "name":"Road Runners","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 3, "power" : 6, 
						 "lost":0, "icon" : roadrunners_icon, "goal_difference":0, "price":30000},
	{"colors" : ["#D5B795", "#7C4B5B", "#e6eaee"], "short_name" :  "JGQ","id" : 24, "name":"Juvenile Girls Quebec","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 5, 
						 "lost":0, "icon" : juvenile_girls_quebec_icon, "goal_difference":0, "price":30000},
	 {"colors" : ["#0F4C8B", "#61A8DC", "#e6eaee"], "short_name" :  "CHC","id" : 25, "name":"Charm City","position": 2, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 7, 
						 "lost":0, "icon" : charmcity_icon, "goal_difference": 0, "price":40000},
	 {"colors" : ["#D5D5D5", "#131313", "#e6eaee"], "short_name" :  "CPT","id" : 26, "name":"Capitol","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 5, 
						 "lost":0, "icon" : capitol_icon, "goal_difference":0, "price":50000},
	{"colors" : ["#6281B6", "#000000", "#e6eaee"], "short_name" :  "KEL","id" : 88, "name":"Kelly Lake","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 6, 
						 "lost":0, "icon" : kelly_lake_icon, "goal_difference":0, "price":50000},
	{"colors" : ["#000300", "#DEA549", "#e6eaee"], "short_name" :  "STE","id" : 43, "name":"Steels","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 8, 
						 "lost":0, "icon" : steels_icon, "goal_difference":0, "price":60000},
	 {"colors" : ["#002E62", "#FED430", "#e6eaee"], "short_name" :  "BST","id" : 27, "name":"Boston Broomball","position": 5, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" :8, "power" : 7, 
						 "lost":0, "icon" : boston_icon, "goal_difference":0, "price":70000},
	{"colors" : ["#FEFEFE", "#040404", "#e6eaee"], "short_name" :  "CLV","id" : 28, "name":"Cleveland Broomball","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 10, 
						 "lost":0, "icon" : cleveland_icon, "goal_difference":0, "price":80000},
	{"colors" : ["#FF6633", "#000000", "#e6eaee"], "short_name" :  "BSH","id" : 44, "name":"Broom Shack","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 6, 
						 "lost":0, "icon" : broomshack_icon, "goal_difference":0, "price":90000},
	{"colors" : ["#841D2E", "#F8FAFA", "#e6eaee"], "short_name" :  "JBQ","id" : 29, "name":"Juvenile Boys Quebec","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 9, 
						 "lost":0, "icon" : juvenile_boys_quebec_icon, "goal_difference":0, "price":90000},
	{"colors" : ["#F07A2E", "#495458", "#e6eaee"], "short_name" :  "TOP","id" : 90, "name":"Top Shelf","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 6, 
						 "lost":0, "icon" : top_shelf_icon, "goal_difference":0, "price":100000},
	 {"colors" : ["#EE1D23", "#F48222", "#e6eaee"], "short_name" :  "WIZ","id" : 30, "name":"Wizards","position": 7, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 9, "power" : 9, 
						 "lost":0, "icon" : wizards_icon, "goal_difference":0, "price":120000},
	{"colors" : ["#EC2427", "#FFFF33", "#e6eaee"], "short_name" :  "MIN","id" : 87, "name":"Minnesota Flames","position": 7, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 10, 
						 "lost":0, "icon" : minesota_icon, "goal_difference":0, "price":150000},
	{"colors" : ["#FFFFFF", "#A70101", "#e6eaee"], "short_name" :  "OTW","id" : 89, "name":"Ottawa Nationals","position": 7, "points": 0 ,
					 "goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 10, 
					 "lost":0, "icon" : ottawa_icon, "goal_difference":0, "price":150000}
	]

func _load_swiss_league():
	var maple_leafs_icon = load("res://assets/teams/swiss-teams/lusanne.png")
	var black_hawks_icon = load("res://assets/teams/swiss-teams/blackhawks.png")
	var bcv_icon = load("res://assets/teams/swiss-teams/bcv.png")
	var bills_icon = load("res://assets/teams/swiss-teams/bills.png")
	var green_foxes_icon = load("res://assets/teams/swiss-teams/greenfoxes.png")
	var stags_icon = load("res://assets/teams/swiss-teams/stags.png")
	var rangers_icon = load("res://assets/teams/swiss-teams/rangers.png")
	var juen_icon = load("res://assets/teams/swiss-teams/jeunsteam.png")
	var spartak_icon = load("res://assets/teams/swiss-teams/spartak.png")
	var savigny_icon = load("res://assets/teams/swiss-teams/savigny.png")
	var union_icon = load("res://assets/teams/swiss-teams/union.png")
	
	swiss_teams = [ 
		 {"colors" : ["#55FA05", "#000000", "#e6eaee"], "short_name" :  "GF2","id" : 37, "name":"Green Foxes 2","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 3, "power" : 4, 
						 "lost":0, "icon" : green_foxes_icon, "goal_difference":0, "price":20000},
		{"colors" : ["#000000", "#FFFFFF", "#e6eaee"], "short_name" :  "RNG","id" : 38, "name":"Ranger's","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 2, 
						 "lost":0, "icon" : rangers_icon, "goal_difference":0, "price":20000},
		{"colors" : ["#692B95", "#BAB6B7", "#e6eaee"], "short_name" :  "JEU","id" : 39, "name":"Jeun's Team","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 5, 
						 "lost":0, "icon" : juen_icon, "goal_difference":0, "price":30000},
		{"colors" : ["#EDFCFE", "#453FC4", "#e6eaee"], "short_name" :  "SPK","id" : 40, "name":"Spartak","position": 2, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 3, "power" : 8, 
						 "lost":0, "icon" : spartak_icon, "goal_difference": 0, "price":40000},
		{"colors" : ["#E7EBF7", "#D60707", "#e6eaee"], "short_name" :  "SAV","id" : 41, "name":"Savigny","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 3, 
						 "lost":0, "icon" : savigny_icon, "goal_difference":0, "price":50000},
		{"colors" : ["#2873AC", "#E9822E", "#e6eaee"], "short_name" :  "UNI","id" : 42, "name":"Union","position": 5, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" :6, "power" : 5, 
						 "lost":0, "icon" : union_icon, "goal_difference":0, "price":50000},
		{"colors" : ["#FDFCFC", "#003876", "#e6eaee"], "short_name" :  "LML","id" : 31, "name":"Maple Leafs","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 8, 
						 "lost":0, "icon" : maple_leafs_icon, "goal_difference":0, "price":60000},
		{"colors" : ["#000201", "#912438", "#e6eaee"], "short_name" :  "BLH","id" : 32, "name":"Black Hawks","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 6, 
						 "lost":0, "icon" : black_hawks_icon, "goal_difference":0, "price":60000},
		{"colors" : ["#00AC5B", "#FFFFFF", "#e6eaee"], "short_name" :  "BCV","id" : 33, "name":"Team BCV","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 2, 
						 "lost":0, "icon" : bcv_icon, "goal_difference":0, "price":70000},
		{"colors" : ["#FDD302", "#FDD302", "#e6eaee"], "short_name" :  "BIL","id" : 34, "name":"Bills","position": 2, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 8, 
						 "lost":0, "icon" : bills_icon, "goal_difference": 0, "price":8000},
		{"colors" : ["#57F706", "#000006", "#e6eaee"], "short_name" :  "GF1","id" : 35, "name":"Green Foxes 1","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 9, 
						 "lost":0, "icon" : green_foxes_icon, "goal_difference":0, "price":90000},
		{"colors" : ["#ECDFD3", "#784334", "#e6eaee"], "short_name" :  "STG","id" : 36, "name":"Stags","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" :9, "power" : 10, 
						 "lost":0, "icon" : stags_icon, "goal_difference":0, "price":100000}
	]

func _load_international_teams():
	var iceducks_icon = load("res://assets/teams/international-league/iceducks.png")
	var angers_icon = load("res://assets/teams/international-league/angers.png")
	var cyclones_icon = load("res://assets/teams/international-league/cyclones.png")
	var deben_icon = load("res://assets/teams/international-league/deben-roadrunnners.png")
	var flyingbrooms_icon = load("res://assets/teams/international-league/flying-brooms.png")
	var france_icon = load("res://assets/teams/international-league/france.png")
	var indianainvaders_icon = load("res://assets/teams/international-league/indiana-invaders.png")
	var legion_icon = load("res://assets/teams/international-league/legion.png")
	var renegades_icon = load("res://assets/teams/international-league/renegades.png")
	var thunderbrooms_icon = load("res://assets/teams/international-league/thunder-brooms.png")
	var thunderbirds_icon = load("res://assets/teams/international-league/thunderbirds.png")
	var carolina_icon = load("res://assets/teams/international-league/carolina.png")
	
	international_teams = [ 
	 {"colors" : ["#DC2601", "#FCFE0A", "#e6eaee"], "short_name" :  "THB","id" : 45, "name":"Thunder Brooms","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 6, 
						 "lost":0, "icon" : thunderbrooms_icon, "goal_difference":0, "price":20000},
	 {"colors" : ["#E7644B", "#FAFDB0", "#e6eaee"], "short_name" :  "FLB","id" : 46, "name":"Flying Brooms","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 4, 
						 "lost":0, "icon" : flyingbrooms_icon, "goal_difference":0, "price":20000},
	{"colors" : ["#E06722", "#2F2F2F", "#e6eaee"], "short_name" :  "ANG","id" : 47, "name":"Angers","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 7, 
						 "lost":0, "icon" : angers_icon, "goal_difference":0, "price":30000},
	{"colors" : ["#DBCBAA", "#286493", "#e6eaee"], "short_name" :  "THB","id" : 66, "name":"Thunderbirds","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 4, 
						 "lost":0, "icon" : thunderbirds_icon, "goal_difference":0, "price":30000},
	 {"colors" : ["#E96322", "#000400", "#e6eaee"], "short_name" :  "RNG","id" : 48, "name":"Renegades","position": 2, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 6, 
						 "lost":0, "icon" : renegades_icon, "goal_difference": 0, "price":40000},
	 {"colors" : ["#0555B9", "#BD1B23", "#e6eaee"], "short_name" :  "FRA","id" : 49, "name":"France Broomball","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 7, 
						 "lost":0, "icon" : france_icon, "goal_difference":0, "price":50000},
	 {"colors" : ["#4F6E91", "#EA7C32", "#e6eaee"], "short_name" :  "IND","id" : 50, "name":"Indiana Invaders","position": 5, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" :9, "power" : 5, 
						 "lost":0, "icon" : indianainvaders_icon, "goal_difference":0, "price":60000},
	  {"colors" : ["#88C3EC", "#2057AF", "#e6eaee"], "short_name" :  "DEB","id" : 51, "name":"Debden Roadrunners","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 9, 
						 "lost":0, "icon" : deben_icon, "goal_difference":0, "price":70000},
	{"colors" : ["#06E100", "#C8D6D2", "#e6eaee"], "short_name" :  "LEG","id" : 52, "name":"Legion","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 9, 
						 "lost":0, "icon" : legion_icon, "goal_difference":0, "price":80000},
	{"colors" : ["#023490", "#A0A0A0", "#e6eaee"], "short_name" :  "CAR","id" : 65, "name":"Carolina","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 10, 
						 "lost":0, "icon" : carolina_icon, "goal_difference":0, "price":80000},
	{"colors" : ["#EE2000", "#FEFEFE", "#e6eaee"], "short_name" :  "CYC","id" : 53, "name":"Cyclones","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 9, 
						 "lost":0, "icon" : cyclones_icon, "goal_difference":0, "price":90000},
	 {"colors" : ["#00B5EF", "#F8F400", "#e6eaee"], "short_name" :  "JID","id" : 54, "name":"Japan Ice Ducks","position": 7, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 10, 
						 "lost":0, "icon" : iceducks_icon, "goal_difference":0, "price":150000}
	]

func _load_internationa_women_teams():
	var bcrotalnord_icon = load("res://assets/teams/women-league/bc-rotalnord.png")
	var equipe_icon = load("res://assets/teams/women-league/equipe.png")
	var fahrenheit_icon = load("res://assets/teams/women-league/fahrenheit.png")
	var jacks_icon = load("res://assets/teams/women-league/jacks.png")
	var merano_icon = load("res://assets/teams/women-league/merano.png")
	var pergine_icon = load("res://assets/teams/women-league/pergine.png")
	var pittsburgh_women_icon = load("res://assets/teams/women-league/pittsburgh.png")
	var tracys_icon = load("res://assets/teams/women-league/tracys.png")
	var white_owl_icon = load("res://assets/teams/women-league/white-owl.png")
	var white_wolves_icon = load("res://assets/teams/women-league/white-wolves.png")
	
	
	international_women_teams = [ 
	 {"colors" : ["#EF1B22", "#DCA62C", "#e6eaee"], "short_name" :  "PER","id" : 55, "name":"Pergine Broomball","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 3, "power" : 4, 
						 "lost":0, "icon" : pergine_icon, "goal_difference":0, "price":20000},
	 {"colors" : ["#4A4B4F", "#0E235B", "#e6eaee"], "short_name" :  "MER","id" : 56, "name":"Merano","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 3, 
						 "lost":0, "icon" : merano_icon, "goal_difference":0, "price":20000},
	{"colors" : ["#B1292B", "#1A1A1D", "#e6eaee"], "short_name" :  "LUM","id" : 57, "name":"Lumberjacks","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 2, 
						 "lost":0, "icon" : jacks_icon, "goal_difference":0, "price":30000},
	 {"colors" : ["#105899", "#E7BB6A", "#e6eaee"], "short_name" :  "ROT","id" : 58, "name":"BC Rotalnord","position": 2, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 7, 
						 "lost":0, "icon" : bcrotalnord_icon, "goal_difference": 0, "price":40000},
	 {"colors" : ["#EEEEEE", "#D2D2D2", "#e6eaee"], "short_name" :  "412","id" : 59, "name":"Fahrenheit 412","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 7, 
						 "lost":0, "icon" : fahrenheit_icon, "goal_difference":0, "price":50000},
	 {"colors" : ["#2B4786", "#6BAFCA", "#e6eaee"], "short_name" :  "WHO","id" : 60, "name":"White Owl","position": 5, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" :5, "power" : 10, 
						 "lost":0, "icon" : white_owl_icon, "goal_difference":0, "price":60000},
	  {"colors" : ["#EEEEEE", "#016600", "#e6eaee"], "short_name" : "EQU","id" : 61, "name":"l'Equipe","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 6, 
						 "lost":0, "icon" : equipe_icon, "goal_difference":0, "price":70000},
	{"colors" : ["#ADAEA8", "#FDFDFB", "#e6eaee"], "short_name" :  "WHW","id" : 62, "name":"White Wolves","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 8, 
						 "lost":0, "icon" : white_wolves_icon, "goal_difference":0, "price":80000},
	{"colors" : ["#FAC008", "#010101", "#e6eaee"], "short_name" :  "PIT","id" : 63, "name":"Pittsburgh","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 9, 
						 "lost":0, "icon" : pittsburgh_women_icon, "goal_difference":0, "price":90000},
	 {"colors" : ["#EEEEEE", "#71357F", "#e6eaee"], "short_name" :  "TRA","id" : 64, "name":"Tracy's Saloon","position": 7, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 8, 
						 "lost":0, "icon" : tracys_icon, "goal_difference":0, "price":100000}
	]

func _load_australian_teams():
	var dirt_icon = load("res://assets/teams/australian-teams/DoonsideDirtSquirrels.png")
	var rhinos_icon = load("res://assets/teams/australian-teams/RichmondRhinos.png")
	var glenmore_icon = load("res://assets/teams/australian-teams/GlenmoreParkDruids.png")
	var werrington_icon = load("res://assets/teams/australian-teams/WerringtonCountySonics.png")
	var penrith_icon = load("res://assets/teams/australian-teams/PenrithCityRangers.png")
	var victorious_icon = load("res://assets/teams/australian-teams/VictoriousSecret.png")
	var knights_icon = load("res://assets/teams/australian-teams/KnightsWhoSayBroomball.png")
	var dugongs_icon = load("res://assets/teams/australian-teams/Dugongs.png")
	var howling_icon = load("res://assets/teams/australian-teams/HowlingCommandos.png")
	var sma_icon = load("res://assets/teams/australian-teams/SMASolarPower.png")
	var head_icon = load("res://assets/teams/australian-teams/HeadBangingBillyGoats.png")
	var blacktown_icon = load("res://assets/teams/australian-teams/BlacktownPirates.png")
	var mutley_icon = load("res://assets/teams/australian-teams/MutleyCrew.png")
	var hippos_icon = load("res://assets/teams/australian-teams/Hippos.png")
	var ninja_icon = load("res://assets/teams/australian-teams/IceNinjas.png")
	
	australian_teams = [
	break_team,
	 {"colors" : ["#60C9DC", "#FBF6E5", "#e6eaee"], "short_name" :  "DDS","id" : 67, "name":"Ice Ninjas","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 3, "power" : 4, 
						 "lost":0, "icon" : ninja_icon, "goal_difference":0, "price":20000},
	{"colors" : ["#4AC4C9", "#F3EC18", "#e6eaee"], "short_name" :  "RMR","id" : 68, "name":"Hippos","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 3, 
						 "lost":0, "icon" : hippos_icon, "goal_difference":0, "price":20000},
	{"colors" : ["#47803C", "#FEEAC7", "#e6eaee"], "short_name" :  "MTL","id" : 69, "name":"MutleyCrew","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 5, 
						 "lost":0, "icon" : mutley_icon, "goal_difference":0, "price":30000},
	 {"colors" : ["#184C9F", "#000102", "#e6eaee"], "short_name" :  "BLP","id" : 70, "name":"Blacktown Pirates","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 5, 
						 "lost":0, "icon" : blacktown_icon, "goal_difference":0, "price":30000},
	{"colors" : ["#576685", "#818382", "#e6eaee"], "short_name" :  "GOA","id" : 71, "name":"Head Banging Billy Goats","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 7, 
						 "lost":0, "icon" : head_icon, "goal_difference":0, "price":30000},
	 {"colors" : ["#ED1B24", "#2D3192", "#e6eaee"], "short_name" :  "SSP","id" : 72, "name":"SMA Solar Power","position": 2, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 5, 
						 "lost":0, "icon" : sma_icon, "goal_difference": 0, "price":40000},
	 {"colors" : ["#192B80", "#0A1237", "#e6eaee"], "short_name" :  "CPT","id" : 73, "name":"Howling Commandos","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 5, 
						 "lost":0, "icon" : howling_icon, "goal_difference":0, "price":50000},
	{"colors" : ["#5BCAF5", "#1958A5", "#e6eaee"], "short_name" :  "DUG","id" : 74, "name":"Dugongs","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 8, 
						 "lost":0, "icon" : dugongs_icon, "goal_difference":0, "price":60000},
	 {"colors" : ["#212E62", "#9D354F", "#e6eaee"], "short_name" :  "KNG","id" : 75, "name":"Knights Who Say Broomball","position": 5, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" :7, "power" : 7, 
						 "lost":0, "icon" : knights_icon, "goal_difference":0, "price":70000},
	{"colors" : ["#ED008C", "#F393BC", "#e6eaee"], "short_name" :  "VIC","id" : 76, "name":"Victorious Secret","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 9, 
						 "lost":0, "icon" : victorious_icon, "goal_difference":0, "price":80000},
	{"colors" : ["#000000", "#EC1C24", "#e6eaee"], "short_name" :  "PCR","id" : 77, "name":"Penrith City Rangers","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 6, 
						 "lost":0, "icon" : penrith_icon, "goal_difference":0, "price":90000},
	{"colors" : ["#273A96", "#F7DA2D", "#e6eaee"], "short_name" :  "WCS","id" : 77, "name":"Werrington County Sonics","position": 6, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 8, 
						 "lost":0, "icon" : werrington_icon, "goal_difference":0, "price":90000},
	 {"colors" : ["#129782", "#5D9240", "#e6eaee"], "short_name" :  "GPD","id" : 79, "name":"Glenmore Park Druids","position": 7, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 9, 
						 "lost":0, "icon" : glenmore_icon, "goal_difference":0, "price":100000},
	{"colors" : ["#A8A9AD", "#FFD504", "#e6eaee"], "short_name" :  "RMR","id" : 80, "name":"Richmond Rhinos","position": 7, "points": 0 ,
					 "goal_diference": 0 , "wins" : 0, "speed" : 9, "power" : 9, 
					 "lost":0, "icon" : rhinos_icon, "goal_difference":0, "price":100000},
	{"colors" : ["#FF8500", "#401701", "#e6eaee"], "short_name" :  "DDS","id" : 81, "name":"Doonside Dirt Squirrels","position": 7, "points": 0 ,
				 "goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 9, 
				 "lost":0, "icon" : dirt_icon, "goal_difference":0, "price":120000}
	]
	
func  _load_ontario_teams():
	var thunder_icon = load("res://assets/teams/ontario-league/thunder.png")
	var devils_icon = load("res://assets/teams/ontario-league/devils.png")
	var warriors_icon = load("res://assets/teams/ontario-league/warriors.png")
	var gamblers_icon = load("res://assets/teams/ontario-league/gamblers.png")
	var sting_icon = load("res://assets/teams/ontario-league/sting.png")
	var les_boys_icon = load("res://assets/teams/ontario-league/lesboys.png")
	var mildmay_moose_icon = load("res://assets/teams/ontario-league/mildmay-moose.png")
	
	
		
	ontario_teams = [
	 {"colors" : ["#E6D409", "#FEFEFE", "#e6eaee"], "short_name" :  "TND","id" : 82, "name":"Thunder","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 4, 
						 "lost":0, "icon" : thunder_icon, "goal_difference":0, "price":20000},
	 {"colors" : ["#D55D4F", "#A92D1F", "#e6eaee"], "short_name" :  "DEV","id" : 83, "name":"Devils","position": 1, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 5, 
						 "lost":0, "icon" : devils_icon, "goal_difference":0, "price":20000},
	{"colors" : ["#BDBDBD", "#707070", "#e6eaee"], "short_name" :  "WAR","id" : 84, "name":"Warriors","position": 0, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 7, 
						 "lost":0, "icon" : warriors_icon, "goal_difference":0, "price":40000},
	 {"colors" : ["#CFA91A", "#442319", "#e6eaee"], "short_name" :  "GMB","id" : 85, "name":"Gamblers","position": 2, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 6, 
						 "lost":0, "icon" : gamblers_icon, "goal_difference": 0, "price":60000},
	 {"colors" : ["#D71746", "#4B4355", "#e6eaee"], "short_name" :  "STG","id" : 86, "name":"Sting","position": 4, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 9, "power" : 10, 
						 "lost":0, "icon" : sting_icon, "goal_difference":0, "price":80000},
	{"colors" : ["#E1DBD1", "#55222B", "#e6eaee"], "short_name" :  "BOY","id" : 91, "name":"Boys","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 9,
						 "lost":0, "icon" : les_boys_icon, "goal_difference":0, "price":100000},
	{"colors" : ["#F6F6F6", "#fffff", "#060606"], "short_name" :  "MMO","id" : 92, "name":"Mildmay Moose","position": 3, "points": 0 ,
						 "goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 9,
						 "lost":0, "icon" : mildmay_moose_icon, "goal_difference":0, "price":100000},
	]
func _load_worldcup_teams():
	var italy_icon = load("res://assets/teams/national-teams/italy.png")
	var canada_icon = load("res://assets/teams/national-teams/canada.png")
	var usa_icon = load("res://assets/teams/national-teams/usa.png")
	var switzerland_icon = load("res://assets/teams/national-teams/switzerland.png")
	var france_icon = load("res://assets/teams/national-teams/france.png")
	var australia_icon = load("res://assets/teams/national-teams/australia.png")
	var japan_icon = load("res://assets/teams/national-teams/japan.png")
	var russia_icon = load("res://assets/teams/national-teams/russia.png")
	var austria_icon = load("res://assets/teams/national-teams/austria.png")
	var germany_icon = load("res://assets/teams/national-teams/germany.png")
	var slovenia_icon = load("res://assets/teams/national-teams/slovenia.png")
	var india_icon = load("res://assets/teams/national-teams/india.png")

	# USES NEGATIVE NUMBERS AS IDS
	# CANADA
	# USA
	# SWITZERLAND
	# ITALY
	# ASUTRALIA
	# JAPAN
	# RUSSIA
	# FRANCE
	# SLOVENIA
	# AUSTRIA
	# GERMANY
	# INDIA

	world_cup_teams = [
		{"colors" : ["#319727", "#FFB367", "#e6eaee"], "short_name" :  "IND","id" : -1, "name":"India","position": 3, "points": 0 ,
			"goal_diference": 0 , "wins" : 0, "speed" : 3, "power" : 2,
			"lost":0, "icon" : india_icon, "goal_difference":0, "price":0},
			
		{"colors" : ["#3E3E3E", "#FFD420", "#e6eaee"], "short_name" :  "GER","id" : -2, "name":"Germany","position": 1, "points": 0 ,
			"goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 2,
			"lost":0, "icon" : germany_icon, "goal_difference":0, "price":0},
			
	{"colors" : ["#F15B68", "#FFFFFF", "#e6eaee"], "short_name" :  "AUT","id" : -3, "name":"Austria","position": 0, "points": 0 ,
		"goal_diference": 0 , "wins" : 0, "speed" : 4, "power" : 3,
		"lost":0, "icon" : austria_icon, "goal_difference":0, "price":20000},
		
		{"colors" : ["#2D7AB5", "#EF4045", "#e6eaee"], "short_name" :  "SLV","id" : -4, "name":"Slovenia","position": 2, "points": 0 ,
			"goal_diference": 0 , "wins" : 0, "speed" :4, "power" : 4,
			"lost":0, "icon" : slovenia_icon, "goal_difference": 0, "price":20000},
			
	{"colors" : ["#1B3AA0", "#F15864", "#e6eaee"], "short_name" :  "FRA","id" : -5, "name":"France","position": 12, "points": 0 ,
		"goal_diference": 0 , "wins" : 0, "speed" :5, "power" : 5,
		"lost":0, "icon" : france_icon, "goal_difference": 0, "price":30000},
		
	{"colors" : ["#DA4438", "#2D5CB6", "#e6eaee"], "short_name" :  "RUS","id" : -6, "name":"Russia","position": 6, "points": 0 ,
		"goal_diference": 0 , "wins" : 0, "speed" : 5, "power" : 6,
		"lost":0, "icon" : russia_icon, "goal_difference":0, "price":30000},
		
	{"colors" : ["#FFFFFF", "#C42047", "#e6eaee"], "short_name" :  "JAP","id" : -7, "name":"Japan","position": 8, "points": 0 ,
		"goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 4,
		"lost":0, "icon" : japan_icon, "goal_difference":0, "price":30000},
		
		{"colors" : ["#29299E", "#FFFFFF", "#e6eaee"], "short_name" :  "AUS","id" : -8, "name":"Australia","position": 4, "points": 0 ,
			"goal_diference": 0 , "wins" : 0, "speed" : 7, "power" : 5,
			"lost":0, "icon" : australia_icon, "goal_difference":0, "price":40000},
			
		{"colors" : ["#4480E2", "#335A99", "#e6eaee"], "short_name" :  "ITA","id" : -9, "name":"Italy","position": 5, "points": 0 ,
			"goal_diference": 0 , "wins" : 0, "speed" : 6, "power" : 7,
			"lost":0, "icon" : italy_icon, "goal_difference":0, "price":40000},
			
		{"colors" : ["#FF3E3E", "#E90303", "#e6eaee"], "short_name" :  "SWI","id" : -10, "name":"Switzerland","position": 9, "points": 0 ,
			"goal_diference": 0 , "wins" : 0, "speed" : 8, "power" : 8,
			"lost":0, "icon" : switzerland_icon, "goal_difference":0 , "price": 50000},
			
	# Use USAT for name to differ with shortname to prevent automated transalation
	{"colors" : ["#BF4756", "#52517E", "#e6eaee"], "short_name" :  "USA","id" : -11, "name":"USAT","position": 7, "points": 0 ,
		"goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 9,
		"lost":0, "icon" : usa_icon, "goal_difference":0, "price":100000},
		
	{"colors" : ["#FF2828", "#FFFFFF", "#e6eaee"], "short_name" :  "CAN","id" : -12, "name":"Canada","position": 11, "points": 0 ,
		"goal_diference": 0 , "wins" : 0, "speed" : 10, "power" : 10,
		"lost":0, "icon" : canada_icon, "goal_difference":0, "price":100000}
	]


# 92 TEAMS next ID 93!!!! national teams are negative for now
