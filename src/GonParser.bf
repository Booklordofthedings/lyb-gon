namespace lyb_gon;
using System;

extension Gon
{
	private enum ParserState
	{
		//Used in the parser 
		Stray,
		Comment
	}

	//Start parsing gon objects
	private void Parse(String pGonString, mut int pIndex)
	{
		ParserState parserState = .Stray;
		while(pIndex < pGonString.Length)
		{
			if(parserState == .Comment)
			{	//While in a comment we will skip over everything that isnt a newline
				//Using ParserState for this allows us to skip a bounds check
				if(pGonString[pIndex] == '\n' || pGonString[pIndex] == '\r')
					parserState = .Stray;
				continue;
			}
			else if(parserState == .Stray)
			{
				if(pGonString[pIndex].IsWhiteSpace)
				{
					continue; //Skip all nothing
				}

				if(pGonString[pIndex] == '/') { //Move to the end of the line
					parserState = .Comment;
					continue;
				}
			}


			

			pIndex++;
		}
	}
}