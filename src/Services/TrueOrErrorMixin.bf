namespace lyb_gon;

using System;

extension Gon
{
	public mixin ErrorOrTrue<T>(Result<T> pResult , GonParserError pOnError)
	{
		if(pResult case .Err)
		{
			_Errors.Add(pOnError);
			return;
		}
	}
}