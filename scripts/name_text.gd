extends Node2D

func _ready():
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)
	$Label.visible = false 

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var name_text = self.name.split("_")[0]
		print(self.name)
		$Label.text = name_text
		$Label.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		$Label.visible = false
