as yet unclassified
checkEdge: anEdge
	^ (nodes at: (#first value: anEdge)) adjacentNodes indexOf: (#second value: anEdge) 
	
