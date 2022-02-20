Class {
	#name : #KEExpressionTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Examples-Core'
}

{ #category : #tests }
KEExpressionTest >> test3Plus7Is10 [
	<gtExample>
	<subjectClass: #KEExpressionTest>
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
	^m



]

{ #category : #tests }
KEExpressionTest >> testAddingExpressions [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| e1 e2 e3 |
	e1 := 'x' parseAsAnExpression.
	e2 := '1' parseAsAnExpression.
	e3 := 'u+v' parseAsAnExpression.

	self assert: e1 + e2 equals: 'x+1' parseAsAnExpression.
	self assert: e2 + e1 equals: '1+x' parseAsAnExpression.
	"At the moment, we test they have the same printString. We will need some equality between expression later."
	self
		assert: (e1 + e3) printString
		equals: 'x+u+v' parseAsAnExpression printString.
	self assert: e3 + e1 equals: 'u+v+x' parseAsAnExpression
]

{ #category : #tests }
KEExpressionTest >> testBuildABinaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
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
	self assert: e op equals: #+.
	^e

]

{ #category : #tests }
KEExpressionTest >> testCompare2NumericalsWithSameValue [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| a b |
	a := KENumerical number: 6.
	b := KENumerical number: 6.

	self assert: a equals: b.
	^a
]

{ #category : #tests }
KEExpressionTest >> testCompare2VariablesWithSameName [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| a b |
	a := KEVariable symbol: #S.
	b := KEVariable symbol: #S.

	self assert: a equals: b.
	^a
]

{ #category : #tests }
KEExpressionTest >> testIsSeparableForBinaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| s1 s2 s3 s4 s5 |
	s1 := 's=-(A+B+C)*E*D' parseAsAnEquation.
	s2 := 's=-(A+B)*(-C)' parseAsAnEquation.
	s3 := 's=(-E)*D*F*(A+B)' parseAsAnEquation.
	s4 := 's=-A*B' parseAsAnEquation.
	s5 := 's=(A+B)*(C+D)' parseAsAnEquation.
	self assert: s1 expression isSeparable.
	self assert: s2 expression isSeparable.
	self assert: s3 expression isSeparable.
	self deny: s4 expression isSeparable.
	self assert: s5 expression isSeparable.
]

{ #category : #tests }
KEExpressionTest >> testIsUnaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| beta minusBeta s betaS |
	beta := KEVariable symbol: #beta.
	minusBeta := KEUnaryExpression new op: #-.
	minusBeta expression: beta.

	s := KEVariable symbol: #S.

	betaS := KEBinaryExpression new op: #*.
	betaS rightHandSide: s.
	betaS leftHandSide: beta.

	self assert: minusBeta isUnaryExpression.
	self deny: betaS isUnaryExpression.
	^minusBeta 
]

{ #category : #tests }
KEExpressionTest >> testKENumberPrintAsNumber [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| n |
	n := KENumerical number: 10.
	self assert: n printString equals: '10'.
	^n
]

{ #category : #tests }
KEExpressionTest >> testKEVariablePrintAsItsName [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| beta |
	beta := KEVariable symbol: #beta.
	self assert:  beta printString equals: 'beta'.
	^beta 
]

{ #category : #tests }
KEExpressionTest >> testNegatedABinaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
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
	self assert: e negated op equals: #-.
	^e
]

{ #category : #tests }
KEExpressionTest >> testNormalizeAnUnaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| expr |
	expr := 'X:t = -(-A*(B+C))' parseAsAnEquation.
	self assert: expr expression isUnaryExpression.
	self deny: expr expression normalize isUnaryExpression.
	^expr
]

{ #category : #tests }
KEExpressionTest >> testNormalizeKEExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| e s beta minusBeta k minusS |
	e := KEBinaryExpression new.
	s := KEVariable symbol: #status -> #S.
	beta := KEVariable new symbol: #beta.
	minusS := KEUnaryExpression new op: #-.
	minusS expression: s.
	minusBeta := KEUnaryExpression new op: #-.
	minusBeta expression: beta.
	e
		op: #*;
		leftHandSide: s;
		rightHandSide: minusBeta.
	k := e normalize.
	self assert: k isUnaryExpression.
	e
		op: #*;
		leftHandSide: minusS;
		rightHandSide: minusBeta.
	k := e normalize.
	self deny: k isUnaryExpression.
	^e



]

{ #category : #tests }
KEExpressionTest >> testNormalizeReturnCorrectExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| expr result|
	
	expr := 'X:t=-(-A)' parseAsAnEquation.
	result := 'A' parseAsAnEquation.
	self assert: expr expression normalize equals: result normalize.
	
	expr := 'X:t=A+(-B)' parseAsAnEquation.
	result := '-B+A' parseAsAnEquation.
	self assert: expr expression normalize equals: result normalize.
	
	expr := 'X:t=(A*C)+-B*C' parseAsAnEquation.
	result := '-B*C+A*C' parseAsAnEquation.
	self assert: expr expression normalize equals: result normalize.
	
	expr := 'X:t=A*C*Z+-B*C' parseAsAnEquation.
	result := '-B*C+A*C*Z' parseAsAnEquation.
	self assert: expr expression normalize equals: result normalize. 
	
	expr := 'X:t = -(-A*(B+C))' parseAsAnEquation.
	result := 'A*(B+C)' parseAsAnEquation.
	self assert: expr expression normalize equals: result normalize.
	^expr
	
	
	
	 
]

{ #category : #tests }
KEExpressionTest >> testPrintABinaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| e a b |
	e := KEBinaryExpression new.
	a := KENumerical number: 3.
	b := KENumerical number: 4.
	e
		op: #+;
		leftHandSide: a;
		rightHandSide: b.

	self assert: e printString equals: '3+4'.
	^e
]

{ #category : #tests }
KEExpressionTest >> testPrintKEUnaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| beta minusBeta |
	beta := KEVariable symbol: #beta.
	minusBeta := KEUnaryExpression new
		             op: #-;
		             expression: beta.

	self assert: minusBeta printString equals: '-(beta)'.
	^beta 
]

{ #category : #tests }
KEExpressionTest >> testPrintUnaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>

	self assert: '-(A+B)' parseAsAnExpression printString equals: '-(A+B)'
]

{ #category : #tests }
KEExpressionTest >> testRemoveAVariableFromABinaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
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
				functionExpr: (KEVariable new symbol: #t)).
				
	^e
				
			
		
	
]

{ #category : #tests }
KEExpressionTest >> testRemoveAVariableFromANumber [
	"don't understand the meaning of this test"
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| e n |
	e := KENumerical new number: 200.
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: n equals: (KENumerical new number: 200).
	^e
]

{ #category : #tests }
KEExpressionTest >> testRemoveAVariableFromAVariable [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| e n |
	e := KEVariable new symbol: #S.
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: n equals: nil.
	^e
]

{ #category : #tests }
KEExpressionTest >> testRemoveAVariableFromAnUnaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| e n |
	e := KEUnaryExpression new
		     op: #-;
		     expression: (KEVariable new symbol: #S).
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: n isUnaryExpression equals: true.
	self assert: n expression equals: nil.

	e := KEUnaryExpression new
		     op: #-;
		     expression: (KEBinaryExpression new
				      op: #*;
				      leftHandSide: (KEVariable new symbol: #S);
				      rightHandSide: (KEVariable new symbol: #I)).
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: n isUnaryExpression equals: true.
	self assert: n expression equals: (KEVariable new symbol: #I).

	^e


]

{ #category : #tests }
KEExpressionTest >> testRemoveAVariableShouldNotModifyTheExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
   <expectedFailure>
	| e n |
	e := KEUnaryExpression new
		     op: #-;
		     expression: (KEVariable new symbol: #S).
	n := e removeVariable: (KEVariable new symbol: #S).
	self assert: e expression isNil equals: false.
	^e
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable1 [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| e n |
	e := KEVariable new symbol: #S.
	n := e removeIndexedVariable.
	self assert: n isAVariable.
	^e
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable2 [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| e n |
	e := KEIndexedVariable new symbol: #S.
	e addIndex: (KEVariable new symbol: #i).
	e addIndex: (KEVariable new symbol: #j).
	n := e removeIndexedVariable.
	self deny: n isAnIndexedVariable.
	self assert: n symbol equals: #S.
	^e
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable3 [
	<gtExample>
	<subjectClass: #KEExpressionTest>
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
	^e
	
	
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable4 [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	|e n|
	e := (KESigmaFunctionExpression new functionName: #sum).
	e functionExpr: (KEIndexedVariable new symbol: #S).
	e functionExpr addIndex: (KEVariable new symbol: #i).
	n := e removeIndexedVariable.
	self assert: n asString equals: 'S'.
	^e
	
	
	
]

{ #category : #tests }
KEExpressionTest >> testRemoveIndexedVariable5 [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	|e n|
	e := KEBinaryExpression new op: #*.
	e leftHandSide: (KEIndexedVariable new symbol: #S).
	e leftHandSide addIndex: (KEVariable new symbol: #i).
	e rightHandSide: (KEIndexedVariable new symbol: #beta).
	e rightHandSide addIndex: (KEBinaryExpression new op: #-;leftHandSide: (KEVariable new symbol: #i); rightHandSide: (KENumerical new number: 1)).
	self assert: e asString equals: 'S[i]*beta[i-1]'.
	n := e removeIndexedVariable.
	self assert: n asString equals: 'S*beta'.
	^e
	
	
	
]

{ #category : #tests }
KEExpressionTest >> testSeparateABinaryExpression [
	<gtExample>
	<subjectClass: #KEExpressionTest>
	| e1 e2 e3 e4 |
	e1 := '-(A+B+C)*E*D' parseAsAnExpression.
	e2 := '-(A+B)*(-C)' parseAsAnExpression.
	e3 := '(-E)*D*F*(A+B)' parseAsAnExpression.
	e4 := '(A+B)*(C+D)' parseAsAnExpression.
	self assert: e1 separateExpression size equals: 3.
	self assert: e2 separateExpression size equals: 2.
	self assert: e3 separateExpression size equals: 2.
	self assert: e4 separateExpression size equals: 4.
	^e1
	
]
