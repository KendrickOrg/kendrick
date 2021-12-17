"
A KEBinaryExpression is an expression with two side expressions: lhs and rhs.

Instance Variables
	leftHandSide:		<KEExpression>
	op:		<Symbol>
	rightHandSide:		<KEExpression>

leftHandSide
	- xxxxx

op
	- xxxxx

rightHandSide
	- xxxxx

"
Class {
	#name : #KEBinaryExpression,
	#superclass : #KEExpression,
	#instVars : [
		'op',
		'leftHandSide',
		'rightHandSide'
	],
	#category : #'Kendrick-Core'
}

{ #category : #comparing }
KEBinaryExpression >> = anExpression [
anExpression isNumber ifTrue: [ ^ self = (KENumerical new number: anExpression) ].
anExpression isBinaryExpression ifTrue:[
^(self op = anExpression op) and:
	[self leftHandSide = anExpression leftHandSide
		and:[self rightHandSide = anExpression rightHandSide]
	]
].
^false
]

{ #category : #printing }
KEBinaryExpression >> checkNil [
	^ (leftHandSide isNil) & (rightHandSide isNil)
]

{ #category : #'as yet unclassified' }
KEBinaryExpression >> doSeparation [

	| list left right c1 c2 |
	list := OrderedCollection new.
	c1 := false.
	c2 := false.
	left := leftHandSide.
	leftHandSide isUnaryExpression ifTrue: [ 
		left := leftHandSide expression ].
	right := rightHandSide.
	rightHandSide isUnaryExpression ifTrue: [ 
		right := rightHandSide expression ].
	left isBinaryExpression ifTrue: [ 
		c1 := left op = #+ | (left op = #-) ].
	right isBinaryExpression ifTrue: [ 
		c2 := right op = #+ | (right op = #-) ].
	left isBinaryExpression & c1
		ifTrue: [ 
			| e1 e2 |
			e1 := KEBinaryExpression new
				      op: op;
				      leftHandSide: left leftHandSide;
				      rightHandSide: right.
			e2 := KEBinaryExpression new
				      op: op;
				      rightHandSide: right.
			left op = #-
				ifTrue: [ e2 leftHandSide: left rightHandSide negated ]
				ifFalse: [ e2 leftHandSide: left rightHandSide ].
			e1 isSeparable
				ifTrue: [ list addAll: e1 doSeparation ]
				ifFalse: [ list add: e1 ].
			e2 isSeparable
				ifTrue: [ list addAll: e2 doSeparation ]
				ifFalse: [ list add: e2 ] ]
		ifFalse: [ 
			right isBinaryExpression & c2
				ifTrue: [ 
					| e1 e2 |
					e1 := KEBinaryExpression new
						      op: op;
						      leftHandSide: left;
						      rightHandSide: right leftHandSide.
					e2 := KEBinaryExpression new
						      op: op;
						      leftHandSide: left.
					right op = #-
						ifTrue: [ e2 rightHandSide: right rightHandSide negated ]
						ifFalse: [ e2 rightHandSide: right rightHandSide ].
					e1 isSeparable
						ifTrue: [ list addAll: e1 doSeparation ]
						ifFalse: [ list add: e1 ].
					e2 isSeparable
						ifTrue: [ list addAll: e2 doSeparation ]
						ifFalse: [ list add: e2 ] ]
				ifFalse: [ 
					list add: (KEBinaryExpression new
							 op: op;
							 leftHandSide: left;
							 rightHandSide: right) ] ].
	leftHandSide isUnaryExpression & rightHandSide isUnaryExpression
		ifTrue: [ ^ list ]
		ifFalse: [ 
			leftHandSide isUnaryExpression | rightHandSide isUnaryExpression 
				ifTrue: [ ^ list collect:[:each| each negated]].
		].
	^ list
]

{ #category : #evaluating }
KEBinaryExpression >> evaluateWithModel: aModel [

| left right |
left := leftHandSide evaluateWithModel: aModel.
right := rightHandSide evaluateWithModel: aModel.

op = #+ ifTrue:[
		^left+right].
op = #* ifTrue:[
		^left*right].
op = #/ ifTrue:[
		^left/right].
op = #-	ifTrue:[
		^left-right].
op = #'^' ifTrue:[
		^left raisedTo: right]
]

{ #category : #'as yet unclassified' }
KEBinaryExpression >> generateEvents [

	| events |
	events := OrderedCollection new.
	(#( #* #/ #'^' ) includes: op) ifTrue: [ 
		self isSeparable
			ifTrue: [ 
				| exprs |
				exprs := self separateExpression.
				events := exprs collect: [ :each | 
					          KEEvent new rate: each normalize ] ]
			ifFalse: [ events add: (KEEvent new rate: self normalize) ] ].

	op = #+ ifTrue: [ 
		| lhs rhs |
		lhs := leftHandSide generateEvents.
		rhs := rightHandSide generateEvents.
		events
			addAll: lhs;
			addAll: rhs ].

	op = #- ifTrue: [ 
		| lhs rhs |
		lhs := leftHandSide generateEvents.
		rhs := (KEUnaryExpression new
			        op: #-;
			        expression: rightHandSide) generateEvents.
		events
			addAll: lhs;
			addAll: rhs ].
	^ events
]

