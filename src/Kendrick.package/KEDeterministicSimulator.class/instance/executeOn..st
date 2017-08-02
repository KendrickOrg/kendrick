public
executeOn: aModel
	|st ks system |
	super executeOn:aModel.
	equations := model buildEquations.
	system := ExplicitSystem block: [ :x :t| |c i|
		c := Array new: (model population compartments size).
		i := 1.
		model population compartments keysDo: [ :k| model population compartments at: k put: (x at: i).
			i := i + 1 ].
		i := 1.
		model population compartments keysDo: [ :k| |tmp|
			(equations at: k) isEmpty 
			ifTrue: [ tmp := 0 ]
			ifFalse: [  
				|coll|

				"ThanhNT 31-July-2017"
				"tmp :="				
				coll :=
				((equations at: k) collect: [ :e|
				|prob p|
				"model parameters at: #scope put: (e at: 1) scope."
				(((e at: 1) from at: #status) = #empty) 
				ifTrue: [ model currentCompartment: ((e at: 1) to) ] 
				ifFalse: [ model currentCompartment: ((e at: 1) from) ].
				model nextCompartment: ((e at: 1) to).
				prob := ((e at: 1) probability value: model) abs.
				p := self project: prob into: k.
				"prob isDictionary ifTrue: [ prob := prob values sum ]."
				"ThanhNT 30-July-2017"
				self calculateBetween: (e at: 2) 
							with: (model atCompartment: (e at: 1) from) 
							and: p   project: k.
				"(e at: 2)*(model atCompartment: (e at: 1) from)*prob"
				"Endof ThanhNT 30-July-2017"
				]).
				tmp := self sum: coll 
				"sum"
				"Endof ThanhNT 31-July-2017"
				.
			].
			c at: i put: tmp.
			i := i + 1
		 ].
		c
	].
	self stepper: ((Smalltalk at: self solver) onSystem: system).
	st := model population compartments values.
	ks := model population compartments keys.
	(tMin to: tMax by: step) do: [ :t| 
		self saveCompartmentsValueAtTime: t.
		model t: t.
		st := stepper doStep: st time: t stepSize: step.
		1 to: ks size do: [ :i| model population compartments at: (ks at: i) put: (st at: i) ] ].