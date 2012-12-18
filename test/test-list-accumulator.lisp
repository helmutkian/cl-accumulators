
(defmacro -> (value &body body)
  (reduce (lambda (inner outer)
	    (list* (car outer) inner (cdr outer)))
	  body
	  :initial-value value))
  
(define-test test-list-accumulator
  (assert-equal 
   '(a b c)
   (accumulator-contents
    (-> (make-accumulator 'list)
	(accumulator-into 'a)
	(accumulator-into 'b)
	(accumulator-into 'c))))) 
   
