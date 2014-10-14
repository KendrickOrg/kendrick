tests
testParameterAsExpression1
	|model dsdt |
	model := KEModel new.
	model population compartments: #(S I).
	model population at: #S put: 1; at: #I put: 1.
	"model addParameter: #beta expressedAs: 'beta[i][j]=(i-j)^2' parseAsAnEquation." 
	model addParameter: #beta expression: '(i-j)^2' parseAsAnExpression.
	model addParameter: #i value: (50 to: 100).
	model addParameter: #j value: (50 to: 100).

	dsdt := 'S:t=-beta[i][j]*S*I' parseAsAnEquation.
	model addEquation: dsdt.
	model addTemporalParameter: #i value: 50.
	model addTemporalParameter: #j value: 30.
	model currentSubPopulation: (model population).
	self assert: (dsdt variable symbol) equals: #S.
	self assert: (dsdt tVariable symbol) equals: #t.
	self assert: (dsdt expression evaluateWithModel: model) equals: (-400).	