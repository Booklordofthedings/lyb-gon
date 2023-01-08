namespace lyb_gon.Parser;

using System;
using System.Collections;
using lyb_gon.Models;

//Turns strings into lists of tokens
class Lexer
{
	public Result<void> Lex(String pInput, List<LexerTokenEnum> pToAdd, List<ParserErrorEnum> pErrors = null)
	{
		if(pInput == null)
		{

			return .Err;
		}
	}
}