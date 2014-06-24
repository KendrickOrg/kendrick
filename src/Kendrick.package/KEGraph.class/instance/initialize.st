as yet unclassified
initialize
	"The structure of graph is the same to the one of population"
	super initialize.
	nodes := OrderedCollection new.
	parent := nil.
	id := OrderedCollection new.
	id add: 0