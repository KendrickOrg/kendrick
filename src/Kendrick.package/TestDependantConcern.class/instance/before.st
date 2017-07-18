as yet unclassified
before

|model sirConcern eConcern spatialConcern simulator db|
sirConcern := KEModelPart new.
sirConcern attributes: {#status->#(#S #I #R)}.
sirConcern addParameters: {#lambda. #gamma}.
sirConcern
    addTransitionFrom: '{#status: #S}'
    to: '{#status: #I}'
    probability: [ :aModel | aModel atParameter: #lambda ].
sirConcern 
    addTransitionFrom: '{#status: #I}' 
    to: '{#status: #R}' 
    probability: [ :aModel | aModel atParameter: #gamma ].

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

model := KEModel new.
model population: (KEPopulation size: 5000).
model integrate: spatialConcern.
model integrate: sirConcern.

eConcern := KEModelPart dependOn: sirConcern.
eConcern atAttribute: #status add: #E.
eConcern 
    removeTransitionFrom: { #status->#S } 
    to: { #status->#I }.
eConcern 
    addTransitionFrom: { #status->#S } 
    to: { #status->#E } 
    probability: [ :aModel| aModel atParameter: #lambda ].
eConcern 
    addTransitionFrom: { #status->#E } 
    to: { #status->#I } 
    probability: [ :aModel| aModel atParameter: #sigma ].
eConcern 
    addTransitionFrom: { #status->#E } 
    to: #empty 
    probability: [ :aModel| aModel atParameter: #mu ].
eConcern addParameter: #sigma.
model integrate: eConcern.

model atParameter: #beta assignValue: [ :aModel| |c val| 
        c := aModel currentCompartment at: #patch.
        c = 1 ifTrue: [ val := 0.75 ] ifFalse: [ val := 0.5 ].
        val 
    ].
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

    simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
    simulator executeOn: model.

    db := KEDiagramBuilder new.
    db data: [|tmp| tmp := OrderedCollection new.
    tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:1}').
    tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:2}').
    tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:3}').
    tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:4}').
    tmp addAll: (simulator timeSeriesAt: '{#status: #I,#patch:5}').
    tmp] value.
    db legends: { 'patch 1'. 'patch 2'. 'patch 3'. 'patch 4'. 'patch 5'}.
    db legendTitle: 'Infectious'.
    db xLabel: 'Time (days)'.
    db open.

	^ {simulator . model . db}