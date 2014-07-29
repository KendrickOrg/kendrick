accessing
at: anObject
	"This fuction will return a subPopulation or a Compartment"
	((anObject = 0) | (anObject = #(0))) ifTrue: [ ^ self ].
	^ compartments at: (compartmentNames indexOf: anObject)
	"anObject isNumber ifTrue: [ ^ nodes at: anObject ] .
	anObject isArray ifTrue: [ 
		|temp|
		temp := self.
		anObject do: [ :each| temp := temp at: each ].
		^ temp
		 ].
	 ^ nodes at: (nodeNames indexOf: anObject)"
	
	
	
	