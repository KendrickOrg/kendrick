Class {
	#name : #KEContactNetworkSimulator,
	#superclass : #KEStochasticSimulator,
	#instVars : [
		'network',
		'tau',
		'gamma',
		'rho'
	],
	#category : #'Kendrick-Core-Network'
}

{ #category : #examples }
KEContactNetworkSimulator class >> example1 [
	| v g nodes edges nbNodes n |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KEKleinbergContactNetwork new
				nodes: (1 to: 25 * 25);
				n: 25;
				p: 1;
				q: 1;
				r: 2).
	g := n network.
	v := RTView new.
	nbNodes := g n.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g nodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ Color green ] ];
		size: 10) elementsOn: g nodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	RTGridLayout new
		lineItemsCount: nbNodes;
		on: v elements.
	v canvas addMenu: '+' callback: [ RTZoomInMove on: v ].
	v canvas addMenu: '-' callback: [ RTZoomOutMove on: v ].
	v canvas camera scale: 2.
	v @ RTDraggableView @ RTZoomableView.
	v open
]

{ #category : #examples }
KEContactNetworkSimulator class >> example2 [
	| v g n nodes edges nbNodes |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KEKleinbergContactNetwork new
				nodes: (1 to: 25 * 25);
				n: 25;
				p: 1;
				q: 1;
				r: 2).
	g := n network.
	10 timesRepeat: [ n step ].
	v := RTView new.
	nbNodes := g n.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g nodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ e currentStatus == #S
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ];
		size: 10) elementsOn: g nodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	RTGridLayout new
		lineItemsCount: nbNodes;
		on: v elements.
	v canvas addMenu: '+' callback: [ RTZoomInMove on: v ].
	v canvas addMenu: '-' callback: [ RTZoomOutMove on: v ].
	v canvas camera scale: 2.
	v @ RTDraggableView @ RTZoomableView.
	v open
]

{ #category : #examples }
KEContactNetworkSimulator class >> example3 [
	| mean result graph n g |
	result := (1 to: 100)
		collect: [ :each | 
			graph := KETriangularContactNetwork new
				nodes: (1 to: 25 * 25);
				n: 25;
				m: 25.
			n := KEContactNetworkSimulator fromNetwork: graph.
			g := n network.
			50 timesRepeat: [ n step ].
			graph r0 ].
	result := result reject: [ :each | each == Float nan ].
	mean := 0.
	result do: [ :each | mean := mean + each ].
	mean := mean / result size.
	mean
]

{ #category : #examples }
KEContactNetworkSimulator class >> exampleErdos1 [
	| v g nodes edges nbNodes n |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KEErdosGNMContactNetwork new
				nodes: (1 to: 100);
				edgesNumber: 70).
	g := n network.
	10 timesRepeat: [ n step ].
	v := RTView new.
	nbNodes := g nodes size.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g nodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ e currentStatus == #S
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ];
		size: 10) elementsOn: g nodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	v addAnimation: (RTSpringLayoutStepping new view: v).
	v @ RTDraggableView.
	v open
]

{ #category : #examples }
KEContactNetworkSimulator class >> exampleErdosGNM [
	| v g nodes edges nbNodes n |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KEErdosGNMContactNetwork new
				nodes: (1 to: 100);
				edgesNumber: 100).
	g := n network.
	10 timesRepeat: [ n step ].
	v := RTView new.
	nbNodes := g nodes size.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g nodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ e currentStatus == #S
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ];
		size: 10) elementsOn: g nodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	v addAnimation: (RTSpringLayoutStepping new view: v).
	v @ RTDraggableView.
	v open
]

{ #category : #examples }
KEContactNetworkSimulator class >> exampleErdosGNP [
	| v g nodes edges nbNodes n |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KEErdosGNPContactNetwork new
				nodes: (1 to: 100);
				probability: 0.02).
	g := n network.
	10 timesRepeat: [ n step ].
	v := RTView new.
	nbNodes := g nodes size.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g nodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ e currentStatus == #S
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ];
		size: 10) elementsOn: g nodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	v addAnimation: (RTSpringLayoutStepping new view: v).
	v @ RTDraggableView.
	v open
]

{ #category : #examples }
KEContactNetworkSimulator class >> exampleHexagon1 [
	| v g n nodes edges nbNodes |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KEHexagonalContactNetwork new
				nodes: (1 to: 25 * 25);
				n: 25;
				m: 25).
	g := n network.
	10 timesRepeat: [ n step ].
	v := RTView new.
	nbNodes := g n.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g activeNodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ e currentStatus == #S
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ];
		size: 10) elementsOn: g activeNodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	v addAnimation: (RTSpringLayoutStepping new view: v).
	v @ RTDraggableView.
	v open
]

