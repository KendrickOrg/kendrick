tests
testIsSeparableForBinaryExpression
	| s1 s2 s3 s4 s5 |
	s1 := 's=-(A+B+C)*E*D' parseAsAnEquation.
	s2 := 's=-(A+B)*(-C)' parseAsAnEquation.
	s3 := 's=(-E)*D*F*(A+B)' parseAsAnEquation.
	s4 := 's=-A*B' parseAsAnEquation.
	s5 := 's=(A+B)*(C+D)' parseAsAnEquation.
	self assert: true equals: s1 expression isSeparable.
	self assert: true equals: s2 expression isSeparable.
	self assert: true equals: s3 expression isSeparable.
	self assert: false equals: s4 expression isSeparable.
	self assert: true equals: s5 expression isSeparable.
	
	