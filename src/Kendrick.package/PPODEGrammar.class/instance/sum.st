grammar
sum
	^ $s asParser token trim , $u asParser token trim
		, $m asParser token trim , $( asParser token trim
		, identifier token trim , $, asParser token trim , terms
		, $) asParser token trim