examples
exampleIBMWikiSimulatorContactNetwork2
"self new exampleIBMWikiSimulatorContactNetwork2"
"Second example found here: https://github.com/UMMISCO/kendrick/wiki/Example-10:-SIR-Model-with-contact-network"

|model network spatialConcern sirConcern simulator db|
model := KEModel new population: (KEPopulation size: 1000).

sirConcern := KEModelPart new.
sirConcern addAttribute: #status value: #(S I R).
sirConcern addParameters: { #beta. #gamma. #lambda }.
sirConcern addTransitionFrom: { #status->#S } to: { #status->#I } probability: 'lambda'.
sirConcern addTransitionFrom: { #status->#I } to: { #status->#R } probability: 'gamma'.

spatialConcern := KEModelPart new.
network := KEContactNetwork nodes: 10 topology: { #random. #p->0.2 }.
spatialConcern addParameter: #network value: network.
spatialConcern addAttribute: #node value: network allContacts.

model integrate: sirConcern.
model integrate: spatialConcern.

model atParameter: #lambda assignValue: [ :aModel||node|
	node := aModel currentCompartment at: #node.
	((aModel atParameter: #network) contactsOf: {aModel. #node->node. #status->#I})*(aModel atParameter: #beta)/(aModel atParameter: #N)
	 ].
model atParameter: #beta assignValue: 1.
model atParameter: #gamma assignValue: 0.1.

2 to: 10 do: [:i| model atCompartment: {#status->#S. #node->i asString asSymbol} put: 100].
model atCompartment: { #status->#I. #node->#'1' } put: 1.
model atCompartment: { #status->#S. #node->#'1' } put: 99.

simulator := KESimulator new: #IBM from: 0.0 to: 50 by: 0.1.
simulator executeOn: model.
db := KENetworkBuilder new 
	data: simulator timeSeries; 
	network: (model atParameter: #network);
 	status: #(I); viewDataAtTime: 50.
db open