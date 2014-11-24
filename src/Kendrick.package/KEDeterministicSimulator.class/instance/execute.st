as yet unclassified
execute
	"|solver|
	solver := self solver.
	solver xn: tMax.
	solver x0: tMin.
	solver step: step.
	self buildData: (solver solve: model) with: (solver timeSeries)"
	|st ks|
	st := model compartments values.
	ks := model compartments keys.
	(tMin to: tMax by: step) do: [ :t|
		st := stepper doStep: st time: t stepSize: step.
		1 to: ks size do: [ :i| model compartments at: (ks at: i) put: (st at: i) ].
		self updateDataAt: t
		 ]