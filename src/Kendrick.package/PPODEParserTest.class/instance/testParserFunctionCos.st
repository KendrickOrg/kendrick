tests
testParserFunctionCos
	|dsdt didt|
	dsdt := 'S:t=cos(2*t)' parseAsAnEquation.
	didt := 'I:t=beta*(1+betaAmp*cos(t))' parseAsAnEquation.
	self assert: (dsdt expression isExpressionWithMathFunction) equals: true.
	self assert: (dsdt expression functionName) equals: #cos.
	self assert: (didt expression rightHandSide rightHandSide rightHandSide isExpressionWithMathFunction) equals: true.
	self assert: (didt expression rightHandSide rightHandSide rightHandSide functionName) equals: #cos.
	"self assert: (dsdt expression evaluateWithModel: model) equals: (20 cos)."




