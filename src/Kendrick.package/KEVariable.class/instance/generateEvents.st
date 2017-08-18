as yet unclassified
generateEvents
	"Generate an event from a variable"

	^ OrderedCollection with: (KEEvent new rate: self)