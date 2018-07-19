Class {
	#name : #KEScaleFreeNetworkTopologyTest,
	#superclass : #TestCase,
	#category : 'Kendrick-Tests-Spatial-Core'
}

{ #category : #'as yet unclassified' }
KEScaleFreeNetworkTopologyTest >> testAppendNode [
	|g tp|
	g := KEGraph nodes: 10.
	tp := KENetworkTopology new: { #scalefree. #m0->3 }.
	tp applyOn: g.
	g nodes add: (KENode new label: #'11').
	tp appendNode: #'11'->g.

	self should: [ (g nodes at: 11) adjacentNodes size >= 0 ]
]

{ #category : #'as yet unclassified' }
KEScaleFreeNetworkTopologyTest >> testApplyOn [
	|g tp|
	g := KEGraph nodes: 10.
	tp := KENetworkTopology new: { #scalefree. #m0->3 }.
	tp applyOn: g .

	self should: [ (g nodes at: 10) adjacentNodes size >= 0 ]
]
