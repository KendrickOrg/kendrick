as yet unclassified
buildAgentsFromBirthTransitions
	"Built new agents from birth transitions (transitions from #empty to a compartment)"

	"birthTransitions is a ordered collection of associations that represent transitions"

	| additionalAssoc |
	"additionalTrans is an array which are generated from birthTransitions"
	"The new association has from/to keys are status and species"
	additionalAssoc := OrderedCollection new.
	birthTransitions
		do: [ :each | 
			(self checkAssociation: each)
				ifTrue: [ additionalAssoc add: each ]
				ifFalse: [ additionalAssoc addAll: (self createMoreAssociations: each) ] ].
	additionalAssoc
		do: [ :t | 
			| r p to from rate comp c|
			to := t key to.
			from := t key from.
			model currentCompartment: to.
			r := (t key probability value: model) abs.
			(r isNumber)
				ifTrue: [ rate := r ].
			(r isArray)
				ifTrue: [ rate := self project: r into: from ].
			c := (model atCompartment: from).
			(c isNumber) ifTrue: [ comp := c ].
			(c isArray) ifTrue: [ comp := self project: c into: from ].
			rate := rate * comp.
			p := (PoissonGenerator lambda: rate * step) next.

			"Generate p agents"
			p timesRepeat: [ model population addIndividual: (KEIndividual from: to) ].

			"update the number of times this birth transition need to be executed, used in updateIndividuals"
			self transitionNbExecutions at: t value put: p ]