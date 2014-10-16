accessing
at: anObject
	"This fuction will return a subPopulation or a Compartment"
	"((anObject = 0) | (anObject = #(0))) ifTrue: [ ^ self ]."
	^ compartments at: (compartmentNames indexOf: anObject)
	
	
	