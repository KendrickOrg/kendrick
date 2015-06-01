as yet unclassified
appendNode: aNodeLabel
	|label idx rand sumOfKj m|
	label := aNodeLabel key.
	idx := aNodeLabel value.
	rand := Random new.
	sumOfKj := (activeNodes collect: [:j| (network nodes at: j) adjacentNodes size]) sum.
	m := 0.
	[ m <= m0 ] whileTrue: [
		activeNodes do: [ :i| 
			|pi ki|
			ki := (network nodes at: i) adjacentNodes size.
			pi := ki / sumOfKj.
			(pi > rand next) ifTrue: [ 
				network with: (Array with: label with: (network nodes at: i) label) strengthOfConnection: strengthOfConnection.
				m := m + 1 ]
			]
		].
	activeNodes add: idx