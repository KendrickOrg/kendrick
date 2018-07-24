"
A PPODEParser parses the ode equations input to the expressions implemented in Semantic-Model-Core.

"
Class {
	#name : #PPODEParser,
	#superclass : #PPODEGrammar,
	#category : #'Kendrick-DSL-ODE'
}

{ #category : #grammar }
PPODEParser >> addition [

^ super addition foldLeft: [:a :op :b | 
		(KEBinaryExpression new)
		op: op inputValue asSymbol;
		leftHandSide:a;
		rightHandSide:b]
]

{ #category : #grammar }
PPODEParser >> cos [ 

^ super cos  ==> [:nodes|
	(KEMathFunctionExpression new)
	functionName: #cos;
	functionExpr: (nodes at: 5)
	]
]

{ #category : #grammar }
PPODEParser >> exp [

^ super exp  ==> [:nodes|
	(KEMathFunctionExpression new)
	functionName: #exp;
	functionExpr: (nodes at: 5)
	]
]

{ #category : #grammar }
PPODEParser >> expression [

^ super expression ==> [:nodes |
	nodes
	]
]

{ #category : #grammar }
PPODEParser >> getObjectArrayOf: nodes at: id [
	|collection|
	collection := OrderedCollection new.
	nodes do: [ :each|
		collection addLast: (each at: id) parsedValue
		 ].
	^ collection
]

{ #category : #grammar }
PPODEParser >> identifier [

^ super identifier flatten ==> [:string | (KEVariable new) symbol: string asSymbol]
]

{ #category : #grammar }
PPODEParser >> log [

^ super log  ==> [:nodes|
	(KEMathFunctionExpression new)
	functionName: #log;
	functionExpr: (nodes at: 5)
	]
]

{ #category : #grammar }
PPODEParser >> multiplication [
	^ super multiplication
		foldLeft: [ :a :op :b | 
			KEBinaryExpression new
				op: op inputValue asSymbol;
				leftHandSide: a;
				rightHandSide: b ]
]

{ #category : #grammar }
PPODEParser >> number [ 

^ super number flatten ==> [:string | (KENumerical new) number: string asNumber]
]

{ #category : #grammar }
PPODEParser >> odequation [

^ super odequation ==> [:nodes |
	(KEEquation new)
		variable: (nodes first parsedValue);
		tVariable: ((nodes at: 3) parsedValue);
		expression: nodes last
	]
]

{ #category : #grammar }
PPODEParser >> parenthesis [

^ super parenthesis ==> [:nodes |
	nodes second
	]
]

{ #category : #grammar }
PPODEParser >> power [
	^ super power
		foldLeft: [ :a :op :b | 
			KEBinaryExpression new
				op: op inputValue asSymbol;
				leftHandSide: a;
				rightHandSide: b ]
]

{ #category : #grammar }
PPODEParser >> simpleEquation [

^ super simpleEquation ==> [:nodes |
	(KEEquation new)
		variable: nodes first parsedValue;
		tVariable: nil;
		expression: nodes last
	]
]

{ #category : #grammar }
PPODEParser >> sin [ 

^ super sin  ==> [:nodes|
	(KEMathFunctionExpression new)
	functionName: #sin;
	functionExpr: (nodes at: 5)
	]
]

{ #category : #grammar }
PPODEParser >> squarebrackets [

"^ super squarebrackets ==> [:nodes |
	(nodes at: 5) 
	ifNotNil: [
		(KEIndexedVariable new)
		symbol: (nodes first) inputValue asSymbol;
		idExpression1: (nodes at: 3) parsedValue; 
		idExpression2: (((nodes at: 5) at: 1) at: 2) parsedValue] 
	ifNil: [
		(KEIndexedVariable new)
		symbol: (nodes first) inputValue  asSymbol;
		idExpression1: (nodes at: 3) parsedValue;
		idExpression2: ((KENumerical new) number: -1).
		]		
	]"
	^ super squarebrackets ==> [ :nodes|
		(nodes at: 5) 
		ifNil: [ 
			(KEIndexedVariable new)
				symbol: (nodes first) inputValue asSymbol;
				addIndex: (nodes at: 3) parsedValue
			 ]
		ifNotNil: [ 
			(KEIndexedVariable new)
				symbol: (nodes first) inputValue asSymbol;
				addIndex: (nodes at: 3) parsedValue;
				addAllIndex: (self getObjectArrayOf: (nodes at: 5) at: 2)
			 ]
		]
]

{ #category : #grammar }
PPODEParser >> sum [ 

^ super sum  ==> [:nodes|
	(KESigmaFunctionExpression new)
	functionName: #sum;
	idVariable: (nodes at: 5) parsedValue;
	functionExpr: (nodes at: 7)
	]
]

{ #category : #grammar }
PPODEParser >> unary [ 

^ super unary ==> [:nodes |
	(KEUnaryExpression new)
		op: (nodes first) asSymbol
		; expression: nodes last]
]
