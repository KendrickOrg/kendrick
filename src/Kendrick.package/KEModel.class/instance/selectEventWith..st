as yet unclassified
selectEventWith: p
 | sum count |
sum := 0.
count := 0.
	events do:[:each | sum := sum + (each rateValue)"((each rate) evaluateWithModel: self) abs".
		count := count + 1.
		sum >= p ifTrue:[ 	^each].
		].
self halt.
^ nil