tests-as yet unclassified
spatialConcern
	| spatialConcern|
	spatialConcern := KEModelPart new.
	spatialConcern addAttribute: #patch value: (1 to: 5) asArray.
	spatialConcern addParameter: #rho.
	(1 to: 5) do: [ :i| 
		(i < 5) 
		ifTrue: [  
			spatialConcern 
				addTransitionFrom: { #patch->i } 
				to: { #patch->(i+1) } 
				probability: [ :aModel| aModel atParameter: #rho ].
		]
		ifFalse: [  
			spatialConcern 
				addTransitionFrom: { #patch->i } 
				to: { #patch->1 } 
				probability: [ :aModel| aModel atParameter: #rho ].
		]
	]. 
	
	^ spatialConcern 