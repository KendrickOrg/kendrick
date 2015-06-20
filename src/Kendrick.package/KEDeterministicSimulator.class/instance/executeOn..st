as yet unclassified
executeOn: aModel
	|st ks|
	super executeOn:aModel.
	self equations.
	system := ExplicitSystem block: [ :x :t| |c i|
		c := Array new: (model population compartments size).
		i := 1.
		model population compartments keysDo: [ :k| model population compartments at: k put: (x at: i).
			i := i + 1 ].
		i := 1.
		model population compartments keysDo: [ :k| |tmp|
			tmp := ((equations at: k) collect: [ :e|
				|prob|
				"model parameters at: #scope put: (e at: 1) scope."
				(e at: 1) from = #empty 
				ifTrue: [ model parameters at: #inProcessingCompartment put: ((e at: 1) to) ] 
				ifFalse: [ model parameters at: #inProcessingCompartment put: ((e at: 1) from) ].
				prob := ((e at: 1) probability value: model) abs.
				"prob isDictionary ifTrue: [ prob := prob values sum ]."
				(e at: 2)*prob*(model atCompartment: (e at: 1) from)]) sum.
			c at: i put: tmp.
			i := i + 1
		 ].
		c
	].
	self stepper: ((Smalltalk at: self algorithm) onSystem: system).
	st := model population compartments values.
	ks := model population compartments keys.
	(tMin to: tMax by: step) do: [ :t| 
		self saveCompartmentsValueAtTime: t.
		model parameters at: #t put: t.
		st := stepper doStep: st time: t stepSize: step.
		1 to: ks size do: [ :i| model population compartments at: (ks at: i) put: (st at: i) ] ].
	