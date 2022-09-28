namespace lyb_gon;
using System;

class GonEntry
{
	public enum gEntryTypes
	{
		Number,
		String,
		Boolean,
		Custom,
		Text,
		Data,
		Object
	}

	public String Name;
	public String TypeName;
	public gEntryTypes Type;
	public Variant Data;
	public Gon Object;

	public ~this()
	{
		delete Name;
		delete TypeName;
		Data.Dispose();
		if(Type == .Object)
			delete Object;
	}
}