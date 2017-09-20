accessing
before

| model multiHostConcern simulator db |
model := KEModel new.
model population: (KEPopulation size: 4000).
model attributes: {(#status -> #(#S #I #R))}.
model addParameter: #mu value: 12.17.
model addParameter: #gamma value: 52.
model addParameter: #beta value: 1.
model addParameter: #lambda value: [ :aModel| 
        (aModel atParameter: #beta) * 
        (aModel atCompartment: {#status->#I}) ].
model
   addTransitionFrom: '{#status: #S}'
   to: '{#status: #I}'
   probability: [ :m | m atParameter: #lambda ].
model 
   addTransitionFrom: '{#status: #I}' 
   to: '{#status: #R}' 
        probability: [ :m | m atParameter: #gamma ].
    #(#S #I #R) do: [ :each| 
        model 
            addTransitionFrom: {#status->each} 
            to: #empty 
            probability: [ :m | m atParameter: #mu ].
        ].
model 
        addTransitionFrom: #empty 
        to: '{#status: #S}' 
        probability: [ :m | m atParameter: #mu ].

multiHostConcern := KEModelPart new.
multiHostConcern 
   addAttribute: #species 
   value: #(#mosquito #reservoir1 #reservoir2).

model integrate: multiHostConcern.

model 
        atParameter: #mu
        assignValue: 
        [ :aModel| |c val| 
            c := aModel currentCompartment at: #species.
            c = #mosquito ifTrue: [ val := 12.17 ].
            c = #reservoir1 ifTrue: [ val := 0.05 ].
            c = #reservoir2 ifTrue: [ val := 0.05 ].
            val
        ].
model atParameter: #N assignValue: [ :aModel| |c| 
        c := aModel currentCompartment at: #species.
        aModel sizeOfPopulation: c
        ].
model addParameter: #rho value: [ :aModel| |c val|
        c := aModel currentCompartment at: #species.
        c = #mosquito ifTrue: [ val := #(0 0.02 0.02) ].
        c = #reservoir1 ifTrue: [ val := #(0.02 0 0) ].
        c = #reservoir2 ifTrue: [ val := #(0.02 0 0) ].
        val
        ].
model atParameter: #lambda assignValue: [ :aModel|
        ((aModel atParameter: #beta) * 
        (aModel atParameter: #rho) * 
        (aModel atCompartment: {#status->#I})) sum
        ].

    model atCompartment: { #status->#I. #species->#mosquito } put: 1 atOthersPut: 0.
    model atCompartment: { #status->#S. #species->#mosquito } put: 999.
    model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
    model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000.

simulator := KESimulator new: #Gillespie from: 0.0 to: 0.5 by: 0.0027.

simulator executeOn: model.
db := (KEDiagramBuilder new) data: ((simulator allTimesSeriesContaining: '{#status: #I}') sqrt).
db open.

^ simulator -> model