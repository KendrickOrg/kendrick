accessing
to: arg1
	| tmp1 |
	arg1 isDictionary
		ifTrue: [ ^ to := arg1 ].
	arg1 = #empty
		ifTrue: [ ^ self to: {(#status -> #empty)} ].
	arg1 isArray
		ifTrue: [ ^ to := Dictionary newFrom: arg1 ].
	(tmp1 := STONReader on: arg1 readStream) allowComplexMapKeys: true.
	^ to := tmp1 next