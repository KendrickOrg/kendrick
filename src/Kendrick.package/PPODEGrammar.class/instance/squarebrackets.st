grammar
squarebrackets
	"^ identifier token trim, $[ asParser token trim , addition token trim , ($, asParser token trim, addition token trim) plus optional, $] asParser token trim"
	^ identifier token trim, $[ asParser token trim , terms token trim , ($, asParser token trim, terms token trim) plus optional, $] asParser token trim