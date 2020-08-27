Class {
	#name : #KEIncidenceTest,
	#superclass : #TestCase,
	#category : #'Kendrick-Tests-Core'
}

{ #category : #tests }
KEIncidenceTest >> testIncidence [
	"plot the incidence"
			
   | model seirConcern simulator dB data|

	model := KEModel new.
	seirConcern := KEModelPart new.
	seirConcern attributes: {#status->#(#S #E #I #R)}.
	seirConcern addParameters: { #beta. #gamma. #mu. #sigma }.
	seirConcern
		addTransitionFrom: {(#status -> #S)}
		to: {(#status -> #E)}
		probability: [ :aModel | 
			(aModel atParameter: #beta) * 
			(aModel atCompartment: {#status -> #I}) / (aModel atParameter: #N) ].
	seirConcern 
		addTransitionFrom:  {(#status -> #E)}
		to: {(#status -> #I)} 
		probability: 'sigma'.
	seirConcern
		addTransitionFrom: {(#status -> #I)} 
		to: {(#status -> #R)} 
		probability: 'gamma'.
	seirConcern
		addTransitionFrom: {(#status -> #S)} 
		to: #empty 
		probability: 'mu'.
	seirConcern
		addTransitionFrom: {(#status -> #I)} 
		to: #empty 
		probability: 'mu'.
	seirConcern 
		addTransitionFrom: {(#status -> #R)}
		to: #empty 
		probability: 'mu'.
	seirConcern
		addTransitionFrom: {(#status -> #E)}
		to: #empty 
		probability: 'mu'.
	seirConcern 
		addTransitionFrom: #empty 
		to: {(#status -> #S)} 
		probability: 'mu'.
			
	model integrate: seirConcern.
	model
		addParameters:
			{
			 (#beta -> 2.14).
			 (#gamma -> 0.143).
			 (#sigma -> 0.125).
			 (#mu -> 0.0000351)}.
	
	model atCompartment: { #status->#S } put: 4999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model atCompartment: { #status->#R } put: 0.
	model atCompartment: { #status->#E } put: 0.
	
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 200 step: 0.5.
	simulator executeOn: model.
	data := OrderedCollection new.
	data add: (simulator timeSeriesOutputsAt: {(#status -> #I)})/4.
	self assert: (data evaluateWithModel: model) equals: 1.
	"dB := KEDiagramBuilder new data: data.
	dB yLabel:'New infections per day'."

]
