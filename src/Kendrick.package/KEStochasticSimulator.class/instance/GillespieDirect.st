as yet unclassified
GillespieDirect
	
	| nbEquations nbSpecies nbCompartments listCompSym result timeIndex t i rand1 rand2 previousTime rTotal deltaT p selectedEvent |
	nbEquations := model numberOfEquations.
	nbSpecies := model numberOfSpecies.
	nbCompartments := nbEquations / nbSpecies.
	listCompSym := model getListCompartmentSymbol.
	result := Array new: nbCompartments.
	timeIndex := Array new: nbCompartments.
	
	1 to: nbCompartments do:[:id1|
		result at: id1 put: (Array new: 200000).
		1 to: 200000 do: [:id2|(result at: id1) at: id2 put: (Array new: nbSpecies)]
		].
	1 to: nbCompartments do: [:index| timeIndex at:index put:(Array new: 200000)].
	
	eventList := model generateEvents.
	self halt.
	t := tMin.
	i := 1.
	rand1 := Random new.
	rand2 := Random new.
	previousTime :=0.
	[t < tMax] whileTrue: [
		model timeValue: t.
		rTotal := self sumOfRate.
		(rTotal ~= 0) ifTrue: [deltaT := ((rand1 next) log) negated / rTotal].
		p := rand2 next * rTotal.
		selectedEvent := self selectEventWith: p.
		t := t + deltaT.
		selectedEvent executeOn: model.
		t > ( previousTime+step ) ifTrue: [			
			model equations do: [:eachEq|
				1 to: nbCompartments do: [:cId|
					(eachEq variable symbol) = (listCompSym at: cId) ifTrue: [
						((result at: cId) at:i) at: (eachEq eqIndex) put: (((model atCompartment: (eachEq variable symbol)) numberOfIndividuals) at: (eachEq eqIndex)).
						(timeIndex at: cId) at:i put:t.
						]
					].				
				].			
			i := i +1.
			previousTime := t.
			].
		].
	data := Dictionary new.	
	1 to: nbCompartments do: [:cID|
		|series |
		series := KESeries from: ((result at:cID) select: [:e| e~= nil]) withIndex: ((timeIndex at: cID) select:[:e| e~= nil]).
		data at: (listCompSym at: cID) put: series.
		].
	^data.
 