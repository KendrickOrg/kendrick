initialization
initializeStatus
	"Later, we will use Kendrick model to know the initial state of the network"

	| initialInfectedNode |
	network nodes do: [ :each | each currentStatus: #S ].
	"Start the infection at the center of the network"
	initialInfectedNode := network nodes at: (network n +1) * (network n // 2) + 1.
	initialInfectedNode
		currentStatus: #I;
		genInfected: 1