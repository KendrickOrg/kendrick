as yet unclassified
before
|model SEIRSConcern simulator multiHostConcern spatialConcern quarantineConcern map|
model := KEModel new.
model population: (KEPopulation size: 27500).

SEIRSConcern := KEModelPart new.
SEIRSConcern addAttribute: #status value: #(S E I R).
SEIRSConcern addParameters: { #beta. #gamma. #mu. #sigma. #nu }.
SEIRSConcern addParameter: #lambda value: 'beta*I/N'.
SEIRSConcern
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #E}'
		probability: [ :aModel | 
			(aModel atParameter: #lambda) ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #E}' 
		to: '{#status: #I}' 
		probability: [ :aModel | aModel atParameter: #sigma ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #I}' 
		to: '{#status: #R}' 
		probability: [ :aModel | aModel atParameter: #gamma ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #R}' 
		to: '{#status: #S}' 
		probability: [ :aModel | aModel atParameter: #nu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #S}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #I}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #R}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #E}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: #empty 
		to: '{#status: #S}' 
		probability: [ :aModel | aModel atParameter: #mu ].
		
multiHostConcern := KEModelPart new.
multiHostConcern addAttribute: #species value: #(#human #bird).

map := KEMapBuilder new.
map countries: #(#MyanmarBurma #Cambodia #Laos #Thailand #Vietnam).
map routesFrom: #Thailand toAll: #(#Cambodia).
map routesFrom: #Cambodia toAll: #(#Vietnam).
map routesFrom: #Vietnam toAll: #(#Laos).
map routesFrom: #Laos toAll: #(#MyanmarBurma).
map routesFrom: #MyanmarBurma toAll: #(#Thailand).

spatialConcern := KEModelPart new.
spatialConcern addAttribute: #country value: map countries.
spatialConcern addParameter: #rho.
spatialConcern transitions: (map routesToTransitions: 'rho').
 
quarantineConcern := KEModelPart dependOn: SEIRSConcern.
quarantineConcern addStatus: #(Q).
quarantineConcern 
	addTransitionFrom: { #status->#I } 
	to: { #status->#Q } 
	probability: 'delta'.
quarantineConcern 
	addTransitionFrom: { #status->#Q } 
	to: { #status->#R } 
	probability: 'epsilon'.
quarantineConcern 
	addTransitionFrom: { #status->#Q } 
	to: #empty 
	probability: 'mu'.
quarantineConcern addParameters: { #delta. #epsilon }.
quarantineConcern addParameter: #lambda value: 'beta*I/(N-Q)'.

model integrate: SEIRSConcern.
model integrate: multiHostConcern.
model integrate: spatialConcern.
model integrate: quarantineConcern.

model atParameter: #mu assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.000365 ].
		c = #bird ifTrue: [ val := 0.00137 ].
		val ].
model addParameter: #beta value: [ :aModel| |s c val| 
		s := aModel currentCompartment at: #species.
		c := aModel currentCompartment at: #country.
		s = #human ifTrue: [ val := #(0 0.21) ].
		s = #bird ifTrue: [ 
			c = #Thailand ifTrue: [ val := #(0 0.42) ] ifFalse: [ val := #(0 0.28) ]
			 ].
		val
	]. 
model atParameter: #gamma assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.25 ].
		c = #bird ifTrue: [ val := 0.233 ].
		val ].
model atParameter: #sigma assignValue: [ :aModel| |c val| 
		c := aModel currentCompartment at: #species.
		c = #human ifTrue: [ val := 0.5 ].
		c = #bird ifTrue: [ val := 0.67 ].
		val ].
model atParameter: #nu assignValue: 0.00274.
model atParameter: #N assignValue: [ :aModel| |c| 
		c := OrderedCollection new.
		c add: (aModel currentCompartment at: #country).
		c add: (aModel currentCompartment at: #species).
		aModel sizeOfPopulation: (c asArray)
	].
model atParameter: #lambda assignValue: [ :aModel| |c|
      c := aModel currentCompartment at: #country.
      ((aModel atParameter: #beta) *
        (aModel atCompartment: {#status->#I. #country->c}) / ((aModel atParameter: #N)-(aModel atCompartment: {#status->#Q. #country->c}))) sum.
    ].
model atParameter: #rho assignValue: [ :aModel| |c val|
        c := aModel currentCompartment at: #species.
        c = #bird ifTrue: [ val := 0.1 ].
        c = #human ifTrue: [ val := 0.03 ].
        c := aModel currentCompartment at: #status.
        (c = #Q) ifTrue: [ val := 0 ].
        val
    ].
model atParameter: #delta assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := 0.068 ].
        c = #bird ifTrue: [ val := 0.055 ].
        val ].
model atParameter: #epsilon assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := 0.096 ].
        c = #bird ifTrue: [ val := 0.082 ].
        val ].
model 
		atCompartment: { #status->#S. #species->#bird. #country->#Thailand } 
		put: 4990
		atOthersPut: 0.
	model 
		atCompartment: { #status->#I. #species->#bird. #country->#Thailand } 
		put: 10.
	#(#MyanmarBurma #Cambodia #Laos #Vietnam) do: [ :e| 
		model 
			atCompartment: { #status->#S. #species->#bird. #country->e } 
			put: 5000.
	].
	#(#MyanmarBurma #Cambodia #Laos #Thailand #Vietnam) do: [ :e| 
		model 
			atCompartment: { #status->#S. #species->#human. #country->e } 
			put: 500 
	].

simulator := KESimulator new: #RungeKutta from: 0.0 to: 500 by: 1.
simulator executeOn: model.
map data: (map countries collect: [:c| (simulator allTimesSeriesContaining: {#status->#I. #species->#bird. #country->c}) first peakOfEpidemic ]).	
map open.

^ {simulator . model . map}