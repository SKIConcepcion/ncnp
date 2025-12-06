extends Node2D

var triggered_convo = false

func _ready():
	if Global.removed_text_nodes.has(self.name) and Global.removed_text_nodes[self.name]:
		queue_free()
		return

	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)
	$Label.visible = false

func _on_body_entered(body: Node2D) -> void:
	if Global.removed_text_nodes.has(self.name) and Global.removed_text_nodes[self.name]:
		queue_free()
		return
	
	if body.name == "Player":
		var dialogue = ""

		match self.name:
			### MAIN 01
			"cm_text_01":
				dialogue = "Looks like this is our stop. \nThe locals said the town now lies just beyond the forest"
			"cm_text_02":
				dialogue = "Here’s the boat. The locals agreed to rent it to us for a small price"
			"vlg_text_01":
				dialogue = "There’s a boathouse at the far end of the forest... take it to sail to the other town"
			"vlg_text_02":
				dialogue = "Hello! This bridge has seen better days, so be careful as you cross"
			"vlg_text_03":
				dialogue = "Good thing the sea is calm today"
			"self_text_01":
				dialogue = "I hope this bridge doesn't break now"


			### PASSAGE
			"cm_text_03":
				dialogue = "What happened here? Anyways, the other town is through the cave ahead"
			"self_text_02":
				dialogue = "This must be the cave that Elian was talking about"
			"self_text_10":
				dialogue = "It looks like someone \ncarved what appears \n to be a lighthouse into \n the tree... but why?"


			### MAIN 02
			"self_text_11":
				dialogue = "Perhaps some sort of altar or shrine... but for who?"
			"cm_text_04":
				dialogue = "The bridge is broken. Luckily, we can cut through the cave as an alternative"
			"self_text_03":
				dialogue = "..."
			"self_text_04":
				if Global.awaken == true:
					dialogue = "Something's not right..."
			"self_text_06":
				dialogue = "What is happening... \nwe have to get \nout of here"
				Global.trigger_awaken = true
				Global.objective = "return to the boat"
			"vlg_text_04":
				dialogue = "Welcome to our village, stranger"
				Global.objective = "find Mr. Guinto, the village official head"
			"cm_text_05":
				dialogue = "We finally made it, but the locals said that Mr. Guinto is at the lighthouse"
			"self_text_03":
				dialogue = "..."
			"self_text_08":
				dialogue = "Ha! this well reminds me of that Tiki Tiki Tembo story"


			### PASSAGE ALT
			"self_text_05":
				dialogue = "Something is wrong \n with this place"
			"cm_text_06":
				dialogue = "The path is gone… the people are gone... it’s just us and the silence, what do we do now?"
				Global.church_open = true
				Global.objective = "seek shelter at the church"


			### CHURCH
			"cm_text_07":
				dialogue = "Back then I heard the locals talking about a boat across the cemetery, maybe we can use it to escape..."
				Global.objective = "find the key to the cemetery"

			### CEMETERY 
			"self_text_07":
				dialogue = "Shit… perhaps our only hope is the old lighthouse… and pray something answers from the fog"

			"self_text_12":
				dialogue = "Maybe there is something I can use on that boat to get the key on the cave mentioned on the note"
				Global.objective = "search the crashed boat"

			"self_text_09":
				dialogue = "The bridge is broken, maybe I can use a rope to rappel down and enter through the other entrance"

			
			
			### ENDGAME
			"cm_text_08":
				dialogue = "It seems that their so-called “election” is about to begin..."

			"cm_text_09":
				dialogue = "We have no choice...\n“god” has its eye on us"

			_:
				dialogue = ""

		$Label.text = "\""  + dialogue + "\""
		$Label.visible = true
		
		if !triggered_convo:
			$AnimationPlayer.play("show")
			triggered_convo = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		Global.removed_text_nodes[self.name] = true
		$Area2D.set_deferred("monitoring", false) 
		await get_tree().create_timer(3.0).timeout
		$AnimationPlayer.play("hide")
		await $AnimationPlayer.animation_finished
		queue_free()
