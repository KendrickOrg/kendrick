accessing
atNode: aLabel
	^ self nodes detect: [ :n | n label = aLabel ]