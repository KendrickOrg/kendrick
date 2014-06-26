as yet unclassified
execute
	|solver|
	solver := RK4Solver new.
	solver xn: tMax.
	solver x0: tMin.
	solver step: step.
	data := solver solve: model.
	^ solver nbOfIterations