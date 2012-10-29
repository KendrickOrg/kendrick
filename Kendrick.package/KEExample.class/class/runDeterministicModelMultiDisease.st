as yet unclassified
runDeterministicModelMultiDisease

"self runDeterministicModelMultiDisease"

|model compartment dsdt didt result|

model := KEModel new.
model atCompartment: #SS putNumberOfIndividuals: 9998.
model atCompartment: #IS putNumberOfIndividuals: 1.
model atCompartment: #SI putNumberOfIndividuals: 1.
model atCompartment: #RS putNumberOfIndividuals: 0.
model atCompartment: #SR putNumberOfIndividuals: 0.
model atCompartment: #II putNumberOfIndividuals: 0.
model atCompartment: #RI putNumberOfIndividuals: 0.
model atCompartment: #IR putNumberOfIndividuals: 0.
model atCompartment: #RR putNumberOfIndividuals: 0.

model atParameter: #beta1 put: 0.008.
model atParameter: #beta2 put: 0.01. 
model atParameter: #N put: 10000.
model atParameter: #sigma1 put: 52.
model atParameter: #sigma2 put: 52.
model atParameter: #mu put: 1/80.

model addEquation: (PPODEParser parse:'SS:t=mu*N-beta1*SS*(IS+II+IR)-beta2*SS*(SI+II+RI)-mu*SS').
model addEquation: (PPODEParser parse:'IS:t=beta1*SS*(IS+II+IR)-(mu+sigma1)*IS').
model addEquation: (PPODEParser parse:'SI:t=beta2*SS*(SI+II+RI)-(mu+sigma2)*SI').
model addEquation: (PPODEParser parse:'RS:t=sigma1*IS-beta2*RS*(SI+II+RI)-mu*RS').
model addEquation: (PPODEParser parse:'SR:t=sigma2*SI-beta1*SR*(IS+II+IR)-mu*SR').
model addEquation: (PPODEParser parse:'II:t=beta1*SI*(IS+II+IR)+beta2*IS*(SI+II+RI)-(sigma1+sigma2+mu)*II').
model addEquation: (PPODEParser parse:'RI:t=sigma1*II-(mu+sigma2)*RI').
model addEquation: (PPODEParser parse:'IR:t=sigma2*II-(mu+sigma1)*IR').
model addEquation: (PPODEParser parse:'RR:t=sigma1*IR+sigma2*RI-mu*RR').

result := model runDeterministSimulationFrom: 0 to: 100  with: 0.01.
result plot: #SR in: model.

