"
For visualization of a network contact of an epidemiological network model
 
Internal Representation and Key Implementation Points.

    Instance Variables
	network:		<KEContactNetwork>


    Implementation Points
"
Class {
	#name : #KENetworkBuilder,
	#superclass : #KEGraphBuilder,
	#instVars : [
		'network',
		'vizData',
		'isAtIndividualLevel',
		'status',
		'colors',
		'networkLegend'
	],
	#category : #'Kendrick-Core'
}

{ #category : #'as yet unclassified' }
KENetworkBuilder >> build [
	|b lb|
	b := RTMondrian new.
	colors isEmpty ifTrue: [ colors add: #red ].
	isAtIndividualLevel 	
	ifTrue: [ 
		b shape circle size: 5; 
				  if: [ :n | (vizData at: n) isEmpty ] color: (Color veryLightGray alpha: 0.1);
				  if: [ :n | (vizData at: n) isEmpty not ] color: [:n| (Color perform: (colors at: (status indexOf: ((vizData at: n) first key))))].
		]
	ifFalse: [ b shape circle color: ((Color perform: colors first) alpha: 0.4) ].
	b nodes: network allContacts.
	b edges notUseInLayout connectToAll: [ :n| (network atNode: n) adjacentNodes ]. 
	
	isAtIndividualLevel ifFalse: [ 
		|nodeData|
		nodeData := vizData copy.
		nodeData keysDo: [ :k|( nodeData at: k) isEmpty ifTrue: [ (nodeData at: k put: {status first -> 0}) ] ].
		b normalizer 
			normalizeSize: [ :n| (nodeData at: n) first value ] 
			min: (nodeData values collect: [:e| e first value]) min 
			max: (nodeData values collect: [:e| e first value]) max.
		].
	
	b layout cluster.
	b build.

	lb := RTLegendBuilder new.
	lb view: b view.
	isAtIndividualLevel 
	ifTrue: [ 
		|str|
		str := 'circle = an individual; '.
		1 to: status size do: [ :i| str := str, (colors at: i) asString, ' circle = ', (status at: i) asString, ';' ].
		str := str, 'gray circle = others'.
		lb addText: str ]
	ifFalse: [ lb addText: 'Circle=node,size=number of ', status first asString,';gray links=contacts' ].
	networkLegend ifNotNil: [ lb addText: networkLegend  ].
	lb build.
	
	^ b
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> colors [
	^ colors
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> colors: anArray [
	colors := anArray
]

{ #category : #initialization }
KENetworkBuilder >> initialize [
	super initialize.
	status := OrderedCollection new.
	colors := OrderedCollection new.
	
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> legend: text [
	networkLegend := text
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> network [
	^ network
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> network: aNetwork [
	network := aNetwork
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> open [
	^ self build open
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> status [
	^ status
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> status: anArray [
	status := anArray
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> view [
	^ self build view
]

{ #category : #'as yet unclassified' }
KENetworkBuilder >> viewDataAtTime: time [
	|timeIndex|
	status isEmpty ifTrue: [ ^ self error: 'You should set up the status that you want to view with the network' ].
	status size > 1 ifTrue: [ isAtIndividualLevel := true ] ifFalse: [ isAtIndividualLevel := false ].
	timeIndex := data first indexOfTime: time.
	vizData := Dictionary new. 
	network allContacts do: [ :c|
		vizData at: c put: (Dictionary newFrom: (status collect: [:e| e->0 ] )) ].
	data do: [ :ts| |node stt|
		node := ts compartment at: #node.
		stt := ts compartment at: #status.
		(status includes: stt) & ((ts data at: timeIndex) > 0)
		ifTrue: [ 
			|old|
			old := (vizData at: node) at: stt.
			(vizData at: node) at: stt put: old + (ts data at: timeIndex) ]
	].
	network allContacts do: [ :n| 
		vizData at: n put: ((vizData at: n) associations select: [ :e| e value > 0])
		].
	vizData values detect: [ :v| v size > 1 ] ifFound: [ ^ self error: 'A node of visualizing network should represent one status' ].
]
