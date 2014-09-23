as yet unclassified
execute
	|solver|
	super execute.
	solver := self solver.
	solver xn: tMax.
	solver x0: tMin.
	solver step: step.
	self buildData: (solver solve: model) with: (solver timeSeries)