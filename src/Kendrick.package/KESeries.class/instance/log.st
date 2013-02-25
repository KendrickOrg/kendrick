as yet unclassified
log
(data size < (data at: 1) size) ifTrue: [
	1 to: (data size) do:[:i|
		1 to: ((data at: i) size) do:[:j|
			((data at: i) at: j) at: 2 put: ((((data at: i) at: j) at: 2) log).
			]
		]
	] ifFalse: [
	1 to: (data size) do:[:i|
		(data at: i) at: 2 put: (((data at: i) at: 2) log).
		]
	]

