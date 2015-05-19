as yet unclassified
printOn: aStream
	"Each node has a label who is an array of associations attribute->value, in the case of each node representing an individual, do not print the id of this individual"
	label do: [ :e|
		e key ~= #id ifTrue: [ aStream nextPutAll: e value asString ]
		 ]