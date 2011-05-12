as yet unclassified
testName
	| t v |
	t := FMTower new.
	t metamodel addSmalltalkClasses: (Array with: KEVariable).
	v := (t metamodel elementNamed: 'KE.Variable') createInstance.
	v name: 'v'.
	self assert: v name equals: 'v'