methods
calculateTime: random1 rates: propensityArray
	"random1 := MersenneTwisterRandom new.random2 := MersenneTwisterRandom new.random1 nextFloat."
	|timeT sum1|
	sum1 := propensityArray sum.
	timeT := 0.
	"(sum ~= 0) ifTrue: [ timeT := (1/sum) * ((1/random1) ln) ]."
	(sum1 ~= 0) ifTrue: [ timeT := ((random1 ln) negated)/(sum1) ].
	^ timeT
																						