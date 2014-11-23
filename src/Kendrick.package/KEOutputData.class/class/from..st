as yet unclassified
from: aCollectionOfNames
	|out|
	out := KEOutputData new.
	out data: (Dictionary new).
	aCollectionOfNames do: [ :each|
		out data at: each put: (KETimeSeries new)
		 ].
	^ out