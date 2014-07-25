accessing
initPositions
	|rand1 rand2 x y nbInd|
	rand1 := Random new.
	rand2 := Random new.
	nbInd := self getNbIndividuals.
	x := rand1 next: nbInd.
	y := rand2 next: nbInd.
	1 to: nbInd do: [ :i|
		(indList at: i) location: (Array with: (x at: i) with: (y at: i))
		 ]
	