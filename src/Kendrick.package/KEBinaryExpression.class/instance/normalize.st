converting
normalize
	"If the expression is negative, put the minus on the top"
	|l1 l2 k | 
	l1 := leftHandSide normalize.
	l2 := rightHandSide normalize.
	k := KEUnaryExpression new.
	k op:#-.
	l1 isUnaryExpression 
	ifTrue:[
		l2 isUnaryExpression 
		ifTrue:[
			self leftHandSide: l1 expression.
			self rightHandSide: l2 expression.
			^ self
			]
		ifFalse: [
			k expression: (KEBinaryExpression new op: self op; leftHandSide: l1 expression; rightHandSide: l2).
			^ k	
			]
		]
    ifFalse: [
		l2 isUnaryExpression 
		ifTrue:[
			k expression: (KEBinaryExpression new op: self op; leftHandSide: l1; rightHandSide: l2 expression).
			^ k	
	    	]
		ifFalse:[
			^ self
	 	]
	]