{ #category : #testing }
KEBinaryExpression >> isBinaryExpression [
	^ true
]

{ #category : #testing }
KEBinaryExpression >> isSeparable [

	"Apparently returns true is the expression can be expressed as a sum of factors"

	| c c1 c2 |
	c1 := leftHandSide isSeparable.
	c2 := rightHandSide isSeparable.
	c := false.
	op = #* ifTrue: [ 
		| c3 c4 f |
		c3 := false.
		c4 := false.
		f := [ :x | 
		     x isBinaryExpression
			     ifTrue: [ x op = #+ ]
			     ifFalse: [ false ] ].
		leftHandSide isUnaryExpression ifTrue: [ 
			c3 := f value: leftHandSide expression ].
		rightHandSide isUnaryExpression ifTrue: [ 
			c4 := f value: rightHandSide expression ].
		c := (f value: leftHandSide) | (f value: rightHandSide) | c3 | c4 ].
	^ c | c1 | c2
]

{ #category : #accessing }
KEBinaryExpression >> isSimple [ 

^ false
]

{ #category : #accessing }
KEBinaryExpression >> leftHandSide [
	^ leftHandSide
]

{ #category : #accessing }
KEBinaryExpression >> leftHandSide: anExpression [
	leftHandSide := anExpression
]

{ #category : #converting }
KEBinaryExpression >> normalize [

	"If the expression is negative, put the minus on the top"

	| lhs rhs k |
	lhs := leftHandSide normalize.
	rhs := rightHandSide normalize.
	k := KEUnaryExpression new op: #-.
	lhs isUnaryExpression
		ifTrue: [
			rhs isUnaryExpression 
				ifTrue: [ 
					self leftHandSide: lhs expression.
					self rightHandSide: rhs expression]
				ifFalse: [ 
					k expression: (KEBinaryExpression new
							 op: self op;
							 leftHandSide: lhs expression;
							 rightHandSide: rhs).
					^ k ] ]
		ifFalse: [ 
			rhs isUnaryExpression ifTrue: [ 
				k expression: (KEBinaryExpression new
						 op: self op;
						 leftHandSide: rhs expression;
						 rightHandSide:  lhs).
				^ k ] ]
]

{ #category : #accessing }
KEBinaryExpression >> op [
	^ op
]

{ #category : #accessing }
KEBinaryExpression >> op: aString [
	op := aString
]

{ #category : #printing }
KEBinaryExpression >> printOn: aStream [

	op = #*
		ifFalse: [ 
			aStream
				nextPutAll: leftHandSide asString;
				nextPutAll: op asString;
				nextPutAll: rightHandSide asString ]
		ifTrue: [ 
			(leftHandSide isSimple or: [ leftHandSide op = #* ])
				ifTrue: [ aStream nextPutAll: leftHandSide asString ]
				ifFalse: [ 
					aStream
						nextPutAll: '(';
						nextPutAll: leftHandSide asString;
						nextPutAll: ')' ].

			aStream nextPutAll: op asString.

			(rightHandSide isSimple or: [ rightHandSide op = #* ])
				ifTrue: [ aStream nextPutAll: rightHandSide asString ]
				ifFalse: [ 
					aStream
						nextPutAll: '(';
						nextPutAll: rightHandSide asString;
						nextPutAll: ')' ] ]
]

{ #category : #evaluating }
KEBinaryExpression >> removeIndexedVariable [
	|new|
	new := self copy.
	new leftHandSide: (new leftHandSide removeIndexedVariable).
	new rightHandSide: (new rightHandSide removeIndexedVariable).
	^ new.

]

{ #category : #removing }
KEBinaryExpression >> removeVariable: aVariable [
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"

	| new |
	new := self class new
		op: op;
		leftHandSide: (leftHandSide removeVariable: aVariable);
		rightHandSide: (rightHandSide removeVariable: aVariable).
	new checkNil
		ifTrue: [ ^ nil ].
	new leftHandSide ifNil: [ ^ rightHandSide ].
	new rightHandSide ifNil: [ ^ leftHandSide ].
	new leftHandSide isUnaryExpression & new leftHandSide checkNil
		ifTrue: [ ^ KEUnaryExpression new
				op: #-;
				expression: rightHandSide ].
	new rightHandSide isUnaryExpression & new rightHandSide checkNil
		ifTrue: [ ^ KEUnaryExpression new
				op: #-;
				expression: leftHandSide ].
	^ new
]

{ #category : #accessing }
KEBinaryExpression >> rightHandSide [
	^ rightHandSide
]

{ #category : #accessing }
KEBinaryExpression >> rightHandSide: anExpression [
	rightHandSide := anExpression
]

{ #category : #'as yet unclassified' }
KEBinaryExpression >> separateExpression [

	| expressions |
	expressions := OrderedCollection new.
	leftHandSide isSeparable
		ifTrue: [ 
			| l |
			l := OrderedCollection new.
			expressions := leftHandSide doSeparation.
			expressions do: [ :each | 
				| exp |
				exp := KEBinaryExpression new
					       op: op;
					       leftHandSide: each;
					       rightHandSide: rightHandSide.
				exp isSeparable
					ifTrue: [ l addAll: exp doSeparation ]
					ifFalse: [ l add: exp ] ].
			^ l ]
		ifFalse: [ 
			rightHandSide isSeparable
				ifTrue: [ 
					| l |
					l := OrderedCollection new.
					expressions := rightHandSide doSeparation.
					expressions do: [ :each | 
						| e |
						e := KEBinaryExpression new
							     op: op;
							     leftHandSide: leftHandSide;
							     rightHandSide: each.
						e isSeparable
							ifTrue: [ l addAll: e doSeparation ]
							ifFalse: [ l add: e ] ].
					^ l ]
				ifFalse: [ expressions := self doSeparation ] ].
	^ expressions
]

{ #category : #testing }
KEBinaryExpression >> sign [
"Return -1 if binary expression is negative, 1 if positive"

	op = #* ifTrue: [ ^ rightHandSide sign * leftHandSide sign ].
	^ 1
]
