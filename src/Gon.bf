namespace lyb_gon;
using System;
using System.Collections;

class Gon
{

	private List<GonEntry> _entries; //The gon data
	private Dictionary<String, GonEntry> _meta; //Metadate from the gon file
	private List<ParserError> _errors; //Errors that occured during parsing

	public this(String pGonString, bool pStrict)
	{

	}
}