accessing
addParametersForTestParserIndexODE: aModel
	aModel atParameter: #N assignValue: #( #(500 5000)
													  #(500 5000)
		  											  #(500 5000)
													  #(500 5000)
													  #(500 5000)
													).
	aModel atParameter: #mu assignValue: #(
        												#(0.000365 0.00137)
        												#(0.000365 0.00137)
        												#(0.000365 0.00137)
        												#(0.000365 0.00137)
        												#(0.000365 0.00137)
    												).
	aModel atParameter: #sigma assignValue: #( #(0.5 0.67)
													  #(0.5 0.67)
		  											  #(0.5 0.67)
													  #(0.5 0.67)
													  #(0.5 0.67)
													).
	aModel atParameter: #gamma assignValue: #(
        												#(0.25 0.233)
        												#(0.25 0.233)
        												#(0.25 0.233)
        												#(0.25 0.233)
        												#(0.25 0.233)
    												).
	^aModel
