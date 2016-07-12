as yet unclassified
viewDataAtTime: time
	|timeIndex|
	status isEmpty ifTrue: [ ^ self error: 'You should set up the status that you want to view with the network' ].
	status size > 1 ifTrue: [ isAtIndividualLevel := true ] ifFalse: [ isAtIndividualLevel := false ].
	timeIndex := data first indexOfTime: time.
	vizData := Dictionary new.
	network allContacts do: [ :c|
		vizData at: c put: (Dictionary newFrom: (status collect: [:e| e->0 ] )) ].
	data do: [ :ts| |node stt|
		node := ts compartment at: #node.
		stt := ts compartment at: #status.
		(status includes: stt) & ((ts data at: timeIndex) > 0)
		ifTrue: [ 
			|old|
			old := (vizData at: node) at: stt.
			(vizData at: node) at: stt put: old + (ts data at: timeIndex) ]
	].
	network allContacts do: [ :n| 
		vizData at: n put: ((vizData at: n) associations select: [ :e| e value > 0])
		].
	vizData values detect: [ :v| v size > 1 ] ifFound: [ ^ self error: 'A node of visualizing network should represent one status' ].