{ #category : #examples }
KEContactNetworkSimulator class >> exampleTriangular1 [
	| v g n nodes edges nbNodes |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KETriangularContactNetwork new
				nodes: (1 to: 25 * 25);
				n: 25;
				m: 25).
	g := n network.
	10 timesRepeat: [ n step ].
	v := RTView new.
	nbNodes := g n.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g activeNodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ e currentStatus == #S
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ];
		size: 10) elementsOn: g activeNodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	v addAnimation: (RTSpringLayoutStepping new view: v).
	v @ RTDraggableView.
	v open
]

{ #category : #examples }
KEContactNetworkSimulator class >> exampleTriangular2 [
	| v g n nodes edges nbNodes |
	n := KEContactNetworkSimulator
		fromNetwork:
			(KETriangularContactNetwork new
				nodes: (1 to: 50 * 50);
				n: 50;
				m: 50).
	g := n network.
	20 timesRepeat: [ n step ].
	v := RTView new.
	nbNodes := g n.
	nodes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: g activeNodes.
	nodes := (RTEllipse new
		color: [ :e | 
			e currentStatus == #I
				ifTrue: [ Color red ]
				ifFalse: [ e currentStatus == #S
						ifTrue: [ Color green ]
						ifFalse: [ Color blue ] ] ];
		size: 10) elementsOn: g activeNodes.
	nodes @ RTDraggable.
	v addAll: nodes.
	edges := RTEdgeBuilder new
		view: v;
		shape: (RTLine new color: (Color red alpha: 0.5));
		source: g edges connectFrom: #from to: #to.
	edges do: [ :e | e trachelShape pushBack ].
	v addAnimation: (RTSpringLayoutStepping new view: v).
	v @ RTDraggableView.
	v open
]

{ #category : #'instance creation' }
KEContactNetworkSimulator class >> fromNetwork: aKEKleinbergContactNetwork [
	^(self basicNew network: aKEKleinbergContactNetwork) initialize
]

{ #category : #initialization }
KEContactNetworkSimulator >> initialize [
	self initializeContactNetwork.
   self initializeStatus.
	self initializeModelParameters
]

{ #category : #initialization }
KEContactNetworkSimulator >> initializeContactNetwork [
	network run
]

{ #category : #initialization }
KEContactNetworkSimulator >> initializeModelParameters [
"Later, we will use Kendrick model to have access to the parameters"
	tau := 1.0.
	gamma := 1.0.
	rho := tau / (tau + gamma)
]

{ #category : #initialization }
KEContactNetworkSimulator >> initializeStatus [
	"Later, we will use Kendrick model to know the initial state of the network"

	| initialInfectedNode |
	network nodes do: [ :each | each currentStatus: #S ].
	"Start the infection at the center of the network"
	"initialInfectedNode := network nodes at: (network n + 1) * (network n // 2) + 1".
	initialInfectedNode := network nodes at:1.
	initialInfectedNode
		currentStatus: #I;
		genInfected: 1
]

{ #category : #initialization }
KEContactNetworkSimulator >> initializeStatus:p [
	"Later, we will use Kendrick model to know the initial state of the network"

	| initialInfectedNode |
	network nodes do: [ :each | each currentStatus: #S ].
	"Start the infection at the center of the network"
	initialInfectedNode := network nodes at: p.
	initialInfectedNode
		currentStatus: #I;
		genInfected: 1
]

{ #category : #accessing }
KEContactNetworkSimulator >> network [

^network
]

{ #category : #accessing }
KEContactNetworkSimulator >> network: aNetwork [
 network := aNetwork
]

{ #category : #run }
KEContactNetworkSimulator >> step [
	network nodes do: [ :n | self stepNode: n ].
	
	self updateStatus
]

{ #category : #run }
KEContactNetworkSimulator >> stepNode: aNode [
	| n p |
	n := network nbOfInfectedNeighborsOf: aNode.
	aNode nextStatus: aNode currentStatus.
	aNode currentStatus == #S
		ifTrue: [ p := 1 - (1 - rho raisedTo: n).
			p > 1.0 random
				ifTrue: [ aNode nextStatus: #I.
					self updateGenInfected: aNode ] ].
	aNode currentStatus == #I
		ifTrue: [ p := gamma.
			p > 1.0 random
				ifTrue: [ aNode nextStatus: #R ] ]
]

{ #category : #run }
KEContactNetworkSimulator >> updateGenInfected: aNode [
	| infectedNodes |
	infectedNodes := network infectedNeighborsOf: aNode.
	aNode genInfected: (infectedNodes collect:[:each | each genInfected]) atRandom +1
]

{ #category : #run }
KEContactNetworkSimulator >> updateStatus [
"Ask each nodes to update its infectious status"
	network nodes do: [ :each | each updateStatus ]
]
