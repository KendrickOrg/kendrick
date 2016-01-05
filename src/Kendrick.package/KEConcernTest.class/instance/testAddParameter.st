tests-as yet unclassified
testAddParameter
	|c|
	c := KEConcern new.
	c addParameter: #beta.
	self assert: c parameters size equals: 1