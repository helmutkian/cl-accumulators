(in-package #:com.helmutkian.cl-accumulators.test)
  
(test test-list-accumulator
  (let ((the-list '(a b c)))
    (is (equal the-list
	       (with-accumulator (:list)
		 (dolist (the-elm the-list)
		   (accumulate the-elm)))))))
