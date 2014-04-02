tests
testParserFunctionCos
	|dsdt didt|
	dsdt := 'S:t=cos(2*t)' parseAsAnEquation.
	didt := 'I:t=beta*(1+betaAmp*cos(t))' parseAsAnEquation.
	self assert: (dsdt expression isMathExpression) equals: true.
	self assert: (dsdt expression function) equals: #cos.
	self assert: (didt expression rightHandSide rightHandSide rightHandSide isMathExpression) equals: true.
	self assert: (didt expression rightHandSide rightHandSide rightHandSide function) equals: #cos.
	"self assert: (dsdt expression evaluateWithModel: model) equals: (20 cos)."




