tests
testParameterAsExpression2
	|model dsdt|
	model := KEModel new.
	model population compartments: #((S 1) (I 1)).
	model addParameter: #beta expressedAs: 'beta[i][j]=exp(-(((i-j)/d)^2))' parseAsAnEquation. 
	model addParameter: #i value: (50 to: 100).
	model addParameter: #j value: (50 to: 100).
	model addParameter: #d value: 5.
	dsdt := 'S:t=-beta[i][j]*S*I' parseAsAnEquation.
	model addEquation: dsdt.
	model addTemporalParameter: #i value: 50.
	model addTemporalParameter: #j value: 70.
	model addTemporalParameter: #PID value: #(0).
	self assert: (dsdt expression evaluateWithModel: model) equals: ((-16) exp)*(-1).