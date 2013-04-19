as yet unclassified
visitNode: aNode
	aNode class == KENumerical
		ifTrue: [ self acceptKENumerical: aNode ].
	aNode class == KEModel
		ifTrue: [ self acceptKEModel: aNode ].
	aNode class == KEVariable
		ifTrue: [ self acceptKEVariable: aNode ].
	aNode class == KEBinaryExpression 
		ifTrue: [ self acceptKEBinaryExpression: aNode ].
	aNode class == KECompartment 
		ifTrue: [self acceptKECompartment: aNode]