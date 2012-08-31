as yet unclassified
sqrt: aSymbol in: aModel

|rs|
rs := timeSeries at: aSymbol ifAbsent: [^nil].
((aModel atCompartment: aSymbol) isVector) ifTrue: [
	1 to: (rs size) do:[:i|
		1 to: ((rs at: i) size) do: [:j|
			((rs at: i) at: j) at: 2 put: ((((rs at: i) at: j) at: 2) sqrt). 			
			]
		]
	] ifFalse: [
	1 to: (rs size) do: [:i|
		(rs at: i) at: 2 put: (((rs at: i) at: 2) sqrt).
		]
	].
^rs