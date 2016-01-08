examples
modelRK4SolverOnMigrationOneSpeciesModel
	"self new exampleRK4SolverOnMigrationOneSpeciesModel"
	|model spatialConcern  SEIRSConcern|
	SEIRSConcern := self SEIRSConcern.
	spatialConcern := self spatialConcern.
	
	model := KEModel new.
	model population: (KEPopulation size: 5000).
	model integrate: spatialConcern.
	model integrate: SEIRSConcern.
	
	model atParameter: #beta assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #patch.
		c = 1 ifTrue: [ val := 0.75 ] ifFalse: [ val := 0.5 ].
		val	
	].
	model atParameter: #v assignValue: 0.00274.
	model atParameter: #mu assignValue: 0.0000365.
	model atParameter: #sigma assignValue: 0.5.
	model atParameter: #gamma assignValue: 0.25.
	model atParameter: #N assignValue: [ :aModel| |c| 
		c := aModel currentCompartment at: #patch.
		aModel sizeOfPopulation: c
		].
	model atParameter: #rho assignValue: 0.03. 
	model atParameter: #lambda assignValue: [ :aModel| |c|
		c := aModel currentCompartment at: #patch.
		(aModel atParameter: #beta) * (aModel atCompartment: {#status->#I. #patch->c}) / (aModel atParameter: #N)
	].
	model atCompartment: { #status->#S. #patch->1 } put: 900 atOthersPut: 0.
	model atCompartment: { #status->#I. #patch->1 } put: 100.
	model atCompartment: { #status->#S. #patch->2 } put: 1000.
	model atCompartment: { #status->#S. #patch->3 } put: 1000.
	model atCompartment: { #status->#S. #patch->4 } put: 1000.
	model atCompartment: { #status->#S. #patch->5 } put: 1000.
	
	^ model
	
	 
	
	 
	
	