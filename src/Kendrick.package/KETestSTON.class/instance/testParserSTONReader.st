tests
testParserSTONReader
	| tmp1 tmp2 tmp3 tmp5 tmp6 |
	tmp2 := #(#S #I #R).
	tmp3 := Dictionary new.
	tmp2 isDictionary
		ifTrue: [ tmp6 := tmp2 ]
		ifFalse: [ | tmp7 |
			tmp1 := tmp2 readStream.
			tmp6 := Dictionary new.
			[ tmp7 := tmp1 next ] whileNotNil: [ tmp6 at: tmp7 put: 0 ] ].
	tmp6 keysAndValuesDo: [ :arg1 :arg2 | tmp3 at: arg1 put: arg2 ].
	self assert: (tmp3 at: 'S') isNotNil