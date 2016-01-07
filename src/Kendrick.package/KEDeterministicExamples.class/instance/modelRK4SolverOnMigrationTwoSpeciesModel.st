examples
modelRK4SolverOnMigrationTwoSpeciesModel
	"self new exampleRK4SolverOnMigrationTwoSpeciesModel"
	|model spatialConcern  SEIRSConcern multihostConcern|
	spatialConcern := self SpatialConcern.
	SEIRSConcern := self SEIRSConcern.
	multihostConcern := self MultiHostConcern.
	
	model := KEModel new population: (KEPopulation size: 27500).
	model integrate: spatialConcern.
	model integrate: SEIRSConcern.
	model integrate: multihostConcern.
	
	model atParameter: #beta assignValue: 1.
	model atParameter: #mu assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.0000365 ].
		c = #bird ifTrue: [ val := 0.00137 ].
		val ].
	model atParameter: #sigma assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.5 ].
		c = #bird ifTrue: [ val := 0.67 ].
		val ].
	model atParameter: #gamma assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.25 ].
		c = #bird ifTrue: [ val := 0.233 ].
		val ].
	model atParameter: #v assignValue: 0.00274.
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := OrderedCollection new.
		c add: (aModel currentCompartment at: #patch).
		c add: (aModel currentCompartment at: #species).
		aModel sizeOfPopulation: (c asArray)
	].
	model atParameter: #rho assignValue: [ :aModel| |c val|
		c := aModel currentCompartment at: #species.
		c = #bird ifTrue: [ val := 0.1 ].
		c = #human ifTrue: [ val := 0.03 ].
		val
	].
	model addParameter: #delta value: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := #(0 0.21) ].
		c = #bird ifTrue: [ val := #(0 0.42) ].
		val
	]. 
	model atParameter: #lambda assignValue: [ :aModel| |c|
		c := aModel currentCompartment at: #patch.
		((aModel atParameter: #beta) *
		(aModel atParameter: #delta) *
		(aModel atCompartment: {#status->#I. #patch->c}) / (aModel atParameter: #N)) sum.
	].
	model 
		atCompartment: { #status->#S. #species->#bird. #patch->1 } 
		put: 4990
		atOthersPut: 0.
	model 
		atCompartment: { #status->#I. #species->#bird. #patch->1 } 
		put: 10.
	2 to: 5 do: [ :i| 
		model 
			atCompartment: { #status->#S. #species->#bird. #patch->i } 
			put: 5000.
	].
	1 to: 5 do: [ :i| 
		model 
			atCompartment: { #status->#S. #species->#human. #patch->i } 
			put: 500 
	].

	^ model
	
	 
	
	