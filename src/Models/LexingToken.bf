namespace lyb_gon.Models;

using System;

class LexingToken
{
	private LexerTokenEnum _type;
	public LexerTokenEnum  Type
	{
		public get
		{
			return _type;
		}
		public set
		{
			_type = value;
		}
	}

	private StringView _value;
	public StringView Value
	{
		public get
		{
			return _value;
		}
		public set
		{
			_value = value;
		}
	}
}