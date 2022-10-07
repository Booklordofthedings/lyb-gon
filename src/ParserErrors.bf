namespace lyb_gon;

//All of the possible errors the gon parser may throw during parsing
enum ParserError
{
	UnknownError, //No other error for this situation exist. This error should theoretically not be triggered

	EmptyBodyError,
	InvalidSyntaxError,
	DifferentArrayContentError,
	InvalidMetaError,
}