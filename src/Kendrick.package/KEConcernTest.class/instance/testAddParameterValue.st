tests-as yet unclassified
testAddParameterValue
	|c|
	c := KEConcern new.
	c addParameter: #beta value: 0.05.
	self assert: c parameters size equals: 1