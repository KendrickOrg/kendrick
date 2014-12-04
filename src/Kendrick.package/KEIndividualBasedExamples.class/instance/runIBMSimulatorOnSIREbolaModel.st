examples
runIBMSimulatorOnSIREbolaModel
	"self new runIBMSimulatorOnSIREbolaModel"
	|model simulator diagram |
	model := self createSIREbolaModelWith6Cities .	
	simulator := KESimulatorBuilder new.
	simulator addAdapter: KEImmigrationAdapter new.
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 100 step: 0.1 model: model.
	simulator plot: #I.
	diagram := KEDiagramBuilder new.
	diagram plotMap: #(#Liberia #Guinea #SierraLeone # Nigeria #Senegal #Niger)
			  in: #africa
			  data: (model population subPopulations collect: [ :each|
			  	   "(each at: #I) currentNbIndividuals"
					each nbOfIndividualsOf: #I
			  ])
	