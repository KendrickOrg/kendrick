evaluating
removeIndexedVariable
	|new|
	new := self copy.
	new leftHandSide: (new leftHandSide removeIndexedVariable).
	new rightHandSide: (new rightHandSide removeIndexedVariable).
	^ new.
