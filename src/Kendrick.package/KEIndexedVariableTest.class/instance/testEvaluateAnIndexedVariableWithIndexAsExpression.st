as yet unclassified
testEvaluateAnIndexedVariableWithIndexAsExpression
	|model dsdt|
	model := KEModel2 new.
	model population nodes: 3.
	(model population at: 1) compartments: #((S 9999) (I 1)).
	(model population at: 2) compartments: #((S 1000) (I 0)).
	(model population at: 3) compartments: #((S 2000) (I 0)).
	model addParameter: #beta value: #(#(0 0.02 0.02) #(0.02 0.0 0.0)  #(0.02 0.0 0.0)). 
	model addParameter: #j value: (1 to: 3).
	model addParameter: #d value: 5.
	dsdt := 'S[i]:t=-sum(j, beta[i][j]*I[j])*S[i+1]' parseAsAnEquation.
	model addEquation: dsdt.
	model addTemporalParameter: #PID value: #(2).
	model addTemporalParameter: #i value: 2.
	self assert: (dsdt expression evaluateWithModel: model) equals: -40.