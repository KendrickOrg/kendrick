as yet unclassified
executeOn: aModel
	|st ks|
	self model: aModel.
	self equations.
	system := ExplicitSystem block: [ :x :t| |c i|
		c := Array new: (model compartments size).
		i := 1.
		model compartments keysDo: [ :k| model compartments at: k put: (x at: i).
			i := i + 1 ].
		i := 1.
		model compartments keysDo: [ :k| |tmp|
			tmp := ((equations at: k) collect: [ :e|
				|prob|
				prob := ((e at: 1) probability value: model).
				prob isDictionary ifTrue: [ prob := prob values sum ].
				(e at: 2)*prob*(model atCompartment: (e at: 1) from)]) sum.
			c at: i put: tmp.
			i := i + 1
		 ].
		c
	].
	self stepper: ((Smalltalk at: self algorithm) onSystem: system).
	st := model compartments values.
	ks := model compartments keys.
	(tMin to: tMax by: step) do: [ :t|
		model addParameter: #t value: t.
		st := stepper doStep: st time: t stepSize: step.
		1 to: ks size do: [ :i| model compartments at: (ks at: i) put: (st at: i) ].
		self updateDataAt: t
		 ]