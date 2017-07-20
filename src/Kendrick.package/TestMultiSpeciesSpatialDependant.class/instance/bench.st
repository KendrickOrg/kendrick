as yet unclassified
bench

	| before after |
	
	before := self benchmark: [self beforeBench] times: 100.
	after := self benchmark: [self afterBench] times: 100.
	
	Transcript 
		show: before; cr; 
		show: after; cr; 
		show: (after at: 1) / (before at: 1); cr; cr.