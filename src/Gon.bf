namespace lyb_gon;
using System;
using System.Collections;

class Gon
{
#region ParserValues
	//The version of the gon parser
	public readonly uint16 GON_MAJOR_VERSION = 1;
	public readonly uint16 GOn_MINOR_VERSION = 0;

	public readonly uint8 GON_NUMBER_SIZE = 4; //How many bytes a gon number has (4 = float, 8 = double)
	public readonly uint8 GON_FORCE_LEADING_C = 0; //Wether the parser forces gon custom objects to start with a c. Not sure if this is useful, but might be for custom parsers
	public readonly uint8 GON_STRICT_AS_DEFAULT = 0; //Wether the parser is
#endregion

	private List<GonEntry> _entries;
	private 

	public this(String pGonString, bool pStrict)
	{

	}
}