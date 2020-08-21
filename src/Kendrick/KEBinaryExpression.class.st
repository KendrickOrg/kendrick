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
KEBinaryExpression >> checkHasVariable: aDictionary [
	^ (leftHandSide checkHasVariable: aDictionary) | (rightHandSide checkHasVariable: aDictionary)
]

{ #category : #printing }
KEBinaryExpression >> checkNil [
	^ (leftHandSide isNil) & (rightHandSide isNil)
]

{ #category : #'as yet unclassified' }
KEBinaryExpression >> doSeparation [
	|list left right c1 c2|
	list := OrderedCollection new.
	c1 := false.
	c2 := false.
	left := leftHandSide.
	leftHandSide isUnaryExpression ifTrue: [left := (leftHandSide expression)].
	right := rightHandSide.
	rightHandSide isUnaryExpression ifTrue: [right := (rightHandSide expression)].
	left isBinaryExpression ifTrue: [c1 := (left op = #+)|(left op = #-)].
	right isBinaryExpression ifTrue: [c2 := (right op = #+)|(right op = #-)].
	(left isBinaryExpression)&c1 ifTrue: [
		|e1 e2|
		e1 := (KEBinaryExpression new) op: op; leftHandSide: (left leftHandSide); rightHandSide: right.
		e2 := (KEBinaryExpression new) op: op; rightHandSide: right.
		left op = #- ifTrue: [e2 leftHandSide: ((KEUnaryExpression new) op: #-; expression: (left rightHandSide))] ifFalse: [e2 leftHandSide: (left rightHandSide)].
		e1 isSeparable ifTrue: [list addAll: (e1 doSeparation)] ifFalse: [list add: e1].
		e2 isSeparable ifTrue: [list addAll: (e2 doSeparation)] ifFalse: [list add: e2].			
		]
	ifFalse: [
		(right isBinaryExpression)&c2 ifTrue: [
			|e1 e2|
			e1 := (KEBinaryExpression new) op: op; leftHandSide: left; rightHandSide: (right leftHandSide).
			e2 := (KEBinaryExpression new) op: op; leftHandSide: left. 
			right op = #- ifTrue: [e2 rightHandSide: ((KEUnaryExpression new) op: #-; expression: (right rightHandSide))] ifFalse: [e2 rightHandSide: (right rightHandSide)].
			e1 isSeparable ifTrue: [list addAll: (e1 doSeparation)] ifFalse: [list add: e1].
			e2 isSeparable ifTrue: [list addAll: (e2 doSeparation)] ifFalse: [list add: e2].
			]						
		ifFalse: [
			list add: ((KEBinaryExpression new) op: op; leftHandSide: left; rightHandSide: right).
			]
		].
	(leftHandSide isUnaryExpression)&(rightHandSide isUnaryExpression) ifTrue: [^ list] 
	ifFalse: [
		(leftHandSide isUnaryExpression)|(rightHandSide isUnaryExpression) ifTrue: [
			|l|
			l := OrderedCollection new.
			list do: [:each|l add: ((KEUnaryExpression new) op: #-; expression: each)].
			^ l
			]
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
|list |
list := OrderedCollection new.
(op = #*)|(op  = #/)|(op   = #'^') ifTrue:[
	self isSeparable ifTrue: [
		|l|
		l := self separateExpression.
		l do: [:each|
			|e|
			e := KEEvent new.
			e rate: each normalize.
			list add:e
			]
		]
	ifFalse: [
		|e|
		e := (KEEvent new) rate: self normalize.
		list add: e.
		]
	].

(op   = #+)
ifTrue:[
	|l1 l2|
l1 := leftHandSide generateEvents.	
l2 := rightHandSide generateEvents.
list addAll:l1.
list addAll:l2.
].

(op   = #-)
ifTrue:[
	|l1 l2|
	l1 := leftHandSide generateEvents.
	l2 := ((KEUnaryExpression new) op: #-; expression: rightHandSide) generateEvents.
	l1 ifNotNil:[list addAll:l1].
	list addAll:l2.
	].
^list
]

{ #category : #printing }
KEBinaryExpression >> getParameter: aDictionary [
	|p|
	p := leftHandSide getParameter: aDictionary.
	p ifNil: [ p := rightHandSide getParameter: aDictionary ].
	^ p
	
]

{ #category : #testing }
KEBinaryExpression >> isBinaryExpression [
	^ true
]

{ #category : #testing }
KEBinaryExpression >> isSeparable [
	|c c1 c2|
	c1 := leftHandSide isSeparable.
	c2 := rightHandSide isSeparable.
	c := false.
	(op = #*)"|(op = #/)" ifTrue: [
		|c3 c4 f|
		c3 := false.
		c4 := false.
		"f := [ :x | (x isBinaryExpression) ifTrue: [((x op = #+)|(x op = #-))] ifFalse: [false] ]."
		f := [ :x| x isBinaryExpression ifTrue: [ x op = #+ ] ifFalse: [ false ] ].
		leftHandSide isUnaryExpression ifTrue: [c3 := (f value: (leftHandSide expression))].			
		rightHandSide isUnaryExpression ifTrue: [c4 := (f value: (rightHandSide expression))].
		c := (f value: leftHandSide)|(f value: rightHandSide)|c3|c4
		].
	^ c|c1|c2
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
	aStream
		nextPutAll: leftHandSide asString;
		nextPutAll: op asString;
		nextPutAll: rightHandSide asString
]

{ #category : #removing }
KEBinaryExpression >> remove: aVariable [
	"This function is reserved for the reformulation of rate expression to probability of contact of an event generated from an equation"

	| new |
	new := self class  new
		op: op;
		leftHandSide: (leftHandSide remove: aVariable);
		rightHandSide: (rightHandSide remove: aVariable).
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

{ #category : #evaluating }
KEBinaryExpression >> removeIndexedVariable [
	|new|
	new := self copy.
	new leftHandSide: (new leftHandSide removeIndexedVariable).
	new rightHandSide: (new rightHandSide removeIndexedVariable).
	^ new.

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
	|list|
	list := OrderedCollection new.
	(leftHandSide isSeparable) ifTrue: [
		|l|
		l := OrderedCollection new.
		list := leftHandSide doSeparation.
		list do: [:each| 
			|e|
			e := (KEBinaryExpression new) op: op; leftHandSide: each; rightHandSide: rightHandSide.
			e isSeparable ifTrue: [l addAll: (e doSeparation)] ifFalse: [l add: e].
			].
		^ l
		]
	ifFalse: [
		rightHandSide isSeparable ifTrue: [
			|l|
			l := OrderedCollection new.
			list := rightHandSide doSeparation.
			list do: [:each| 
				|e|
				e := (KEBinaryExpression new) op: op; leftHandSide: leftHandSide; rightHandSide: each.
				e isSeparable ifTrue: [l addAll: (e doSeparation)] ifFalse: [l add: e].
				].
			^ l
			]
		ifFalse: [list := self doSeparation.]
		].
	^ list
]

{ #category : #testing }
KEBinaryExpression >> sign [

(op = #*) ifTrue: [^(rightHandSide sign) * (leftHandSide sign)] "ifFalse:[^0]" ifFalse: [^1]
"Modify ^1 for these cases with op = +, - for example: (A+B)*K"

]
