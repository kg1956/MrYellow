extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var config = {}
func _ready():
	# Called every time the node is added to the scene.
	# Initialization her
	
	var file = File.new()
	file.open("res://Docs/Questions.json", file.READ)
	var content = file.get_as_text()
	file.close()

	config.parse_json(content)
	
	for item in config:
		print(config[item])
		pass
	
	var mood = 50
	var node = get_node("ProgressBar")
	node.set_val(mood)
	
	var button_container = load("res://Scenes/ButtonContainer.tscn")
	#var example_button_1 = {
	#	"ResponseText" : "Option 1",
	#	"ResultText" : "You picked option 1",
	#	"ResultAudio" : "File 1"
	#}
	
	#var example_button_2 = {
	#	"ResponseText" : "Option 2",
	#	"ResultText" : "You picked option 2",
	#	"ResultAudio" : "File 2"
	#}
	
	#var example_config = {
	#	"button_1" : example_button_1,
	#	"button_2" : example_button_2
	#}
	
	var button_container_1 = button_container.instance()
	button_container_1.init(config["1"])
	add_child(button_container_1)
	
	set_fixed_process(true)
	pass


func _fixed_process(delta):
	
	var mood = get_node("MrYellow").get_mood()
	
	var node = get_node("ProgressBar")
	node.set_val(mood)
	
func ask_question():
	randomize()
	var new_id = randi()%11+1
	var button_container = load("res://Scenes/ButtonContainer.tscn")
	var bc_node = get_node("./ButtonContainer")
	bc_node.free()
	
	var button_container_1 = button_container.instance()
	button_container_1.init(config[str(new_id)])
	add_child(button_container_1)
	



func _on_TestButton_pressed():
	ask_question()
	pass # replace with function body
