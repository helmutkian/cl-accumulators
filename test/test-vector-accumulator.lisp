

(test test-vector-accumulator-without-initargs
  (is 
   (equalp (vector 0 1 2)
	   (with-accumulators ((acm 'vector))
	     (dotimes (i 3)
	       (accumulate acm i))))))
	 
(test test-vector-accumulator-adjustable
  (is-true
   (adjustable-array-p 
    (contents 
     (make-accumulator 'vector))))
  (is-false
   (adjustable-array-p
    (contents
     (make-accumulator 'vector :size 5))))
  (is-false
   (adjustable-array-p
    (contents
     (make-accumulator-vector :adjustable nil))))
  (is-true
   (adjustable-array-p
    (contents
     (make-accumulator 'vector :size 12 :adjustable t)))))
