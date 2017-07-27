public-api
allTransitionRefsForAttribute: arg1
	^ (attributes at: arg1)
		collect: [ :arg2 | '{#' , arg1 asString , ': #' , arg2 , '}' ]