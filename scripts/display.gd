extends CanvasLayer

@export var dialogue_label: DialogueLabel
var resource = load("res://dialogue/robot/TestDialogue.dialogue")
var resource2 = load("res://dialogue/human/TestDialogue.dialogue")

func _ready() -> void:
	var dialogue_node = DialogueManager.show_dialogue_balloon(resource2, "start")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
