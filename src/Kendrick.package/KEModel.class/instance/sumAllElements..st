as yet unclassified
sumAllElements: anArray
	"Created by ThanhNT 18/7"
	"Purpose: Calculate all elements of an Array"
	"Example:"
	"self new sumAllElements: #(#(500 4990)#(500 5000)#(500 5000)#(500 5000)#(500 5000))"
	|total|
	total := 0.
	anArray isArray 
		ifTrue: [ anArray do: [ :each| total := total + (self sumAllElements: each) ] ]
		ifFalse: [ 
			anArray isNumber ifTrue: [ ^anArray]. 
			^0.
			 ].
	^total.