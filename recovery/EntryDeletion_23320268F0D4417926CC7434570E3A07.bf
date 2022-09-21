namespace lyb_gon.Tests;
using System;

/*
	Several tests to check wether the gon entries delete values in the way they should
*/
static
{
	[Test]
	///Checks wether a object of type custom will be properly deleted
	private static void EntryDeletionCustom()
	{
		GonEntry e = new [Friend]lyb_gon.GonEntry("Testname", .Custom,"Irellevant","This has 2 be checked");
		delete e;
	}

	
}