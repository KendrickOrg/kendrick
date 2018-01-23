as yet unclassified
beforeBench

|model sirConcern eConcern spatialConcern simulator db multiHostConcern seirsConcern f |
model := KEModel new population: (KEPopulation size: 27500).

"Multi-host concern"
multiHostConcern := KEModelPart new.
multiHostConcern
   addAttribute: #species 
   value: #(#human #bird).

"Spatial concern"
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

"SEIRS concern"
seirsConcern := KEModelPart new.
seirsConcern attributes: {#status->#(#S #E #I #R)}.
seirsConcern addParameters: { #beta. #gamma. #mu. #sigma. #nu }.
seirsConcern addParameter: #lambda value: [ :aModel | 
            (aModel atParameter: #beta) * 
            (aModel atCompartment: {#status->#I}) / (aModel atParameter: #N) ].
seirsConcern
        addTransitionFrom: '{#status: #S}'
        to: '{#status: #E}'
        probability: [ :aModel | 
            (aModel atParameter: #lambda) ].
    seirsConcern 
        addTransitionFrom: '{#status: #E}' 
        to: '{#status: #I}' 
        probability: [ :aModel | aModel atParameter: #sigma ].
    seirsConcern 
        addTransitionFrom: '{#status: #I}' 
        to: '{#status: #R}' 
        probability: [ :aModel | aModel atParameter: #gamma ].
    seirsConcern 
        addTransitionFrom: '{#status: #R}' 
        to: '{#status: #S}' 
        probability: [ :aModel | aModel atParameter: #nu ].
    #(S E I R) do: [ :each| 
        seirsConcern 
            addTransitionFrom: {#status->each}
            to: #empty 
            probability: [ :aModel | aModel atParameter: #mu ].
        ].
    seirsConcern 
        addTransitionFrom: #empty 
        to: '{#status: #S}' 
        probability: [ :aModel | aModel atParameter: #mu ].

"Concerns integration"

    model integrate: spatialConcern.
    model integrate: multiHostConcern.
    model integrate: seirsConcern.

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
    model atParameter: #nu assignValue: 0.00274.
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
    model atParameter: #beta assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #species.
        c = #human ifTrue: [ val := #(0 0.21) ].
        c = #bird ifTrue: [ val := #(0 0.42) ].
        val
    ]. 
    model atParameter: #lambda assignValue: [ :aModel| |c|
        c := aModel currentCompartment at: #patch.
        ((aModel atParameter: #beta) *
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

"Run the model with RK4"
simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
    simulator executeOn: model.
