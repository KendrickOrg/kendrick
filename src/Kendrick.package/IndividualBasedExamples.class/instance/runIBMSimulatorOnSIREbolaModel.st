tests
runIBMSimulatorOnSIREbolaModel
	"self new runIBMSimulatorOnSIREbolaModel"
	|model simulator diagram |
	model := self createSIREbolaModelWith10Cities .	
	simulator := KESimulatorBuilder new.
	simulator addAdapter: (KEMovementAdapter new).
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 100 step: 0.1 model: model.
	simulator plot: #I.
	diagram := KEDiagramBuilder new.
	diagram plotMap: #(#Liberia #Guinea #SierraLeone # Nigeria #Senegal #Niger)
			  in: #africa
			  data: (model population getPopulationIDs collect: [ :each|
			  	   ((model population at: each) at: #I) currentNbIndividuals
			  ])
	