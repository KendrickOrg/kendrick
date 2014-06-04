tests
testKEModelAddParameters
	|model|
	model := KEModel new.
	model addParameter: #beta value: 520.
	model addParameter: #gamma value: 52.
	self assert: (model atParameter: #beta) equals: 520.
	self assert: (model atParameter: #gamma) equals: 52.
	self assert: (model atParameter: #mu) equals: nil