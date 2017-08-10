private
addMoreTransitionsFrom: tr IntoEquations: eq
	|trs|
	trs := self createMoreTransitions: tr.
	trs do: [ 
		:each|
		self addTransitions: each IntoEquations: eq.
		 ].