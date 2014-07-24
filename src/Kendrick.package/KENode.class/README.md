A KENode represents a node in graph (KEGraph). 

Instance Variables
	adjacentNodes:		<OrderedCollection>
	weights:		<Dictionary>

adjacentNodes
	- a list of nodes linked to this node.

weights
	- a dictionary of weight list. The key is the weight name (ex: #beta, #gamma etc.). The value is a list of weight values that shows the interaction of this node and its linked nodes.
