private
operateBetween: left and: right
	"Created by ThanhNT 26/7/17"
	op = #+ ifTrue: [ ^(left + right) ].
	op = #- ifTrue: [ ^(left - right) ].
	op = #* ifTrue: [ ^(left * right) ].	
	op = #/ ifTrue: [ ^(left / right) ].
	op = #'^' ifTrue: [ ^(left raisedTo: right) ].
	^(left + right).