tests
testAddParameterExpression
	|model |
	model := KEModel new.
	"two ways to specify a parameter as an expression"
	model addParameter: #beta value: [ :m| (m t) cos ].
	model addParameter: #gamma value: 'cos(t)'.
	model t: 60.
	self assert: (((model parameters) at: #beta) value: model) equals: (60 cos).
	self assert: (((model parameters) at: #gamma) value: model) equals: (60 cos).