as yet unclassified
appendNode: anAssociation
	|label graph rand sumOfKj m|
	label := anAssociation key.
	graph := anAssociation value.
	rand := Random new.
	sumOfKj := (activeNodes collect: [:j| (graph atNode: j) adjacentNodes size]) sum.
	m := 0.
	[ m <= m0 ] whileTrue: [
		activeNodes do: [ :node| 
			|pi ki|
			ki := (graph atNode: node) adjacentNodes size.
			pi := ki / sumOfKj.
			(pi > rand next) ifTrue: [ 
				graph edgesFrom: label toAll: (Array with: node).
				m := m + 1 ]
			]
		].
	activeNodes add: label