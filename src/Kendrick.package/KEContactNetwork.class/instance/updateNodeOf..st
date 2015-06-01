as yet unclassified
updateNodeOf: ind
	"This function is just called in the case of network of individuals"
	|currentNode newLabel|
	currentNode := (self nodes at: ind id).
	newLabel :=  { #status->(ind nextStatus at: #status). #id->(ind id) }.
	currentNode adjacentNodes keysAndValuesDo: [ :k :v| 
		|idx|
		idx := (Dictionary newFrom: k) at: #id.
		(self nodes at: idx) adjacentNodes removeKey: currentNode label.
		(self nodes at: idx) addAdjacentNode: (newLabel->v)
		].
	currentNode label: newLabel
	