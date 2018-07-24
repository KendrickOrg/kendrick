Class {
	#name : #PPODEParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #'Kendrick-Tests-DSL-ODE'
}

{ #category : #accessing }
PPODEParserTest >> parserClass [
	^ PPODEParser
]

{ #category : #tests }
PPODEParserTest >> testParserAnExpression [
	|beta|
	"dsdt := self parserClass parse: 'S:t=-beta*S*I'."
	beta := 'exp(-d^2)' parseAsAnExpression.
	self assert: beta isExpressionWithMathFunction equals: true.
	self assert: (beta functionName) equals: #exp.
	self assert: (beta functionExpr) isBinaryExpression equals: true
]

{ #category : #tests }
PPODEParserTest >> testParserExpressionOfIndexOfIndexedVariable [
	|dsdt didt drdt|
	dsdt := 'S:t=-beta*S*I[i+1]' parseAsAnEquation.
	didt := 'I:t=beta*S*I[cos(t)]' parseAsAnEquation.
	drdt := 'R:t=gamma*I[i]' parseAsAnEquation.
	self assert: (dsdt expression rightHandSide isAnIndexedVariable) equals: true.
	self assert: (didt expression rightHandSide isAnIndexedVariable) equals: true.
	self assert: (drdt expression rightHandSide isAnIndexedVariable) equals: true.
	self assert: ((dsdt expression rightHandSide atIndex: 1) isBinaryExpression ) equals: true.
	self assert: ((didt expression rightHandSide atIndex: 1) isExpressionWithMathFunction) equals: true.
	self assert: ((drdt expression rightHandSide atIndex: 1) isAVariable) equals: true



]

{ #category : #tests }
PPODEParserTest >> testParserFunctionCos [
	|dsdt didt|
	dsdt := 'S:t=cos(2*t)' parseAsAnEquation.
	didt := 'I:t=beta*(1+betaAmp*cos(t))' parseAsAnEquation.
	self assert: (dsdt expression isExpressionWithMathFunction) equals: true.
	self assert: (dsdt expression functionName) equals: #cos.
	self assert: (didt expression rightHandSide rightHandSide rightHandSide isExpressionWithMathFunction) equals: true.
	self assert: (didt expression rightHandSide rightHandSide rightHandSide functionName) equals: #cos.
	"self assert: (dsdt expression evaluateWithModel: model) equals: (20 cos)."





]

{ #category : #tests }
PPODEParserTest >> testParserFunctionExp [
	|dsdt|
	dsdt := 'S:t=exp(2*t)' parseAsAnEquation.
	self assert: (dsdt expression isExpressionWithMathFunction) equals: true.
	self assert: (dsdt expression functionName) equals: #exp.





]

{ #category : #tests }
PPODEParserTest >> testParserFunctionLog [
	|dsdt|
	dsdt := 'S:t=log(2*t)*S' parseAsAnEquation.
	self assert: (dsdt expression leftHandSide isExpressionWithMathFunction) equals: true.
	self assert: (dsdt expression leftHandSide functionName) equals: #log.



]

{ #category : #tests }
PPODEParserTest >> testParserFunctionSin [
	|dsdt|
	dsdt := 'S:t=beta*S*I + sin(2*t)' parseAsAnEquation.
	self assert: (dsdt expression rightHandSide isExpressionWithMathFunction) equals: true.
	self assert: (dsdt expression rightHandSide functionName) equals: #sin
]

{ #category : #tests }
PPODEParserTest >> testParserFunctionSum [
	|dsdt|
	dsdt := 'beta=sum(j, beta[i][j]*sum(k, I[k]))' parseAsAnEquation.
	self assert: (dsdt expression) isExpressionWithSigmaMathFunction equals: true.
	self assert: (dsdt expression functionExpr rightHandSide) isExpressionWithSigmaMathFunction equals: true.
	self assert: (dsdt expression idVariable symbol) equals: #j
]

{ #category : #tests }
PPODEParserTest >> testParserIndexedVariable [
	|betaEquation|
	betaEquation := 'beta[i][j]=exp(-(i-j)^2/d)' parseAsAnEquation.
	self assert: (betaEquation variable isAnIndexedVariable) equals: true.
	self assert: (betaEquation variable symbol) equals: #beta.
	self assert: ((betaEquation variable atIndex: 1) symbol) equals: #i.
	self assert: ((betaEquation variable atIndex: 1) isAVariable) equals: true.
	self assert: ((betaEquation variable atIndex: 2) symbol) equals: #j

]

{ #category : #tests }
PPODEParserTest >> testParserVariable [
	|dsdt betaEqu|
	"dsdt := self parserClass parse: 'S:t=-beta*S*I'."
	dsdt := 'S:t=-beta*S*I' parseAsAnEquation.
	betaEqu := 'beta = exp(-d^2)' parseAsAnEquation.
	self assert: (dsdt variable symbol) equals: #S.
	self assert: (dsdt tVariable symbol) equals: #t.
	self assert: (betaEqu variable symbol) equals: #beta.
]
