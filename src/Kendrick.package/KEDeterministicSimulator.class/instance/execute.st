as yet unclassified
execute
	|solver|
	algorithm = #RK4 ifTrue: [
		solver := RK4Solver new.
		solver xn: tMax.
		solver x0: tMin.
		solver step: step.
		data := solver solve: model.
		].
	^ data
	