tests
testRK4SolverOnSIRMetaPopulationModel
	|model|
	model := KEModel2 new.
	model population nodes: 3 edges: #((1 2) (1 3)) weight: #beta values: 0.02.
	(model population nodes at: 1) compartments: #((S 9999) (I 1) (R 0)).
	(model population nodes at: 2) compartments: #((S 1000) (I 0) (R 0)).
	(model population nodes at: 3) compartments: #((S 2000) (I 0) (R 0)).
	model population with: #mu value: { 365/30 . 1/20 . 1/20 }.
	model population with: #N value: { 10000 . 1000 . 2000 }.
	model addParameter: #beta value: 0.0.
	model addParameter: #v value: 52.
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-v*I-mu*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).  	
	model run: 'deterministic' from: 0.0 to: 40.0 step: 0.01 algorithm: #RK4.
	"model plot: #I do: #sqrt."
	self assert: (model simulator data size) equals: 3.
	self assert: ((model simulator data at: #(0 1)) at: #S) data size equals: 4000