namespace lyb_gon;

using System;

extension Gon
{
	//Parses a 32bit float
	private void _SingleLineParseNumber(String pLine)
	{
		if(pLine.Count(':') < 2)
		{
			this._Errors.Add(.LineParsingError);
			return;
		}

		var parts = pLine.Split(':');

		var name = parts.GetNext();
		ErrorOrTrue!(name, GonParserError.LineParsingError);

		var value = parts.GetNext();
		ErrorOrTrue!(value, GonParserError.LineParsingError);

		if(_ContainsNameCheck(name.Value))
		{
			_Errors.Add(.DublicateKeyError);
			return;
		}

		var res = float.Parse(value);
		ErrorOrTrue!(res,GonParserError.LineParsingError);

		_Entries.Add(new GonEntry(name.Value,"Number",.Number,value,null,null));
	}
}