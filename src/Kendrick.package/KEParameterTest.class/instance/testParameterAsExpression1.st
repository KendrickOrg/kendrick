tests
testParameterAsExpression1
	|model dsdt |
	model := KEModel2 new.
	model addCompartment: #S numberOfIndividuals: 1.
	model addCompartment: #I numberOfIndividuals: 1.
	model addParameter: #beta expressedAs: 'beta[i][j]=(i-j)^2' parseAsAnEquation. 
	model addParameter: #i value: (50 to: 100).
	model addParameter: #j value: (50 to: 100).

	dsdt := 'S:t=-beta[i][j]*S*I' parseAsAnEquation.
	model addEquation: dsdt.
	model addTemporalParameter: #i value: 50.
	model addTemporalParameter: #j value: 30.
	self assert: (dsdt variable symbol) equals: #S.
	self assert: (dsdt tVariable symbol) equals: #t.
	self assert: (dsdt expression evaluateWithModel: model) equals: (-400).	