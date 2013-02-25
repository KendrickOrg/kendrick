as yet unclassified
solver2: model
"This function is for finding solution for the model with multi host in which each compartment is a vector, not a value."

| nbSpecies nbEquations dydx k1 k2 k3 k4 y k data x results listCompartmentSymbol nbCompartments timeIndex |

listOfEquations := model equations.
nbIterations := self nbOfIterations. 
nbEquations := listOfEquations size.
nbSpecies := model numberOfSpecies.
nbCompartments := nbEquations / nbSpecies.
listCompartmentSymbol := model getListCompartmentSymbol.
dydx := Array new: nbEquations.
k1 := Array new: nbEquations.
k2 := Array new: nbEquations.
k3 := Array new: nbEquations.
k4 := Array new: nbEquations. 
y := Array new: nbEquations.

"In this case, the result will be an array of two dimensions."

data := Array new: nbCompartments. "ex: (I[1] I[2] I[3])"
timeIndex := Array new: nbCompartments.

(1 to: nbCompartments) do: [:indexCompartment|
	data at: indexCompartment put: (Array new: nbSpecies).
	1 to: nbSpecies  do: [:index|(data at: indexCompartment) at: index put: (Array new: nbIterations)]
	].

1 to: nbCompartments do: [:index| timeIndex at:index put:(Array new: nbIterations)].

"Initialize value for y"
	k := 1.
    listOfEquations do:[:each|
		"each compartment is a vector, so, numberOfIndividuals of each compartment is an array of 1 dimension"
		y at: k put:(((model atCompartment: (each variable symbol)) numberOfIndividuals) at: (each eqIndex)).
		k := k + 1.		
		].	

"Runge Kutta Algorithme"
1 to: nbIterations do: [:j|
	x := x0 + (j * step).
	"Update time value for the model"
	model timeValue: x.
	
	"Calculate k1"
	dydx := self calculateDerivation2: model.
	"self halt."
	1 to: nbEquations do: [:i|
		k1 at: i put: ((dydx at: i) * step).		
		].
	"Update number of individuals for each compartments of model"
	k := 1.
    listOfEquations do:[:each|
		model atCompartment: (each variable symbol) at: (each eqIndex) modifyNumberOfIndividuals: (((k1 at: k) / 2) + (y at: k)).
		k := k + 1.
		].
	"Calculate k2"
	dydx := self calculateDerivation2: model.
	"self halt."
	1 to: nbEquations do: [:i|
		k2 at: i put: ((dydx at: i) * step).		
		].
	"Update number of individuals for each compartments of model"
	k := 1.
    listOfEquations do:[:each|		
		model atCompartment: (each variable symbol) at: (each eqIndex) modifyNumberOfIndividuals: (((k2 at: k) / 2) + (y at: k)).
		k := k + 1.
		].
	"Calculate k3"
	dydx := self calculateDerivation2: model.
	"self halt."
	1 to: nbEquations do: [:i|
		k3 at: i put: ((dydx at: i) * step).		
		].
	"Update number of individuals for each compartments of model"
	k := 1.
    listOfEquations do:[:each|		
		model atCompartment: (each variable symbol) at: (each eqIndex) modifyNumberOfIndividuals: ((k3 at: k) + (y at: k)).
		k := k + 1.
		].
	"Caculate k4"
	dydx := self calculateDerivation2: model.
	1 to: nbEquations do: [:i|
		k4 at: i put: ((dydx at: i) * step).		
		].
	"Calculate y"
	1 to: nbEquations do: [:i|
		|oldValue|
		oldValue := y at: i.
		y at: i put: ((((k1 at: i)/6) + ((k2 at: i)/3) + ((k3 at: i)/3) + ((k4 at: i)/6)) + oldValue).		
		].
	"Update number of individuals for each compartments of model"
	k := 1.
    listOfEquations do:[:each|		
		model atCompartment: (each variable symbol) at: (each eqIndex) modifyNumberOfIndividuals: (y at: k).
		1 to: nbCompartments do: [:cId|
			(each variable symbol) = (listCompartmentSymbol at: cId) ifTrue: [
				((data at: cId) at: (each eqIndex)) at: j put: (Array with:x with:(y at: k)).
				(timeIndex at: cId) at:j put: x.
				].
			].
		k := k + 1.		
		].
	].

"Return a KEResult of all compartment in the model"
results := Dictionary  new.
1 to: nbCompartments do: [:cID|
	|series|
	series := KESeries from: (data at:cID) withIndex: (timeIndex at: cID).
	results at: (listCompartmentSymbol at: cID) put: series.
	].
^results

