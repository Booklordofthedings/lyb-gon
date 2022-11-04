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

	[Union]
	public struct GonEntryData
	{
	 public float Number;
	 public String TextString;
	 public bool Boolean;
	 public String Custom;
	 public String Text;
	 public String Data;
	 public GonEntry Object;
	 public GonEntry[] Array;
	 public int64 Integer;
	 public double BigNum;

	}

	public String Name;
	public String TypeName;
	public gEntryTypes Type;
	public GonEntryData Data;
	
	public ~this()
	{
		
	}


}