as yet unclassified
selectReaction: random2 select: propensityArray 
	|sum count|
	
	sum := propensityArray sum.
	count := 0.
	1 to: propensityArray size do: [ :i|
		count := count + (propensityArray at: i).
		count >= (sum * random2) ifTrue: [ ^ i ]
		 ].
	^ 0