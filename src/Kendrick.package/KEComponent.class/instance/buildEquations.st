adding
buildEquations
	"Return the suitable array for KESimulatorDeterministic in order to solve the equations."

	| eq |
	eq := Dictionary new.
	self compartmentNames do: [ :k | eq at: k put: OrderedCollection new ].
	self transitions
		do: [ :tr | 
			"self addTransitions: tr IntoEquations: eq"
			(tr from at: #status) = #empty ifTrue:
			[ (eq at: tr to) add: (Array with: tr with: 1) ].
			(tr to at: #status) = #empty ifTrue:
			[ (eq at: tr from) add: (Array with: tr with: -1) ].
		(((tr from at: #status) ~= #empty) and: [ (tr to at: #status) ~= #empty ]) ifTrue:[
			(eq at: tr from) add: (Array with: tr with: -1).
			(eq at: tr to) add: (Array with: tr with: 1)
			]
			"Endof ThanhNT 3-Aug-2017" ].
	"ThanhNT 3-Aug-2017"
	^ eq