adding
addAdjacentNode: association
	adjacentNodes at: (association key) put: (association value)
	