as yet unclassified
testBuildABinaryExpression
	| t e a b o |
	t := FMTower new.
	t metamodel
		addSmalltalkClasses:
			(Array
				with: KEExpression
				with: KEBinaryExpression
				with: KESimpleExpression
				with: KENumerical
				with: KEOperator).
	e := (t metamodel elementNamed: 'KE.BinaryExpression') createInstance.
	a := (t metamodel elementNamed: 'KE.Numerical') createInstance.
	a value: 3.
	b := (t metamodel elementNamed: 'KE.Numerical') createInstance.
	b value: 7.
	o := (t metamodel elementNamed: 'KE.Operator') createInstance.
	o symbol: #+.
	e
		op: o;
		leftHandSide: a;
		rightHandSide: b.
	self assert: e op symbol equals: #+