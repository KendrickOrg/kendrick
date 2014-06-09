as yet unclassified
doGillespieIteration
	|rand1 rand2 cityRates cityChosen eventChosen deltaT rateTotal|
	rand1 := Random new.
	rand2 := Random new.
	"cityRates stores the total rate of each sub-population"
	cityRates := self calculateEventRates.
	"Choose a population in which an event will happen"
	cityChosen := model PIDList at: (self random: (rand1 next) select: cityRates).
	eventChosen := self random: (rand1 next) select: (model population at: cityChosen) rates.
	self executeEvent: eventChosen in: cityChosen. 
	"calculate deltaT"
	rateTotal := cityRates sum.
	rateTotal ~= 0 
	ifTrue: [ deltaT := ((rand2 next) log) negated / rateTotal ]
	ifFalse: [ deltaT := 0 ].
	^ deltaT 