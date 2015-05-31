accessing
probability
	probability ifNil: [ probability := [ :m| (self rate evaluateWithModel: m) abs ] ].
	^ probability 