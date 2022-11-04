namespace lyb_gon;

using System;

extension Gon
{
	public bool _ContainsNameCheck(StringView pName)
 	{
		 bool toRet = false;
		 for(let i in _Entries)
		 	if(i.Name == pName)
				 toRet = true;
		 return toRet;
	}

	public bool _ContainsMetaNameCheck(StringView pName)
	{
		bool toRet = false;
		for(let i in _Meta)
			if(i.Name == pName)
				toRet = true;
		return toRet;
	}
}