as yet unclassified 
modelSIRMultiHost
|model|
model := KEModel new.
model population: (KEPopulation size: 13000).

model addAttribute: #status value: #(#S #I #R).
model addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).

model atParameter: #mu assignValue: { 12.17. 0.05. 0.05 }.
model atParameter: #N assignValue: #(10000 1000 2000).
model atParameter: #gamma assignValue: 52.
model atParameter: #beta assignValue: #(#(0 0.02 0.02) #(0.02 0 0) #(0.02 0 0)).
model atParameter: #i assignValue: (1 to: 3).
model atParameter: #j assignValue: (1 to: 3).

model addEquation: 'S[i]:t=mu[i]*N[i]-sum(j, beta[i][j]*I[j])*S[i]-mu[i]*S[i]'.
model addEquation: 'I[i]:t=sum(j, beta[i][j]*I[j])*S[i]-(mu[i]+gamma)*I[i]'.
model addEquation: 'R[i]:t=gamma*I[i] - mu[i]*R[i]'.
"model addEquation: 'S[i]:t=sum(j, beta[i,j])'."

model atCompartment: { #status->#S. #species->#mosquito } put: 9999.
model atCompartment: { #status->#I. #species->#mosquito } put: 1.
model atCompartment: { #status->#R. #species->#mosquito } put: 0.
model atCompartment: { #status->#S. #species->#reservoir1 } put: 1000.
model atCompartment: { #status->#I. #species->#reservoir1 } put: 0.
model atCompartment: { #status->#R. #species->#reservoir1 } put: 0.
model atCompartment: { #status->#S. #species->#reservoir2 } put: 2000.
model atCompartment: { #status->#I. #species->#reservoir2 } put: 0.
model atCompartment: { #status->#R. #species->#reservoir2 } put: 0.
^model.