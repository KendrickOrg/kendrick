printing
printOn: aStream
	"Each node has a label who is an array of associations attribute->value, in the case of each node representing an individual, do not print the id of this individual"
	aStream nextPutAll: label asString