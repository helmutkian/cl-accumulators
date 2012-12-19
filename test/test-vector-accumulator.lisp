

(5am:test test-vector-accumulator
  (5am:is 
   (equalp (vector 1 2 3)
	   (accumulator-contents
	    (-> (make-accumulator 'vector)
	      (accumulator-into 1)
	      (accumulator-into 2)
	      (accumulator-into 3))))))
  
