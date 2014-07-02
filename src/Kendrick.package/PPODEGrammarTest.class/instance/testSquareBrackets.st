tests
testSquareBrackets
	self parse: 'S[i]' rule: #squarebrackets.
	self parse: 'S[i][j]' rule: #squarebrackets.
	self parse: 'S[i][j][ k]' rule: #squarebrackets.
	self parse: 'S[i][j][ k][ l]' rule: #squarebrackets.
	self parse: 'S[1]' rule: #squarebrackets.
	self parse: 'S[1][ 3]' rule: #squarebrackets.
	self parse: 'S[1][ i]' rule: #squarebrackets.
	self parse: 'S[i-1][ j+1]' rule: #squarebrackets