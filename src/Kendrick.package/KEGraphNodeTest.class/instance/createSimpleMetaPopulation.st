as yet unclassified
createSimpleMetaPopulation
	"This model is based on the multi-species model but the ODE system is based on SIR model, the interaction between sub-population is defined via network"
	|graph node1 node2 node3|
	node1 := KEGraphNode new. 
	node1 with: #N value: 10000.
	node1 with: #beta value: 0.0.
	node1 with: #mu value: 365/30.
	node1 with: 2 weight: 0.02.
	node1 with: 3 weight: 0.02.
	node2 := KEGraphNode new.
	node2 with: #N value: 1000.
	node2 with: #beta value: 0.0.
	node2 with: #mu value: 1/20.
	node2 with: 1 weight: 0.02.
	node2 with: 3 weight: 0.0.
	node3 := KEGraphNode new.
	node3 with: #N value: 2000.
	node3 with: #beta value: 0.0.
	node3 with: #mu value: 1/20.
	node3 with: 1 weight: 0.02.
	node3 with: 2 weight: 0.0.
	graph := KEGraphNode with: (Array with: node1 with: node2 with: node3).
	^ graph 
	