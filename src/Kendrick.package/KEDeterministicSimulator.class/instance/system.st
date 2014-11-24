as yet unclassified
system
	system ifNil: [ 
		|equations|
		equations := Dictionary new.
	   model compartments keys do: [ :k|
			|eq|
			eq := OrderedCollection new.
			equations at: k put: eq
			 ].
		model transitions do: [ :tr|
			tr from = #empty ifTrue:
				[ (equations at: tr to) add: (Array with: tr with: 1) ].
			tr to = #empty ifTrue:
				[ (equations at: tr from) add: (Array with: tr with: -1) ].
			((tr from ~= #empty) and: [ tr to ~= #empty ]) ifTrue:[ 
				(equations at: tr from) add: (Array with: tr with: -1).
				(equations at: tr to) add: (Array with: tr with: 1) ]
			 ].
		system := ExplicitSystem block: [ :x :t| |c i|
			c := Array new: (model compartments size).
			i := 1.
			model compartments keysDo: [ :k| |tmp|
				tmp := ((equations at: k) collect: [ :e|
					(e at: 2)*((e at: 1) probability 
												value: (model atCompartment: (e at: 1) from)
												value: (model atCompartment: (e at: 1) to)
												value: t) ]) sum.
				c at: i put: tmp.
				i := i + 1
				 ].
			c
			 ]
		 ].
	^ system