as yet unclassified
execute
	|solver|
	algorithm = #RK4 ifTrue: [
		solver := RungeKuttaSolver new.
		solver finalValueOfX: tMax.
		solver initialValueOfX: tMin.
		solver stepSize: step.
		data := solver solver: model.
		].
	^ data
	