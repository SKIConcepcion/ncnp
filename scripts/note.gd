extends Node2D

@onready var bib_sprite: Sprite2D = $BibSprite
@onready var note_sprite: Sprite2D = $NoteSprite
@onready var map_sprite: Sprite2D = $MapSprite
@onready var riddle_sprite: Sprite2D = $RiddleSprite

@onready var color_rect: ColorRect = $ColorRect
@onready var read_note: Node2D = $read_note
@onready var view_map: Node2D = $view_map
@onready var view_riddle: Node2D = $view_riddle

var player_in_area := false
var opened := false

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)
	bib_sprite.visible = false 
	note_sprite.visible = false 
	map_sprite.visible = false 
	riddle_sprite.visible = false 
	color_rect.visible = false
	
	if self.name.begins_with("map"):
		read_note.visible = false
		view_map.visible = true
		view_riddle.visible = false
	
	if self.name.begins_with("riddle"):
		read_note.visible = false
		view_map.visible = false
		view_riddle.visible = true

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		$Label.visible = false
		bib_sprite.visible = false 
		note_sprite.visible = false 
		map_sprite.visible = false 
		riddle_sprite.visible = false
		opened = false
		color_rect.visible = false

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("interact") and opened == false:
		GlobalSfx.play_paper_sfx()
		var text = ""
		match self.name:
			"map":
				text = ""
			"riddle":
				text = ""
			"note_01":
				text = "We do believe that there are major design flaws on these platforms, we couldn't even get up properly using these"
			"note_02":
				text = "I decided to leave this crumbling shack in pursuit of a better life in the town across the sea"
			"note_03":
				text = "At first, it felt wrong... but now, somehow, it feels right to offer it up… almost as if it’s what it wanted all along"
			"note_04":
				text = "I refused at first. \n\nBut by the next day, the whispers had already settled in my head... soft, insistent, and impossible to ignore"
			"note_05":
				text = "I believe the builder who was handling the lighthouse maintenance accidentally took the keys with him when he went to repair the church bell. Could anyone retrieve them later? Thanks"
			"note_06":
				text = "As part of our cleansing, we cast all the old church relics... even the keys, into the cave beneath the hanging bridge.\n\nFrom now on, we ascend with purity unbounded by the old church"
			"note_07":
				text = "That fool… I warned him not to drag the wagon over the bridge. Now the only way across is through those godforsaken maze-like caves below... if anyone plans to go down, REFER TO THE MAP!!"
				if Global.objective == "investigate the maze cave (under hanging bridge)":
					Global.objective = "find the trashed church bell trapdoor key"
			"note_08":
				text = "The whispers never cease... they slither through the walls, through our minds... except to end it all..."
			"note_09":
				text = "Something is wrong with them, they locked us in here while we're working here, saying that we cannot interfere with the election... we tried to ring the bell, but no one came... the voices are getting louder too..."
			"note_10":
				text = "It said it was fair… \nIt said it would unite us. \nBut I was never chosen. \nNot once. \nIt lied. \nA false god, cloaked in promises. \nIt never wanted unity—only control"
			"note_11":
				text = "We all wondered what waited above… Is the light the answer? Why him? Why not us? And now… I hear myself screaming from somewhere far away. But I'm still here. \nAren’t I?"
			"note_12":
				text = "I am never to question god, but why only let one person see the light? when all of us are living in the dark... "
			"note_13":
				text = "And here I shall finish my ascension"
			"note_14":
				text = "This can't be the end..."
			"note_15":
				text = "Whatever happens... \n\nNEVER TAKE YOUR EYES OFF IT \n\nlure it, run from it, \nbut never look away"
			"note_16":
				text = "I don’t want to follow, but I have no choice. The others who resisted... \n\nwhat became of them... \n\nit's unspeakable. I must follow… or share their fate"
			"note_17":
				text = "They call it a god, but it is not. It's not divine - it’s wrong. A thing our minds were never meant to see, so incomprehensible that they simply refer to it as something religious"
			"note_18":
				text = "It promised peace and unity, but those who refused were corrected... \ndeemed selfish, they were fused with versions of themselves from another world, bound as one, condemned to suffer for eternity"
			"note_19":
				text = "I don't understand... that “god” that they're referring isn't even a god, it's a cosmic being, an eldtritch horror..."
			"note_20":
				text = "Every three years, it chooses a vessel and offers us peace in return. But the people — they aren’t possessed or controlled... they chose to obey. Is it faith? Or fear? I can’t tell anymore..."
			"note_21": 
				text = "We had no choice... so we fled and hid in the mining cave, praying the this will be over one day."
			"note_22":
				text = "We pray this ends someday... But for now, I cling to the verse that kept me going. \n\nPlease protect us,\no' God. In Jesus' name,\nAmen."



			"bib_01":
				text = "Genesis 1:1\n\n“In the beginning, God created the heavens and the earth.”"
			"bib_02":
				text = "Ephesians 4:22-23\n\n“To put off your old self, which belongs to your former manner of life and is corrupt through deceitful desires, and to be renewed in the spirit of your minds,”"
			"bib_03":
				text = "1 Timothy 6:10\n\n“For the love of money is the root of all evil: which while some coveted after, they have erred from the faith, and pierced themselves through with many sorrows.”"
			"bib_04":
				text = "Matthew 7:23\n\n“And then I will declare to them, ‘I never knew you; depart from Me, you who practice lawlessness!”"
			"bib_05":
				text = "Hebrews 10:26\n\n“For if we sin wilfully after that we have received the knowledge of the truth, there remaineth no more sacrifice for sins,”"
			"bib_06":
				text = "Revelation 21:4\n\n“and he shall wipe away every tear from their eyes; \nand death shall be no more; \nneither shall there be mourning, \nnor crying, nor pain...”"
			"bib_07":
				text = "Matthew 6:34\n\n“Therefore do not worry about tomorrow, for tomorrow will worry about itself. Each day has enough trouble of its own.”"

		$Label.text = text
		$Label.visible = true
		color_rect.visible = true
		read_note.visible = false
		view_map.visible = false
		view_riddle.visible = false
		
		# Open sprite based on name prefix
		if self.name.begins_with("note"):
			note_sprite.visible = true
		elif self.name.begins_with("bib"):
			bib_sprite.visible = true
		elif self.name.begins_with("map"):
			map_sprite.visible = true
		elif self.name.begins_with("riddle"):
			Global.objective = "find the key for the well cabin"
			Global.riddle_trigger = true
			riddle_sprite.visible = true

		opened = true



	elif player_in_area and Input.is_action_just_pressed("interact") and opened == true:
		$Label.visible = false
		
		if self.name.begins_with("note"):
			note_sprite.visible = false
		elif self.name.begins_with("bib"):
			bib_sprite.visible = false
		elif self.name.begins_with("map"):
			map_sprite.visible = false
			view_map.visible = true
			read_note.visible = false
			view_riddle.visible = false
			opened = false
			color_rect.visible = false
			return
		elif self.name.begins_with("riddle"):
			riddle_sprite.visible = false
			view_riddle.visible = true
			read_note.visible = false
			view_map.visible = false
			opened = false
			color_rect.visible = false
			return

		opened = false
		color_rect.visible = false
		read_note.visible = true
