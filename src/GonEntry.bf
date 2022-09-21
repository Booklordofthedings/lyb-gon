namespace lyb_gon;
using System;

/*
	Represents a single gon entry as a simple object.
	The entries itself hides nothing and has no interaction properties
*/

class GonEntry
{
	public gonType Type;
	public String TypeName;
	public String Name;
	public Variant Data;

	private this(String name, gonType type, String data, String typeName = "Default", Gon object = null)
	{
		Type = type;
		Name = new String(name); //So that we can manage memory correctly
		//No castin checks, since no users should ever manually create this
		switch(type)
		{
		case .String:
			TypeName = "String";
			Data = Variant.Create(new String(data));
		case .Number:
			TypeName = "Number";
			Data = Variant.Create(float.Parse(data));
		case .Boolean:
			TypeName = "Boolean";
			Data = Variant.Create(bool.Parse(data));
		case .Custom:
			TypeName = new String(typeName); //Its important that delete checks wether its custom and clears this
			Data = Variant.Create(new String(data));
		case .Text:
			TypeName = "Text";
			Data = Variant.Create(new String(data));
		case .Data:
			TypeName = "Data";
			Data = Variant.Create(new String(data));
		case .Object:
			TypeName = "Object";
			Data = Variant.Create(object);
		}
	}

	public ~this()
	{
		delete Name;
		Data.Dispose();
		if(Type == .Custom)
			delete TypeName;
	}
}