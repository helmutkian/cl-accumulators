
(defmacro -> (value &body body)
  (reduce (lambda (inner outer)
	    (list* (car outer) inner (cdr outer)))
	  body
	  :initial-value value))
  
(5am:test test-list-accumulator
  (5am:is 
   (equalp '(a b c)
	  (accumulator-contents
	   (-> (make-accumulator 'list)
	       (accumulator-into 'a)
	       (accumulator-into 'b)
	       (accumulator-into 'c)))))) 
   
