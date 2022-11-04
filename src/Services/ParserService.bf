namespace lyb_gon;

using System;
using System.Collections;

extension Gon
{
	private void _Parse(StringView pGonString)
	{
		var lines = new List<StringView>();
		defer delete lines;

		{ let split = pGonString.Split('\n');
			for(let i in split)
				lines.Add(i); }

		for(int i = 0; i < lines.Count; i++)
		{
			var line = new WhitespaceRemovalService(lines[i]);

			if(!line.Succeeded)
				continue; //Just contine, an empty line is no need for an error

			if(line.StrippedString.StartsWith("/")) continue; //Comments have no need to be parsed
			//else if(line.StrippedString.StartsWith(""));
			delete line;
		}

		

	}
}

/*
	Custom
	Number
	String
	Bool
	Text
	Data
	Meta
	Array
	Object
	Int
	BigNumber
*/