as yet unclassified
testEvaluateAnIndexedVariableWithIndexAsExpression
	|model dsdt|
	model := KEModel2 new.
	model addCompartment: #S numberOfIndividuals: #(9999 1000 2000).
	model addCompartment: #I numberOfIndividuals: #(1 0 0).
	model addParameter: #beta value: #(#(0 0.02 0.02) #(0.02 0.0 0.0)  #(0.02 0.0 0.0)). 
	model addParameter: #i value: (1 to: 3).
	model addParameter: #j value: (1 to: 3).
	model addParameter: #d value: 5.
	dsdt := 'S[i]:t=-sum(j, beta[i][j]*I[j])*S[i+1]' parseAsAnEquation.
	model addEquation: dsdt.
	model addTemporalParameter: #i value: 2.
	self assert: (dsdt expression evaluateWithModel: model) equals: -40.