methods
calculateTime: random1 rates: propensityArray
	"random1 := MersenneTwisterRandom new.random2 := MersenneTwisterRandom new.random1 nextFloat."
	|timeT sum|
	
	sum := propensityArray sum.
	"(sum ~= 0) ifTrue: [ timeT := (1/sum) * ((1/random1) ln) ]."
	(sum ~= 0) ifTrue: [ timeT := ((random1 ln) negated)/(propensityArray sum) ].  
	^ timeT.
																						