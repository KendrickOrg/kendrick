as yet unclassified
execute
	|solver|
	solver := self solver.
	solver xn: tMax.
	solver x0: tMin.
	solver step: step.
	self buildData: (solver solve: model) with: (solver timeSeries)