as yet unclassified
operate: op between: left and: right
	op = #+ ifTrue: [ ^(left + right) ].
	op = #- ifTrue: [ ^(left - right) ].
	op = #* ifTrue: [ ^(left * right) ].	
	op = #/ ifTrue: [ ^(left / right) ].
	^(left + right).