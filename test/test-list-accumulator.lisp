

  
(5am:test test-list-accumulator
  (5am:is 
   (equalp '(a b c)
	  (contents
	   (accumulate* (make-accumulator 'list)
			'(a b c))))))
   
