as yet unclassified
testName
	| t v |
	t := FMTower new.
	t metamodel addSmalltalkClasses: (Array with: KEExpression with:KESimpleExpression with:KEVariable with: KEOperator).
	v := (t metamodel elementNamed: 'KE.Variable') createInstance.
	v name: 'v'.
	self assert: v name equals: 'v'