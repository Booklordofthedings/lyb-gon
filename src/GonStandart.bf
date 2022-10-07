/*
## Gon (Generic Object Notation) Standard
This is the official standard of the of the gon notation.  
Gon exists as an easily parseable way of writing down objects.  
It is supposed to be mostly human read- and writeable and easy to understand.

-----------

### Layout
Gon entries are divided by linebreaks and each individual gon entry uses the following layout  
[Type]:[Name]:[Value]  
The colons are used as dividers while parsing a given entry.
Specific types of gon entries may use a slightly different syntax if necessary

### Available Types
- **Number** *(n:[name]:123.123)*  
  The Number type is atleast a 4 byte floating point number.
- **String** *(s:[name]:jasoidasio sisdfidsf ajsajdonwubv)*  
  A single line of text.
- **Booleans** *(b:[name]:true)*  
  A Boolean value that may either be "true" or "false".
- **Customs** *(c:[typeName]:[name]:[value])*  
  A Custom type entry may have any input value (which are all considered strings by the parser) and also declares its own typeName.
- **Text** *(t:[name]:[lineCount] or t:[name]:start/end)*  
  Text is a multiline entry. Where the "t:" line only specifies its data, not its actual content.
  Either the the value is an integer and specifies how many of the following lines are included in the Text object.
  Or the value states "start" which means the Text entry will continue until it hits a corresponding "end" object.
  Text objects arent fully unmodified. Due to Writing convenience intendation at the start of a new line will be removed in the parsed object.
  (so after a \n every whitespace character until the next non whitespace will be removed)
- **Data** *(d:[name]:[lineCount] or t:[name]:start/end))*    
  Data is an entry of a similar type as Text, with the same functionality. The only change is,
  that data doesnt have the whitespace removal. Also the intent behind data is different,
  mainly being used as binary data that was to be programatically saved.
- **Object** *(o:[name] O:[name])*  
  Objects have a start and an end tag and only have a name property with no value. Instead the "value" of an object
  are all of the lines of gon between the opening and closing tag of the given object.
- **Arrays** *(a:[name] A:[name])*
  Arrays are similar to objects in syntax, but behave as arrays in most languages do.
  The may only contain one type of item and may just omit the name portion of the object
  (n::[value], in that case dublicate keys of "::" are also allowed).
  Due to the goal of keeping parsing fine, objects will only be checked by type, not by the content of the actual object
  (One array may contain 2 objects that have a different internal structure).
- **Integers** *(i:[name]:[value])*
  4 byte integer. This is optional and may internally just be parsed as a 4 byte floating point.
  However it might be nice to have in case you actually care about it.
  (If parsing to float works this is not going to be that much harder, so you might aswell have it)
- **BigNumber** *(N:[name]:[value])*
  8 byte floating point value
- **Metadata** *(m:[type (n/b/s)]:[name]:[value])*
  Metadata is used to indicate some data about the file/object itself. Its to be stored seperately from all other gon entries in a key/value dictionary type storage.
  It may have 3 different types (number, boolean, string) which have to be indicated with it aswell. Some Names for meta objects already have an intended use,
  which should not be changed. Also a parser may throw warnings/errors by itself if it finds a meta tag that indicates something its not made for.
  (One example of this is the string meta object named "style" which should be used what "flavor" of gon is used for this object.
  The value for a standart parser should be "default", however custom parsers may use their own style parameter.
  If a parser finds a gon object written in a style its not made to handle it should notify the user).
- **Comments** *(/[comment])*  
  The only available comments are single line comments, which are indicated by a slash. If a comment is inside a data or text object it will be
  parsed normally as if it where a normal line.
  
### Reserved Tags
Some tags might be available now but are to be reserved for future use to compatibility. These tags include *all single character tags*.
Custom gon styles may use multicharacter tags though.
 
 
 ### User Acess
 In order to acess the parsed data there are a few requirements.
 1. The data has to be acessible by index
 2. A count/length property has to be given on the parsed data
 3. Parsed data needs to save the name of an object
 4. There may only be one of each key on a given layer of gon in order to make acess easier
  (no 2 entries may have the same name)

Further acess is good to have but not necessary
 
  ### Error handling
  Gon is supposed to be leniant so the parser should never throw a hard error while parsing.
  Instead it should parse as well as it can and when it finds something that would be a warning or an error
  it will add it to some kind of error queue. If the user cares about errors or a specific type of error,
  they can check for themselves wether it happened.
  The default behaviour for faulty entries in gon is to simple ignore them.
  When parsing objects that have a size the behaviour is to close the current scope either when
  the correct closing entry is given, or when the file ends.
*/