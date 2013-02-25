as yet unclassified
sqrt
(data at: 1) isArray ifTrue: [
	1 to: (data size) do:[:i|
		1 to: ((data at: i) size) do:[:j|
			(data at: i) at: j put: (((data at: i) at: j) sqrt).
			]
		]
	] ifFalse: [
	1 to: (data size) do:[:i|
		data at: i put: ((data at: i) sqrt).
		]
	]

