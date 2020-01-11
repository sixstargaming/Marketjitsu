extends Object

class_name Option

# Option is a template for new options in the sales tree and contains all
# variables related to the option

var text : String # The raw text displayed, describing the option
var type : int # The type of option, 0-x tbd, ex: Aggressive, Passive, Begging.  Probably should be an enum later
var types = [] # Array of type

func _init(input_text : String, input_type):
	text = input_text
	if typeof(input_type) == TYPE_ARRAY:
		type = input_type[0] # Default/Dominant type
		for arg in input_type:
			types.append(arg)
	else:
		type = input_type # Some type checking
		types.append(type) # For global support
		
# Getters
func GetText():
	return text

func GetTypes():
	return types

func GetDominantType():
	return type

func GetDefaultType(): # Same as dominant type
	return type