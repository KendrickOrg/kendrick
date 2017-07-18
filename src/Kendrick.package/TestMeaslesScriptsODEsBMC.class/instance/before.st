as yet unclassified
before

| model simulator diag |
model := KEModel new population: (KEPopulation size: 100000).
model addAttribute: #status value: #(S E I R).
model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
model atCompartment: { #status->#I } put: 1.
model addEquations: { 
            'S:t=mu*N - beta*S*I - mu*S'.
            'E:t=beta*S*I - sigma*E - mu*E'.
            'I:t=sigma*E - gamma*I - mu*I'.
            'R:t=gamma*I - mu*R'
            }.
model addParameters: {
        #beta->0.0000214. 
        #gamma->0.143. 
        #mu->0.0000351. 
        #sigma->0.125 }.
simulator := KESimulator new: #RungeKutta from: 0.0 to: 150 step: 1.
simulator executeOn: model.
diag := (KEDiagramBuilder new) data: simulator timeSeriesOutputs.
diag xLabel: 'Time (days)'.
diag open.

^ {simulator . model . diag}