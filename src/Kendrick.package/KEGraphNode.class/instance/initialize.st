as yet unclassified
initialize
	super initialize.
	id := 0.
	parent := nil.
	subNodes := OrderedCollection new.
	adjacentNodes := OrderedCollection new.
	weights := OrderedCollection new.
	