extends Object

class_name Options

# Obtions is an extentable container for multiple instances of Option
# for use in SalesDemoFile.gd as a map of selectable options

# TODO: Make this into a parser for XML/JSON and then store the options
# in an external XML/JSON file like an actual fucking developer so it's
# not hard coded into the compiled executable

var options = []

# Create Option(s) here
func _init():
	options.append(Option.new("Test Positive", ENUMS.OPTION_TYPE.POSITIVE))
	options.append(Option.new("Test Negative", ENUMS.OPTION_TYPE.NEGATIVE))
	options.append(Option.new("Test Neutral", ENUMS.OPTION_TYPE.NEUTRAL))
	options.append(Option.new("This thing sucks!", [ENUMS.OPTION_TYPE.NEGATIVE]))
	options.append(Option.new("Tell joke", [ENUMS.OPTION_TYPE.POSITIVE, ENUMS.OPTION_TYPE.HUMOR]))
	options.append(Option.new("Fuck you, buy my shit", [ENUMS.OPTION_TYPE.NEGATIVE, ENUMS.OPTION_TYPE.AGGRESSIVE]))
	options.append(Option.new("Pweety Pweese?", [ENUMS.OPTION_TYPE.POSITIVE, ENUMS.OPTION_TYPE.PLEADING]))
	options.append(Option.new("Stare", [ENUMS.OPTION_TYPE.NEUTRAL, ENUMS.OPTION_TYPE.PASSIVE, ENUMS.OPTION_TYPE.CREEPY]))
	options.append(Option.new("Me love you long time", [ENUMS.OPTION_TYPE.POSITIVE, ENUMS.OPTION_TYPE.SEXUAL]))
	options.append(Option.new("Grunt", [ENUMS.OPTION_TYPE.NEUTRAL, ENUMS.OPTION_TYPE.PASSIVE]))
	options.append(Option.new("Legalize Ranch!", [ENUMS.OPTION_TYPE.POSITIVE, ENUMS.OPTION_TYPE.WTF]))
	
# Query number of options
func GetTotalOptions():
	return options.size()

# Return Option by ID
func GetOptionByID(id : int):
	return options[id]
#	if options.size() <= id and id >= 0:
#		return options[id]
#	else:
#		return Option.new("Invalid Option", 0)