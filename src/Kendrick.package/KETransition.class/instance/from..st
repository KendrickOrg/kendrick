accessing
from: arg1
	| tmp1 |
	arg1 isDictionary
		ifTrue: [ ^ from := arg1 ].
	arg1 = #empty
		ifTrue: [ ^ self from: {(#status -> #empty)} ].
	arg1 isArray
		ifTrue: [ ^ from := Dictionary newFrom: arg1 ].
	(tmp1 := STONReader on: arg1 readStream) allowComplexMapKeys: true.
	^ from := tmp1 next