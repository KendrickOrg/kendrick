"
Add a trait for Gillespie simulation engine. Models that are simulable by Gillespie engine should use this trait.
"
Trait {
	#name : #K2TGillespieSimulation,
	#category : #'Kendrick2-Automata-Core'
}

{ #category : #accessing }
K2TGillespieSimulation >> executeEventAtRateIndex: aNumber [

	self explicitRequirement
]

{ #category : #accessing }
K2TGillespieSimulation >> rates [

	self explicitRequirement
]

{ #category : #accessing }
K2TGillespieSimulation >> t: time [

	self explicitRequirement 
]
