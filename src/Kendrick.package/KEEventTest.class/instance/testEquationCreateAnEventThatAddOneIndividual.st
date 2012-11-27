tests
testEquationCreateAnEventThatAddOneIndividual
	| dsdt |
	dsdt := 'S:t=beta*S*I' parseAsAnEquation.
	self assert: (dsdt generateEvents any isAddingOneIndividualFrom: #S)