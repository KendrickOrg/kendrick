examples
exampleRK4SolverOnSIRMetaPopulationModel
	"self new exampleRK4SolverOnSIRMetaPopulationModel"
	|model simulator db output graph| 
	model := KEModel new.
	model population: KEMetaPopulation new.
	model population attributes: '{#status:[#S,#I,#R],#region:[#A,#B,#C]}'.
	graph := KEGraph on: model population atAttribute: #region couplingInfectionCoefficient: #beta 
				withOutsideClass: {#(A B)->0.02. #(A C)->0.02} insideClass: {#all->0.0}.
	graph applyGraph: model.
	model addParameters: '{
			{#region:#A}:{#mu:12.7,#N:10000},
			{#region:#B}:{#mu:0.05,#N:1000},
			{#region:#C}:{#mu:0.05,#N:2000},#v: 52}'.

	model buildFromCompartments: {#region->#(A B C). #status->#(S I R)}
		   cardinalities: #(9999 1 0 999 1 0 1999 1 0).
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: ('I:t=beta*S*I-(mu+v)*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	db open