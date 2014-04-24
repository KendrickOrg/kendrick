accessing
atSubNode: nodeIDs
	"This function will return a node in the sub-node list"
	nodeIDs = 0 ifTrue: [ ^ self ].
	nodeIDs isCollection ifTrue: [ 
		|temp|
		temp := self.
		nodeIDs do: [ :each| temp := temp atSubNode: each ].
		^ temp
		 ].
	"If nodeIDs is a number just return the sub node equivalent in the sub-node list"
	^ subNodes at: nodeIDs