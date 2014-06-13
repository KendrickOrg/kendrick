grammar
simpleEquation
   "^identifier token trim, ($[ asParser token trim, index token trim, ($, asParser token trim, index token trim) plus optional, $] asParser token trim) optional, ($: asParser token trim , identifier token trim) optional , $= asParser token trim, terms"
	^ identifier2 token trim, $= asParser token trim, terms