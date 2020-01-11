extends Node

# Declare member variables here.
var boolResetOptions = true
var boolPrintDebug = true
var boolGenerateMark = true
var optionArray = [null, null, null, null, null, null]

#var OptionsObject = load("res://Options.gd") # Is this needed?
var OptionMap = Options.new()

#var SalesMarkObject = load("res://Options.gd") # Is this needed?
var Mark : SalesMark

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if boolResetOptions:
		generateOptions()
	if boolGenerateMark:
		generateMark()
	
	# Debug UI
	if boolPrintDebug:
		updateDebugUI()
		
# Get inputs (for prototyping purposes using Q W E R T Y)
func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_Q && event.pressed == false:
			optionSelected(optionArray[0])
		if event.scancode == KEY_W && event.pressed == false:
			optionSelected(optionArray[1])
		if event.scancode == KEY_E && event.pressed == false:
			optionSelected(optionArray[2])
		if event.scancode == KEY_R && event.pressed == false:
			optionSelected(optionArray[3])
		if event.scancode == KEY_T && event.pressed == false:
			optionSelected(optionArray[4])
		if event.scancode == KEY_Y && event.pressed == false:
			optionSelected(optionArray[5])

# Generate and store options
func generateOptions():
	var rng = RandomNumberGenerator.new()
	for i in range(6):
		rng.randomize()
		optionArray[i] = OptionMap.GetOptionByID(rng.randi_range(0, OptionMap.GetTotalOptions() - 1))
	boolResetOptions = false
	

func generateMark():
	Mark = SalesMark.new(1)
	boolGenerateMark = false

# Debug UI (Prototyping)
func updateDebugUI():
	var btnOption : Button
	var albl = ["Q", "W", "E", "R", "T", "Y"]
	for i in range(6):
		btnOption = get_node("btn" + albl[i])
		btnOption.set_text(optionArray[i].text)
	var lblDebugHP = get_node("lblDebugHP")
	lblDebugHP.set_text("Progress: " + str(Mark.GetProgress()))
	var lblInformation = get_node("lblInformation")
	var sInfo : String
	var dbgMarkGender : String
	if Mark.gender == 0:
		dbgMarkGender = "Male"
	elif Mark.gender == 1:
		dbgMarkGender = "Female"
	else:
		dbgMarkGender = "Other"
	sInfo = "Selling " + "Object" + " to " + Mark.GetName() + "\nAge: " + str(Mark.age) + "\nGender: " + str(dbgMarkGender) + "\nMoney: $" + str(Mark.money) + "\n\nOpenness: " + str(Mark.openness) + "\nConscientiousness: " + str(Mark.conscientiousness) + "\nExtraversion: " + str(Mark.extraversion) + "\nAgreeableness: " + str(Mark.agreeableness) + "\nNeuroticism: " + str(Mark.neuroticism)
	lblInformation.set_text(sInfo)
	boolPrintDebug = false

# Option logic
func optionSelected(selectedOption : Option):
	
	var result = Mark.ProcessOption(selectedOption)
	if result == 3:
		print_debug("Mark did not buy")
		boolGenerateMark = true
	elif result == 4:
		print_debug("Mark bought")
		boolGenerateMark = true
	
	boolResetOptions = true # Get new options
	boolPrintDebug = true # Debug purposes

# Buttons Pressed
func _on_btnQ_pressed():
	optionSelected(optionArray[0])

func _on_btnW_pressed():
	optionSelected(optionArray[1])
	
func _on_btnE_pressed():
	optionSelected(optionArray[2])

func _on_btnR_pressed():
	optionSelected(optionArray[3])

func _on_btnT_pressed():
	optionSelected(optionArray[4])

func _on_btnY_pressed():
	optionSelected(optionArray[5])