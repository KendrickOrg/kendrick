Class {
	#name : #KEExpressionTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEExpressionTest >> test3Plus7Is10 [
	| e a b o m |
	
	m := KEModel new.
	e := KEBinaryExpression new.
	a := KENumerical new.
	a number: 3.
	b := KENumerical new.
	b number: 7.
	o := #+.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: (e evaluateWithModel: m) equals: 10.
]

{ #category : #tests }
KEExpressionTest >> testBuildABinaryExpression [
	| e a b o |
	
	e := KEBinaryExpression new.
	a := KENumerical new.
	a number: 3.
	b := KENumerical new.
	b number: 7.
	o := #+.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: e op equals: #+
]

{ #category : #tests }
KEExpressionTest >> testCompare2NumericalsWithSameValue [

| a b |
a := KENumerical number:6.
b := KENumerical number:6.

self assert:true equals: (a = b)
	
]

{ #category : #tests }
KEExpressionTest >> testCompare2VariablesWithSameName [

| a b |
a := KEVariable symbol: #S.
b := KEVariable symbol: #S.

self assert:true equals: (a = b)
]

{ #category : #tests }
KEExpressionTest >> testIsSeparableForBinaryExpression [
	| s1 s2 s3 s4 s5 |
	s1 := 's=-(A+B+C)*E*D' parseAsAnEquation.
	s2 := 's=-(A+B)*(-C)' parseAsAnEquation.
	s3 := 's=(-E)*D*F*(A+B)' parseAsAnEquation.
	s4 := 's=-A*B' parseAsAnEquation.
	s5 := 's=(A+B)*(C+D)' parseAsAnEquation.
	self assert: s1 expression isSeparable equals: true.
	self assert: s2 expression isSeparable equals: true.
	self assert:   s3 expression isSeparable equals: true.
	self assert:  s4 expression isSeparable equals: false.
	self
		assert: s5 expression isSeparable
		equals: true
		
]

{ #category : #tests }
KEExpressionTest >> testIsUnaryExpression [
	| beta minusBeta s betaS |
	
	beta := KEVariable symbol: #beta.
	minusBeta := (KEUnaryExpression new) op:#-.
	minusBeta expression: beta.
	
	s := KEVariable symbol: #S.
	
	betaS := (KEBinaryExpression new) op:#*.
	betaS rightHandSide: s.
	betaS leftHandSide: beta.
	
	self assert: true equals: minusBeta isUnaryExpression.
	self assert: false equals: betaS isUnaryExpression.
]

{ #category : #tests }
KEExpressionTest >> testKENumberPrintAsNumber [

|n|
n := KENumerical number: 10.
self assert: '10' equals: n asString.
]

{ #category : #tests }
KEExpressionTest >> testKEVariablePrintAsItsName [

|beta|
beta := KEVariable symbol:#beta.
self assert: 'beta' equals: beta asString.
]

{ #category : #tests }
KEExpressionTest >> testNegatedABinaryExpression [
	| e a b o |
	
	e := KEBinaryExpression new.
	a := KENumerical new.
	a number: 3.
	b := KENumerical new.
	b number: 7.
	o := #+.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: e negated op equals: #-
]

{ #category : #tests }
KEExpressionTest >> testNormalizeAnUnaryExpression [
	| expr |
	
	expr := 's=-(-A*(B+C))' parseAsAnEquation.
	self assert: true equals: expr expression isUnaryExpression.
	self assert: false equals: expr expression normalize isUnaryExpression.
	
]

{ #category : #tests }
KEExpressionTest >> testNormalizeKEExpression [
	| e s beta minusBeta k minusS |
	
	e := KEBinaryExpression new.
	s := KEVariable symbol: #S.
	beta := KEVariable new symbol: #beta.
	minusS := (KEUnaryExpression new) op:#-.
	minusS expression: s.
	minusBeta := (KEUnaryExpression new) op:#-.
	minusBeta expression: beta.
	
	e
		op: #*;
		leftHandSide: s;
		rightHandSide: minusBeta.	
	k := e normalize.
	self assert: true equals: (k isUnaryExpression).
	e
		op: #*;
		leftHandSide: minusS ;
		rightHandSide: minusBeta.
	k := e normalize.
	self assert: false equals: (k isUnaryExpression)
	
	
]

{ #category : #tests }
KEExpressionTest >> testPrintABinaryExpression [
	| e a b |
	
	e := KEBinaryExpression new.
	a := KENumerical number:3.
	b := KENumerical number:4.
	e
		op: #+;
		leftHandSide: a;
		rightHandSide: b.

	self assert: '3+4' equals: e asString
]

{ #category : #tests }
KEExpressionTest >> testPrintKEUnaryExpression [

|beta minusBeta|

beta := KEVariable symbol:#beta.
minusBeta := KEUnaryExpression op:#-.
minusBeta expression: beta.

self assert: '-beta' equals: minusBeta asString.
]

{ #category : #tests }
KEExpressionTest >> testRemoveAVariableFromABinaryExpression [
	| e n |
	e := KEBinaryExpression new
		op: #*;
		leftHandSide: (KEVariable new symbol: #S);
		rightHandSide:
			(KEMathFunctionExpression new
				functionName: #cos;
				functionExpr: (KEVariable new symbol: #t)).
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: n isExpressionWithMathFunction equals: true.
	self
		assert: n
		equals:
			(KEMathFunctionExpression new
				functionName: #cos;
				functionExpr: (KEVariable new symbol: #t))
]

{ #category : #tests }
KEExpressionTest >> testRemoveAVariableFromANumber [
	"don't understand the meaning of this test"

	| e n |
	e := KENumerical new number: 200.
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: n equals: (KENumerical new number: 200)
]

{ #category : #tests }
KEExpressionTest >> testRemoveAVariableFromAVariable [
	| e n |
	e := KEVariable new symbol: #S.
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: n equals: nil
]

{ #category : #tests }
KEExpressionTest >> testRemoveAVariableFromAnUnaryExpression [
	| e n |
	e := KEUnaryExpression new
		op: #-;
		expression: (KEVariable new symbol: #S).
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: n isUnaryExpression equals: true.
	self assert: n expression equals: nil.
	e := KEUnaryExpression new
		op: #-;
		expression:
			(KEBinaryExpression new
				op: #*;
				leftHandSide: (KEVariable new symbol: #S);
				rightHandSide: (KEVariable new symbol: #I)).
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: n isUnaryExpression equals: true.
	self assert: n expression equals: (KEVariable new symbol: #I)
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable1 [
	|e n|
	e := (KEVariable new symbol: #S).
	n := e removeIndexedVariable.
	self assert: n isAVariable equals: true.
	
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable2 [
	|e n|
	e := (KEIndexedVariable new symbol: #S).
	e addIndex: (KEVariable new symbol: #i).
	e addIndex: (KEVariable new symbol: #j).
	n := e removeIndexedVariable.
	self assert: n isAnIndexedVariable equals: false.
	self assert: n symbol equals: #S.
	
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable3 [
	|e f n|
	e := (KEMathFunctionExpression new functionName: #cos).
	e functionExpr: (KEVariable new symbol: #t).
	f := e copy.
	f functionExpr: (KEIndexedVariable new symbol: #S).
	f functionExpr addIndex: (KEVariable new symbol: #i).
	n := e removeIndexedVariable.
	self assert: n asString equals: 'cos(t)'.
	self assert: f asString equals: 'cos(S[i])'.
	self assert: f removeIndexedVariable asString equals: 'cos(S)'.
	
	
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable4 [
	|e n|
	e := (KESigmaFunctionExpression new functionName: #sum).
	e functionExpr: (KEIndexedVariable new symbol: #S).
	e functionExpr addIndex: (KEVariable new symbol: #i).
	n := e removeIndexedVariable.
	self assert: n asString equals: 'S'.
	
	
	
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable5 [
	|e n|
	e := KEBinaryExpression new op: #*.
	e leftHandSide: (KEIndexedVariable new symbol: #S).
	e leftHandSide addIndex: (KEVariable new symbol: #i).
	e rightHandSide: (KEIndexedVariable new symbol: #beta).
	e rightHandSide addIndex: (KEBinaryExpression new op: #-;leftHandSide: (KEVariable new symbol: #i); rightHandSide: (KENumerical new number: 1)).
	self assert: e asString equals: 'S[i]*beta[i-1]'.
	n := e removeIndexedVariable.
	self assert: n asString equals: 'S*beta'.
	
	
	
]

{ #category : #tests }
KEExpressionTest >> testSeparateABinaryExpression [
	| s1 s2 s3 s4 |
	s1 := 's=-(A+B+C)*E*D' parseAsAnEquation.
	s2 := 's=-(A+B)*(-C)' parseAsAnEquation.
	s3 := 's=(-E)*D*F*(A+B)' parseAsAnEquation.
	s4 := 's=(A+B)*(C+D)' parseAsAnEquation.
	self assert: 2 equals: (s2 expression separateExpression) size.
	self assert: 4 equals: (s4 expression separateExpression) size.
	self assert: 3 equals: (s1 expression separateExpression) size.
	self assert: 2 equals: (s3 expression separateExpression) size.
]
