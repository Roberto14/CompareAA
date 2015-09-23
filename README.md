# CompareAA
Compare Associative Array in BrightScript

## Instalation
Copy CompareAA.brs file into source folder.

## Usage
**CompareAA** is a function that accepts two arguments and returns **Boolean**.
To compare two objects or lists (types `roAssociativeArray` or `roArray`) simply call CompareAA(object1,object2) and check for returned bool.

## Example of usage
Check out an example of usage:

```brightscript
obj1 = { foo: "bar", list: ["foo", "bar"]}
obj2 = { foo: "bar", list: ["foo", "bar", "bar"]}

if CompareAA(obj1,obj2) then
  print "Compared objects are equal."
else
  print "Objects are different."
end if
```
Example above prints *"Objects are different."*

## Notes
Be sure you dont name other function as CompareAA!
Use and abuse! 
And for those who dont know, BrightScript language is used for Roku channels development.
