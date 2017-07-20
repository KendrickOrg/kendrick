examples
exampleNetWorkSimulatorOnSIR
|model network spatialConcern sirConcern simulator db f|
model := KEModel new population: (KEPopulation size: 100).

sirConcern := KEModelPart new.
sirConcern addAttribute: #status value: #(S I R).
sirConcern addParameters: { #beta. #gamma. #lambda }.
sirConcern addTransitionFrom: { #status->#S } to: { #status->#I } probability: 'lambda'.
sirConcern addTransitionFrom: { #status->#I } to: { #status->#R } probability: 'gamma'.

spatialConcern := KEModelPart new.
network := KEContactNetwork nodes: 100 topology: { #random. #p->0.02 }.
spatialConcern addParameter: #network value: network.
spatialConcern addAttribute: #node value: network allContacts.

model integrate: sirConcern.
model integrate: spatialConcern.

model atParameter: #lambda assignValue: [ :aModel||node|
	node := aModel currentCompartment at: #node.
	((aModel atParameter: #network) 
            contactsOf: {aModel. #node->node. #status->#I})
        *(aModel atParameter: #beta)/(aModel atParameter: #N)
	 ].
model atParameter: #beta assignValue: 100.
model atParameter: #gamma assignValue: 0.1.

1 to: 99 do: [:i| model atCompartment: {#status->#S. #node->i asString asSymbol} put: 1].
model atCompartment: { #status->#I. #node->#'100' } put: 1.

simulator := KESimulator new: #IBM from: 0.0 to: 50 by: 0.1.
simulator executeOn: model.
f := [:name| |d tmp|
		tmp := (simulator allTimesSeriesContaining: name) collect: [ :e| e value ].
		d := OrderedCollection new.
		1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
		(KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: name)
		].
db := KEDiagramBuilder new data: { (f value: '{#status:#I}') }.
db open.
db := KENetworkBuilder new
	data: simulator timeSeries;
        network: (model atParameter: #network);
	status: #(#S #I #R);
	colors: #(#green #red #blue);
	viewDataAtTime: 12.5;
	legend: 'random network, p = 0.02'.
db open