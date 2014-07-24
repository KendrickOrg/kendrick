A KESpatialNetwork is a network in which the contacts between individuals (edges of the network) is created based on a probability kernel function of distance (decreased by distance)

Instance Variables
	kernel:		<Block>

kernel
	- The kernel function for calculating the probability of having contact between two individuals (an edge between two nodes).
	- By default, kernel: exp(-d^5)
