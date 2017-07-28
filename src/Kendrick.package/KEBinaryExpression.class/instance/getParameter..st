printing
getParameter: aDictionary
	|p|
	p := leftHandSide getParameter: aDictionary.
	p ifNil: [ p := rightHandSide getParameter: aDictionary ].
	^ p
	