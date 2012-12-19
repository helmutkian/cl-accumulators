

(5am:test test-vector-accumulator-without-initargs
  (5am:is 
   (equalp (vector 1 2 3)
	   (contents
	    (accumulate* (make-accumulator 'vector)
			 '(1 2 3))))))
  
(5am:test test-vector-accumulator-adjustable
  (5am:is-true
   (adjustable-array-p 
    (contents 
     (make-accumulator 'vector))))
  (5am:is-false
   (adjustable-array-p
    (contents
     (make-accumulator 'vector :size 5))))
  (5am:is-false
   (adjustable-array-p
    (contents
     (make-accumulator-vector :adjustable nil))))
  (5am:is-true
   (adjustable-array-p
    (contents
     (make-accumulator 'vector :size 12 :adjustable t)))))
