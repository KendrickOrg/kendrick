as yet unclassified
atNode: aLabel
	aLabel isNumber ifTrue: [ ^ self nodes at: aLabel ].
	self nodes do: [ :n| (n label includesAll: (aLabel)) ifTrue: [ ^ n ] ]
	