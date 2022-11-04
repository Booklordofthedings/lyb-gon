namespace lyb_gon;

using System;
using System.Collections;

class Gon
{
	private String _BaseString;
	private String _Name; //only used for sub objects

	public List<GonEntry> _Entries;
	private List<GonParserError> _Errors;
	private List<GonEntry> _Meta;

	public this(String GonString)
	{
		Initialize(GonString, "");
	}

	///Initializes the gon object, used for sub objects
	private void Initialize(String pGonString, String pName)
	{
		_Name = (pName == null) ? new String("ERR") : new String(pName);

		_Entries = new .();
		_Meta = new .();

		if(pGonString == null) { _Errors.Add(.NullBodyError); return; }
		else if(pGonString == "") { _Errors.Add(.EmptyBodyError); return; }

		_BaseString = new .(pGonString);
		this._Parse(_BaseString);
	}

	public  ~this()
	{
		DeleteContainerAndItems!(_Entries);
		DeleteContainerAndItems!(_Meta);
		delete _Errors;
		delete _BaseString;
		delete _Name;
	}
}