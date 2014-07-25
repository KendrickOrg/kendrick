meta
passType: type
	"Add other algorithms following 3 categories: Deterministic | Stochastic | IBM"
	((type = #IBMDiscreteTime) | (type = #IBMDiscreteSpace)) ifTrue: [ ^ KEIndividualBasedSimulator ].
	(type = #RK4) ifTrue: [ ^ KEDeterministicSimulator ].
	((type = #GillespieDirect) | (type = #ExplicitTauLeap) | (type = #AdaptiveTauLeap)) ifTrue: [ ^ KEStochasticSimulator ].