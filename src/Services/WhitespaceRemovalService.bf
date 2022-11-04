namespace lyb_gon;

using System;

///Returns a string without the leading whitespaces and tabs
class WhitespaceRemovalService
{
	public StringView StrippedString;
	public bool Succeeded = true;

	public this(StringView pLine)
	{
		if(pLine == null ||  pLine == "")
		{
			Succeeded = false;
			return;
		}

		for(let i in pLine)
		{
			if(i.IsWhiteSpace)
				continue;

			StrippedString = StringView(pLine,@i.Index);
			return;
		}
		Succeeded = false;
	}
}