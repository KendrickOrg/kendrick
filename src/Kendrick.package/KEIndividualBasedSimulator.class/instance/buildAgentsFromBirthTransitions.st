as yet unclassified
buildAgentsFromBirthTransitions
	"Built new agents from birth transitions (transitions from #empty to a compartment)"

	"birthTransitions is a ordered collection of associations that represent transitions"

	birthTransitions
		do: [ :t | 
			| r p to from |
			to := t key to.
			from := t key from.
			model currentCompartment: to.
			r := (t key probability value: model) abs.
			r := r * (model atCompartment: from).
			p := (PoissonGenerator lambda: r * step) next.
			
			"Generate p agents"
			p timesRepeat: [ model population addIndividual: (KEIndividual from: to) ].

			"update the number of times this birth transition need to be executed, used in updateIndividuals"
			self transitionNbExecutions at: t value put: p ]