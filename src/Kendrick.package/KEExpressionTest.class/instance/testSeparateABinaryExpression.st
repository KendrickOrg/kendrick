tests
testSeparateABinaryExpression
	| s1 s2 s3 s4 s5 |
	s1 := 's=-(A+B+C)*E*D' parseAsAnEquation.
	s2 := 's=-(A+B)*(-C)' parseAsAnEquation.
	s3 := 's=(-E)*D*F*(A+B)' parseAsAnEquation.
	s4 := 's=(A+B)*(C+D)' parseAsAnEquation.
	self assert: 2 equals: (s2 expression separateExpression) size.
	self assert: 4 equals: (s4 expression separateExpression) size.
	self assert: 3 equals: (s1 expression separateExpression) size.
	self assert: 2 equals: (s3 expression separateExpression) size.