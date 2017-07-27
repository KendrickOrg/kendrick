tests
testSquareBrackets
	self
		parse: 'S[i]' rule: #squarebrackets;
		parse: 'S[i][j]' rule: #squarebrackets;
		parse: 'S[i][j][ k]' rule: #squarebrackets;
		parse: 'S[i][j][ k][ l]' rule: #squarebrackets;
		parse: 'S[1]' rule: #squarebrackets;
		parse: 'S[1][ 3]' rule: #squarebrackets;
		parse: 'S[1][ i]' rule: #squarebrackets;
		parse: 'S[i-1][ j+1]' rule: #squarebrackets