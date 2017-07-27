private
operateBetween: arg1 and: arg2
	op = #+
		ifTrue: [ ^ arg1 + arg2 ].
	op = #-
		ifTrue: [ ^ arg1 - arg2 ].
	op = #*
		ifTrue: [ ^ arg1 * arg2 ].
	op = #/
		ifTrue: [ ^ arg1 / arg2 ].
	op = #'^'
		ifTrue: [ ^ arg1 raisedTo: arg2 ].
	^ arg1 + arg2