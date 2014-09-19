tests
testParameterAsExpression2
	|model dsdt|
	model := KEModel new.
	model population compartments: #(S I).
	model population at: #S put: 1; at: #I put: 1.
	model addParameter: #beta expression: 'exp(-(((i-j)/d)^2))' parseAsAnExpression. 
	model addParameter: #i value: (50 to: 100).
	model addParameter: #j value: (50 to: 100).
	model addParameter: #d value: 5.
	dsdt := 'S:t=-beta[i][j]*S*I' parseAsAnEquation.
	model addEquation: dsdt.
	model addTemporalParameter: #i value: 50.
	model addTemporalParameter: #j value: 70.
	model addTemporalParameter: #PID value: #(0).
	self assert: (dsdt expression evaluateWithModel: model) equals: ((-16) exp)*(-1).