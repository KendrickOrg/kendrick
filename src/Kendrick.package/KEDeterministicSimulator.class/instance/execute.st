as yet unclassified
execute
	|solver|
	solver := self solver.
	solver xn: tMax.
	solver x0: tMin.
	solver step: step.
	data := solver solve: model.
	^ solver nbOfIterations