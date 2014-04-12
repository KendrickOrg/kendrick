tests
testParameterAsExpression2
	|model dsdt|
	model := KEModel2 new.
	model addCompartment: #S numberOfIndividuals: 1.
	model addCompartment: #I numberOfIndividuals: 1.
	model addParameter: #beta expressedAs: 'beta[i][j]=exp(-(((i-j)/d)^2))' parseAsAnEquation. 
	model addParameter: #i value: (50 to: 100).
	model addParameter: #j value: (50 to: 100).
	model addParameter: #d value: 5.
	dsdt := 'S:t=-beta[i][j]*S*I' parseAsAnEquation.
	model addEquation: dsdt.
	model addTemporalParameter: #i value: 50.
	model addTemporalParameter: #j value: 70.
	self assert: (dsdt expression evaluateWithModel: model withTemporalParameters: model temporalParameters) equals: ((-16) exp)*(-1).