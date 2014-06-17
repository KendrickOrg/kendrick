tests
testIBMSimulatorOnSIRModelWithInfectionRateIsFunctionOfDistances
	|model|
	model := KEModel new.
	model population compartments: #((S 996) (I 4) (R 0)) defNetwork: 'random' contact: 4 surface: 10.
	model addParameter: #beta value: 0.01.
	model addParameter: #gamma value: 0.5.
	model addParameter: #anpha value: 3.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I - gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	  
	model run: 'IBM' from: 0.0 to: 100 step: 0.1 algorithm: #DiscreteTime.
	model plot: #S do: #sqrt.
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	