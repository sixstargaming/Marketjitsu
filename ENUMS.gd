extends Object

class_name ENUMS

# Global enumerations container

# Used as metadata regarding options
enum OPTION_TYPE {
	NEUTRAL,
	POSITIVE,
	NEGATIVE,
	AGGRESSIVE,
	PASSIVE,
	PLEADING,
	SEXUAL,
	HUMOR,
	CREEPY,
	WTF
	}

# Used to transfer information about the result of a sales attempt between classes
enum SALE_RESULT {
	NONE,
	GAIN,
	LOSS,
	FAIL,
	SUCCESS
	}