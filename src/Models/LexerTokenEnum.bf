namespace lyb_gon.Models;

//The enum which contains all different types of tokens the parser may generate
enum LexerTokenEnum
{
	ValueToken, //Any type of string, both single and multiline strings go here
	MetaToken,//Metadata objects
	ObjectToken //Actual objects
}