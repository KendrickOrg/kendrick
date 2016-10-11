as yet unclassified
map: anArray

	"assume composite"
	
	| tSeries tokens computedCompartments compositeCompartments attribute |
	explicitDataSet := true.
	
	tSeries := OrderedCollection new.
	attribute := anArray first.
	
	computedCompartments := (anArray second findTokens: '_') collect: [:token | (simulation model allLiteralTransitionRefsForAttribute: token)]. 

	compositeCompartments := self expand: #() forLists: computedCompartments.

	self buildMapFrom: attribute given: compositeCompartments.	
	
	tSeries := compositeCompartments 
		collect: [:compartment | (simulation timeSeriesAt: compartment) first]. 
	
	(#(sum sqrt size log peakOfEpidemic) includes: anArray last) ifTrue: [  
			tSeries := tSeries collect: [ :ts | ts perform: anArray last ].
	].
	
"		anArray do: [:name | 
				tokens := name findTokens: '_'.
				
					(simulation model allTransitionRefsForAttribute: tokens second) do: [:comp |  
						|compositeCompartment|
						compositeCompartment 
							:= (simulation model transitionRefFor: tokens first) allButLast.
						compositeCompartment := compositeCompartment , ' , ' , comp allButFirst.
						tSeries add: (self sumOverTimeSeries: compositeCompartment).			
					]	
				]."

	^ diag data: tSeries.
	
	