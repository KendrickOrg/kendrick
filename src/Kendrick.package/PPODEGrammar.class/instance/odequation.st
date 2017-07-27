grammar
odequation
	^ identifier2 token trim , $: asParser token trim
		, identifier token trim , $= asParser token trim , terms