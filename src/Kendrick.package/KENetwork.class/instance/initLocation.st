initialize
initLocation
	"Initialize a random location (X Y) for each individual"
	|rand1 rand2 x y|
	rand1 := Random new.
	rand2 := Random new.
	x := (rand1 next: nbInd) * surface.
	y := (rand2 next: nbInd) * surface.
	1 to: nbInd do: [ :i|
		(indList at: i) location: (Array with: (x at: i) with: (y at: i))
		 ]
	
