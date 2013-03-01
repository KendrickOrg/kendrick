as yet unclassified
solver: model

|nbEquations dydx k1 k2 k3 k4 k data results x y timeIndex|

listOfEquations := model equations.
nbIterations := self nbOfIterations.
nbEquations := listOfEquations size.

dydx := Array new: nbEquations.
k1 := Array new: nbEquations.
k2 := Array new: nbEquations.
k3 := Array new: nbEquations.
k4 := Array new: nbEquations.
y := Array new: nbEquations.
data := Array new: nbEquations.
timeIndex := Array new: nbEquations.

1 to: nbEquations do: [:index| data at: index put: (Array new: nbIterations)].
1 to: nbEquations do: [:index| timeIndex at: index put: (Array new: nbIterations)].

"Initialize value for y"
k := 1.
listOfEquations do: [:each|
	y at: k put: (((model atCompartment: (each variable symbol)) numberOfIndividuals) at: 1).
	k := k + 1.
	].
"RungeKutta Algorithm"
1 to: nbIterations do: [:j|
	x := j * step + x0.
	"Update time value for the model"
	model timeValue: x.
	"Calculate k1"
	dydx := self calculateDerivation: model.
	1 to: nbEquations do: [:i| k1 at: i put: ((dydx at: i) * step)].
	"Update number of individuals for each compartment of model"
	k := 1.
	listOfEquations do: [:each|
		model atCompartment: (each variable symbol) at: 1 modifyNumberOfIndividuals: (((k1 at: k)/2) + (y at: k)).
		k := k+1.
		].
	"Calculate k2"
	dydx := self calculateDerivation: model.
	1 to: nbEquations do: [:i| k2 at: i put: ((dydx at: i) * step)].
	"Update number of individuals for each compartment of model"
	k := 1.
	listOfEquations do: [:each|
		model atCompartment: (each variable symbol) at: 1 modifyNumberOfIndividuals: (((k2 at: k)/2) + (y at: k)).
		k := k+1.
		].
	"Calculate k3"
	dydx := self calculateDerivation: model.
	1 to: nbEquations do: [:i| k3 at: i put: ((dydx at: i) * step)].
	"Update number of individuals for each compartments of model"
	k := 1.
    listOfEquations do:[:each|		
		model atCompartment: (each variable symbol) at: 1 modifyNumberOfIndividuals: ((k3 at: k) + (y at: k)).
		k := k + 1.
		].
	"Caculate k4"
	dydx := self calculateDerivation: model.
	1 to: nbEquations do: [:i| 	k4 at: i put: ((dydx at: i) * step)].
	"Calculate y"
	1 to: nbEquations do: [:i|
		|oldValue|
		oldValue := y at: i.
		y at: i put: ((((k1 at: i)/6) + ((k2 at: i)/3) + ((k3 at: i)/3) + ((k4 at: i)/6)) + oldValue).		
		].	
	"Update number of individuals for each compartments of model"
	k := 1.
    listOfEquations do:[:each|
		model atCompartment: (each variable symbol) at: 1 modifyNumberOfIndividuals: (y at: k).
		(data at: k) at: j put: (y at: k).
		(timeIndex at:k) at: j put: x.
		k := k + 1.
		].
	].
results := Dictionary new.
k := 1.
listOfEquations do: [:each|
	|series|
	series := KESeries from: (data at:k) withIndex: (timeIndex at:k).
	results at: (each variable symbol) put: series.
	k:=k+1].
^results
