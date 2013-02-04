

(defparameter *size-range* 100)

(defparameter *test-vector* (vector 0 1 2))

(test test-vector-accumulator-without-initargs 
  (let ((the-vector 
	 (with-accumulator (:vector)
	   (dotimes (i 3)
	     (accumulate i)))))
    (is 
     (equalp *test-vector*
	     the-vector))
    (is-true
     (adjustable-array-p the-vector))))
	 

(test test-vector-accumulator-with-size
  (let* ((size (random *size-range*))
	 (the-vector 
	  (with-accumulator (:vector :size size))))
    (is
     (= size 
	(array-total-size the-vector)))
    (is-true
     (adjustable-array-p the-vector))))

