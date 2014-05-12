tests
testParameterAsExpression1
	|model dsdt |
	model := KEModel2 new.
	model population compartments: #((S 1) (I 1)).
	model addParameter: #beta expressedAs: 'beta[i][j]=(i-j)^2' parseAsAnEquation. 
	model addParameter: #i value: (50 to: 100).
	model addParameter: #j value: (50 to: 100).

	dsdt := 'S:t=-beta[i][j]*S*I' parseAsAnEquation.
	model addEquation: dsdt.
	model addTemporalParameter: #i value: 50.
	model addTemporalParameter: #j value: 30.
	model addTemporalParameter: #PID value: #(0).
	self assert: (dsdt variable symbol) equals: #S.
	self assert: (dsdt tVariable symbol) equals: #t.
	self assert: (dsdt expression evaluateWithModel: model) equals: (-400).	