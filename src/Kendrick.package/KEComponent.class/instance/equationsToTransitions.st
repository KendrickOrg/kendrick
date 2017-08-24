utilities
equationsToTransitions
	"events := KEEventGenerator from: self."
	transitions := KETransitionGenerator from: self.

	"why resetting the equations ?"
	equations := OrderedCollection new