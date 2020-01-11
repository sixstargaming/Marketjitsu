extends Object

class_name SalesMark

# This is the "customer" or whatever we call them, all code related to AI and
# responses, used by the main file

var name = "Mark Sucker"
var progress : int # scale 0-100, 0 = no buy, 100 = buy

# Characteristic variables
var age : int
enum {MALE, FEMALE, OTHER}
var gender : int # emum of above
var money : int # Max money they have on them

# Personality variables (scale 0-100) : I got these from Google but we can do anything we want here to affect how a sale goes down
var openness : int
var conscientiousness : int
var extraversion : int
var agreeableness : int
var neuroticism : int

# fSeed used to add a multiplier to initial progress.  Later this can be an array of floats to increase the likelyhood to generate a random person with certain traits. i.e. selling in a neighborhood of old people.
func _init(fSeed : float):
	progress = 50 * fSeed
	progress = int(progress)
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	# Generate characteristics
	age = rng.randi_range(10, 100)
	gender = rng.randi_range(0, 2)
	money = rng.randi_range(0, 10000)
	
	# Generate personality
	openness = rng.randi_range(0, 100)
	conscientiousness = rng.randi_range(0, 100)
	extraversion = rng.randi_range(0, 100)
	agreeableness = rng.randi_range(0, 100)
	neuroticism = rng.randi_range(0, 100)

# Process an Option
func ProcessOption(selectedOption : Option):
	var res : int
	if selectedOption.type == 0:
		res = ENUMS.SALE_RESULT.NONE
	elif selectedOption.type == 1:
		progress += 10
		res = ENUMS.SALE_RESULT.GAIN
	elif selectedOption.type == 2:
		progress -= 10
		res = ENUMS.SALE_RESULT.LOSS
		
	if progress < 1:
		res = ENUMS.SALE_RESULT.FAIL
	elif progress > 99:
		res = ENUMS.SALE_RESULT.SUCCESS
		
	return res

# Getters
func GetProgress():
	return progress

func GetName():
	return name