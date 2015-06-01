as yet unclassified
atNode: aLabelIdentifyingValue
	aLabelIdentifyingValue isNumber ifTrue: [ ^ self nodes at: aLabelIdentifyingValue ].
	self nodes do: [ :n| (n label includes: (attribute->aLabelIdentifyingValue)) ifTrue: [ ^ n ] ]
	