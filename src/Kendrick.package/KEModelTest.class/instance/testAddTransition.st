tests-as yet unclassified
testAddTransition
	|model|
	model := KEModel new.
	
	model addTransition: (KETransition from: '{#status: #S}' to: '{#status: #I}' probability: 'beta*I' parseAsAnExpression ).
	self assert: (model transitions size) equals: 1