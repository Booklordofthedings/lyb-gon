namespace lyb_gon;
using System;
using System.Collections;

class Gon
{
#region Info
	/*
		Used to indicate information to the programmer who uses gon
		These can be checked for in order to throw errors incase a breaking update happens
		The correct implementation would be to check for these and to throw
		an error that points directly to gon incase they dont match up
	*/
	public readonly uint8 PARSER_NUMBER_SIZE = 4; //Used to determine the max size of the gon number object In this case its a float
	//Used to indicate what version of the gon standart this parser parses
	public readonly uint16 PARSER_VERSION_MAJOR = 1;
	public readonly uint16 PARSER_VERSION_MINOR = 0;
	//Yes these values are u16 instead of u8 in order to future proof the standart
	public readonly uint8 PARSER_FORCE_LEADING_C = 0; //This parser does not enforce a leading c infront of a custom type
	public readonly uint8 PARSER_STRICT_STANDART = 0; //This parser does not parse strict as a default
#endregion

	public bool hasErrored {
		public get;
		private set;
	}

	private List<GonEntry> entries;

	public this(String data, bool useStrict)
	{
		List<String> lines = new List<String>();

		//Enumerate through all lines and add them to the lines array
		let e = data.Split('\n');
		for(let entry in e)
			lines.Add(new String(entry));

		l: for(int i = 0; i < lines.Count; i++)
		{
			Result<void> r = ParseLine(lines,ref i);
			if(r == .Err && useStrict) //Fatal errors if use strict has been set
			{
				hasErrored = true;
				break l; //God, these are so fucking sex
			}
		}
		DeleteContainerAndItems!(lines); //Cleanups
	}

	private Result<void> ParseLine(List<String> entries, ref int index)
	{
		StringView token = "";
		let s = entries[index].Split(':');
		if(s.Current == "")
		{
			return .Err; //TODO: Error handling for
		}
		
		return .Err;
	}
} 