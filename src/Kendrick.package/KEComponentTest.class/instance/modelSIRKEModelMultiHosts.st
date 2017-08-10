as yet unclassified 
modelSIRKEModelMultiHosts
|model|
model := KEModel new.
model population: (KEPopulation size: 13000).

model addAttribute: #status value: #(#S #I #R).
model addAttribute: #species value: #(#mosquito #reservoir1 #reservoir2).
^model