grammar
squarebrackets
	^ identifier token trim , $[ asParser token trim , terms token trim
		, $] asParser token trim
		,
			($[ asParser token trim , terms token trim , $] asParser token trim)
				plus optional