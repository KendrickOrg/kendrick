as yet unclassified
rk4Solve

| nbEquations x k results |

nbIterations := ((xn - x0) / step) rounded.
nbEquations := equations size.

self initializeArraysWithSize: nbEquations.

"Initialize value for y"
k := 1.
equations do:[:each|
		y at: k put: (model numberOfIndividualsAtCompartment: (each variable symbol)).
		k := k + 1.
		].

"Iterations over allowed steps"
1 to: nbIterations do: [:j|
	
	x := j * step + x0.
	
	"Update time value for the model"
	model timeValue: x.
	
	"Calculate k1"
	dydx := self calculateDerivatives.
	
	1 to: nbEquations do: [:i |
		k1 at: i put: step * (dydx at: i).		
		].
	
	"Update number of individuals for each compartments of model"
	k := 1.
    equations do:[:each|
		model atCompartment: (each variable symbol) modifyNumberOfIndividuals: (((k1 at: k) / 2) + (y at: k)).
		k := k + 1.
		].
	
	"Calculate k2"
	dydx := self calculateDerivatives.

	1 to: nbEquations do: [:i|
		k2 at: i put: step * (dydx at: i).		
		].
	
	"Update number of individuals for each compartments of model"
	k := 1.
    equations do:[:each|		
		model atCompartment: (each variable symbol) modifyNumberOfIndividuals: (((k2 at: k) / 2) + (y at: k)).
		k := k + 1.
		].
	"Calculate k3"
	dydx := self calculateDerivatives.
	1 to: nbEquations do: [:i|
		k3 at: i put: step * (dydx at: i).		
		].
	
	"Update number of individuals for each compartments of model"
	k := 1.
    equations do:[:each|		
		model atCompartment: (each variable symbol) modifyNumberOfIndividuals: ((k3 at: k) + (y at: k)).
		k := k + 1.
		].
	"Caculate k4"
	dydx := self calculateDerivatives.
	1 to: nbEquations do: [:i|
		k4 at: i put: step* (dydx at: i).		
		].
	
	"Calculate y"
	1 to: nbEquations do: [:i|
		y at: i incrementBy: ((k1 at: i)/6) + ((k2 at: i)/3) + ((k3 at: i)/3) + ((k4 at: i)/6).	
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

