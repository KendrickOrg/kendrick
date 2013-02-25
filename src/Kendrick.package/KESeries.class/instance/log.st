as yet unclassified
log
(((data at: 1) at: 1) at: 1) isArray ifTrue: [
	1 to: (index size) do:[:cID|
		1 to: ((data at: cID) size) do:[:i|
			1 to: (((data at: cID) at: i) size) do:[:j|
				(((data at: cID) at: i) at: j) at: 2 put: (((((data at: cID) at: i) at: j) at: 2) log).
				]
			]
		]	
	] ifFalse: [
	1 to: (index size) do:[:cID|
		1 to: ((data at: cID) size) do:[:i|
			((data at: cID) at: i) at: 2 put: ((((data at: cID) at: i) at: 2) log).
			]	
		]	
	]

