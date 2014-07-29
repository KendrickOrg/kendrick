as yet unclassified
initPositions
	(self population indList at: 1) position ifNil: [ 
		|rand1 rand2 x y nbInd|
		rand1 := Random new.
		rand2 := Random new.
		nbInd := self nodes size.
		x := rand1 next: nbInd.
		y := rand2 next: nbInd.
		1 to: nbInd do: [ :i|
			(self population indList at: i) position: (Array with: (x at: i) with: (y at: i))
			 ]
		 ]
	
	