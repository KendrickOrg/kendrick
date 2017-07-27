tests
testEventsWithOppositeRate
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp7 tmp8 tmp9 |
	tmp1 := KEEvent new.
	tmp2 := KEEvent new.
	tmp4 := KEVariable new symbol: #S.
	tmp5 := KEVariable new symbol: #I.
	tmp6 := KEVariable new symbol: #beta.
	tmp7 := KEUnaryExpression new.
	tmp3 := KEBinaryExpression new.
	tmp3
		op: #*;
		leftHandSide: tmp4;
		rightHandSide: tmp5.
	tmp8 := KEBinaryExpression new.
	tmp8
		op: #*;
		leftHandSide: tmp6;
		rightHandSide: tmp3.
	tmp7
		op: #-;
		expression: tmp8.
	tmp1 rate: tmp7 normalize.
	tmp2 rate: tmp8 normalize.
	tmp9 := OrderedCollection new.
	tmp9 add: tmp1.
	self assert: true equals: (tmp2 hasAnEventWithOppositeRateIn: tmp9)