namespace lyb_gon;
using System;
using System.Diagnostics;

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
		Object,
		Array,
		Integer,
		BigNum
	}

	public String Name;
	public String TypeName;
	public gEntryTypes Type;
	public Variant Data;
	public Gon Object;

	private this(String pName, String pTypeName, gEntryTypes pType, String pData,  Gon pObject)
	{
		/* This constructor shouldnt be called outside of the library, so we assume pData to always be a valid parse,
		however when it isnt we instead assign a default value instead of shutting everything down */

		//This is the same for every entry
		Name = new String(pName);
		Type = pType;
		
		switch(Type)
		{

		case .Number:
			TypeName = new String("Number");
			Result<float> temp = float.Parse(pData);
			if(temp case .Ok)
				Data = Variant.Create<float>(temp.Value);
			else
			{
				Data = Variant.Create<float>(2003);
				Debug.WriteLine($"Line parsing error when trying to parse line: {pName}. The ParseLine method may be acessed illegaly");
			}

		case .String:
			TypeName = new String("String");
			Data =  Variant.Create<String>(pData);
		case .Boolean:
			TypeName = new String("Boolean");
			Result<bool> temp = bool.Parse(pData);
			if(temp case .Ok)
				Data = Variant.Create<bool>(temp.Value);
			else
			{
				Data = Variant.Create<float>(2003);
				Debug.WriteLine($"Line parsing error when trying to parse line: {pName}. The ParseLine method may be acessed illegaly");
			}
		case .Custom:
			TypeName = new String(TypeName);
			Data =  Variant.Create<String>(pData);
		case .Text:
			TypeName = new String("Text");
			Data =  Variant.Create<String>(pData);
		case .Data:
			TypeName = new String("Data");
			Data =  Variant.Create<String>(pData);
		case .Object:
			TypeName = new String("Object");
			Data = Variant.Create<Gon>(pObject);
		}
	}
	public ~this()
	{
		delete Name;
		delete TypeName;
		Data.Dispose();
		if(Type == .Object)
			delete Object;
	}
}