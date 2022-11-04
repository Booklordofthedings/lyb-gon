namespace lyb_gon;

enum GonParserError
{
	NullBodyError, //The body string was null
	EmptyBodyError, //The body string was an empty string
	LineParsingError, //The line cannot be parsed in the way its supposed to
	DublicateKeyError, //The key (name) already exists in this object
}