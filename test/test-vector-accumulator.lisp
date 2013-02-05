(in-package #:com.helmutkian.cl-accumulators.test)

(test test-vector-accumulator 
  (let ((the-vector 
	 (with-accumulator (:vector)
	   (dotimes (i 3)
	     (accumulate i)))))
    (is 
     (equalp #(0 1 2)
	     the-vector))
    (is-true
     (adjustable-array-p the-vector))))
	 

(test test-vector-accumulator-with-initial-contents
  (let ((init-contents '(1 2 3)))
    (is
     (equalp #(1 2 3)
	     (with-accumulator 
		 (:vector :initial-contents init-contents))))
    (is
     (equalp #(1 2 3 4)
	     (with-accumulator
		 (:vector :initial-contents init-contents)
	       (accumulate 4))))))
