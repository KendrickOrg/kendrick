as yet unclassified
random: rand select: rates
	"A Monte-Carlo routine to random choose an index based on cumsum >= random*totalSum"
	|sum count|
	sum := rates sum.
	count := 0.
	1 to: rates size do: [ :i|
		count := count + (rates at: i).
		count >= (sum * rand) ifTrue: [ ^ i ]
		 ].
	^ 0