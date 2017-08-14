adding
buildEquations
	"Return the suitable array for KESimulatorDeterministic in order to solve the equations."
	"This method should be merge with equations method in the same class: issue #40"

	| eq |
	eq := Dictionary new.
	self compartmentNames do: [ :k| eq at: k put: OrderedCollection new ].
	self transitions do: [ :tr|
		(tr from at: #status) = #empty ifTrue:
			[ (eq at: tr to) add: (Array with: tr with: 1) ].
		(tr to at: #status) = #empty ifTrue:
			[ (eq at: tr from) add: (Array with: tr with: -1) ].
		(((tr from at: #status) ~= #empty) and: [ (tr to at: #status) ~= #empty ]) ifTrue:[ 
			"ThanhNT 28/7/2017"
			"Set the following statements to comment because they can not"
			"handle the case multi-concerns with Indexed Equations"
			"For more details, run exampleRK4SolverOnSIRDemoMultiConcerns"
			" of KEIndexedVariableTest"
			"(eq at: tr from) add: (Array with: tr with: -1).
			(eq at: tr to) add: (Array with: tr with: 1)"
			self addTransitions: tr IntoEquations: eq.
			"Endof ThanhNT 28/7/2017"
			]
		 ].
	^eq