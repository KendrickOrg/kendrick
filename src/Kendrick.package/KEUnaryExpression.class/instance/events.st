as yet unclassified
events
|list e|
list := Bag new.
e := KEEvent new.
e rate: self normalize.
list add:e.
^list