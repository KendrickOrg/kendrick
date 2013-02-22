as yet unclassified
runStochasticSimulationFor: tMax
	|  rTotal rand1 deltaT rand2 p selectedEvent t  previousTime i nbEquations k results|	
	nbEquations := self equations size.
"	result := Array new:200000."
	"Modify the result of this algorithm: KETimeSeriesCollection"
	result := Array new: nbEquations.
	1 to: (nbEquations) do: [:index| result at: index put: (Array new: 200000)].
	eventList := self generateEvents.
	t := 0.
	i := 1.
	rand1 := Random new.
	rand2 := Random new.
	previousTime :=0.
	[t < tMax] whileTrue: [
		self timeValue: t.
		rTotal := self sumOfRate.
		deltaT := 0.
		(rTotal ~= 0) ifTrue:
		[deltaT := ((rand1 next) log) negated / rTotal].
		p := rand2 next * rTotal.
		selectedEvent := self selectEventWith: p.
		t := t + deltaT.
		selectedEvent executeOn: self.
		t > (previousTime+(0.5/365)) ifTrue: [
			|id|
			id := 1.
			self equations do: [:eachEq|
				(result at: id) at:i put: (Array with:t with: (self numberOfIndividualsAtCompartment: (eachEq variable symbol))).
				id := id + 1.
				].			
			i := i +1.
			previousTime := t.
			].
			].
	results := KETimeSeriesCollection new.
	k := 1.
	self equations do: [:each|
		result at: k put: ((result at: k) select: [:e| e ~= nil]).
		results add: (each variable symbol) value: (result at: k).
		k := k+1].
	^results.
	"result := result select:[:each | each ~= nil]"

	
		