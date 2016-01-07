examples
SpatialConcern
	"self new exampleRK4SolverOnMigrationMultiSpeciesModel"
	| spatialConcern|
	spatialConcern := KEConcern new.
	spatialConcern addAttribute: #patch value: (1 to: 5) asArray.
	spatialConcern addParameter: #rho.
	spatialConcern 
		addTransitionFrom: { #patch->1 } 
		to: { #patch->2 } 
		probability: [ :aModel| aModel atParameter: #rho ].
	spatialConcern 
		addTransitionFrom: { #patch->2 } 
		to: { #patch->3 } 
		probability: [ :aModel| aModel atParameter: #rho ].
	spatialConcern 
		addTransitionFrom: { #patch->3 } 
		to: { #patch->4 } 
		probability: [ :aModel| aModel atParameter: #rho ].
	spatialConcern 
		addTransitionFrom: { #patch->4 } 
		to: { #patch->5 } 
		probability: [ :aModel| aModel atParameter: #rho ].
	spatialConcern 
		addTransitionFrom: { #patch->5 } 
		to: { #patch->1 } 
		probability: [ :aModel| aModel atParameter: #rho ].
	
	^ spatialConcern 
	
	 
	
	