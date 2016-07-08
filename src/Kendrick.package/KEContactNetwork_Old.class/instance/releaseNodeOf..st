as yet unclassified
releaseNodeOf: ind
	"This function is just called in the case of network of individuals"
	|adjacentNodeLabels currentNode|
	topology activeNodes remove: ind id.
	currentNode := (self nodes at: ind id).
	adjacentNodeLabels := currentNode adjacentNodes keys.
	adjacentNodeLabels do: [ :k| 
		(self nodes at: ((Dictionary newFrom: k) at: #id)) adjacentNodes removeKey: currentNode label.
		currentNode adjacentNodes removeKey: k
		].