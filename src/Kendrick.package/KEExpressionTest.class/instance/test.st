as yet unclassified
test
	| t e a b |
	t := FMTower new.
	t metamodel
		addSmalltalkClasses:
			(Array
				with: KEExpression
				with: KESimpleExpression
				with: KENumerical
				with: KEBinaryExpression).
	e := (t metamodel elementNamed: 'KE.BinaryExpression') createInstance.
	a := (t metamodel elementNamed: 'KE.Numerical') createInstance.
	a value: 3.
	b := (t metamodel elementNamed: 'KE.Numerical') createInstance.
	b value: 7.
	e
		op: #+;
		leftHandSide: a;
		rightHandSide: b.
	e