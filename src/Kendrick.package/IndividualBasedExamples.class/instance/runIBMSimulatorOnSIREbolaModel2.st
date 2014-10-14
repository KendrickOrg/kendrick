tests
runIBMSimulatorOnSIREbolaModel2
	"self new runIBMSimulatorOnSIREbolaModel2"
	|model simulator diagram |
	model := self createSEIREbolaModel.	
	simulator := KESimulatorBuilder new.
	simulator addAdapter: KEMovementAdapter new.
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 100 step: 1 model: model.
	simulator plot: #I.
	diagram := KEDiagramBuilder new.
	diagram plotMap: #(#Liberia #Guinea #SierraLeone # Nigeria #Senegal #Niger)
			  in: #africa
			  data: (model population subPopulations collect: [ :each|
			  	   "(each at: #I) currentNbIndividuals"
					each nbOfIndividualsOf: #I
			  ])
	