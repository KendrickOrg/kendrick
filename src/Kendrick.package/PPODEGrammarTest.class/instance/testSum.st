tests
testSum
	self parse: 'sum(j, beta[i][j]*I[j])' rule: #sum.
	self parse: 'sum(j, beta[i][j]*sum(k, I[k]))' rule: #sum