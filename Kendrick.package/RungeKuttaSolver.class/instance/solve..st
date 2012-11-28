as yet unclassified
solve: model

|  nbEquations dydx k1 k2 k3 k4 y k result x results|

equations := model equations.
nbIterations := ((xn - x0) / step) rounded.
nbEquations := equations size.

dydx := Array new: nbEquations.
k1 := Array new: nbEquations.
k2 := Array new: nbEquations.
k3 := Array new: nbEquations.
k4 := Array new: nbEquations.
y := Array new: nbEquations.
result := Array new: nbEquations.

1 to: equations size do: [:index| result at: index put: (Array new: nbIterations)].

"Initialize value for y"
k := 1.
equations do:[:each|
		y at: k put: (model numberOfIndividualsAtCompartment: (each variable symbol)).
		k := k + 1.
		].

"Runge Kutta Algorithm"
1 to: nbIterations do: [:j|
	x := x0 + (j * step).
	"Update time value for the model"
	model timeValue: x.
	
	"Calculate k1"
	dydx := self calculateDerivation: model.
	1 to: nbEquations do: [:i|
		k1 at: i put: ((dydx at: i) * step).		
		].
	"Update number of individuals for each compartments of model"
	k := 1.
    equations do:[:each|
		model atCompartment: (each variable symbol) modifyNumberOfIndividuals: (((k1 at: k) / 2) + (y at: k)).
		k := k + 1.
		].
	"Calculate k2"
	dydx := self calculateDerivation: model.
	1 to: nbEquations do: [:i|
		k2 at: i put: ((dydx at: i) * step).		
		].
	"Update number of individuals for each compartments of model"
	k := 1.
    equations do:[:each|		
		model atCompartment: (each variable symbol) modifyNumberOfIndividuals: (((k2 at: k) / 2) + (y at: k)).
		k := k + 1.
		].
	"Calculate k3"
	dydx := self calculateDerivation: model.
	1 to: nbEquations do: [:i|
		k3 at: i put: ((dydx at: i) * step).		
		].
	"Update number of individuals for each compartments of model"
	k := 1.
    equations do:[:each|		
		model atCompartment: (each variable symbol) modifyNumberOfIndividuals: ((k3 at: k) + (y at: k)).
		k := k + 1.
		].
	"Caculate k4"
	dydx := self calculateDerivation: model.
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
    equations do:[:each|		
		model atCompartment: (each variable symbol) modifyNumberOfIndividuals: (y at: k).
		"(each variable symbol) = #I ifTrue: [result at: j put: (Array with:x with:(y at: k))]."
		(result at: k) at: j put: (Array with:x with:(y at: k)).
		k := k + 1.
		].
	].


"Return a KEResult for saving the results of all compartments"
results := KETimeSeriesCollection new.
k := 1.
equations do: [:each| results add: (each variable symbol) value: (result at: k).
	k:=k+1].
^results

