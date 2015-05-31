as yet unclassified
checkEdge: anEdge
	^ (nodes at: (#first value: anEdge)) adjacentNodes keys indexOf: (#second value: anEdge) 
	
