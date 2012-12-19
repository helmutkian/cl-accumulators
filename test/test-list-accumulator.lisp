
(defmacro -> (value &body body)
  (reduce (lambda (inner outer)
	    (list* (car outer) inner (cdr outer)))
	  body
	  :initial-value value))
  
(5am:test test-list-accumulator
  (5am:is 
   (equalp '(a b c)
	  (contents
	   (accumulate* (make-accumulator 'list)
			'(a b c))))))
   
