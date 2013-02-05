(in-package #:com.helmutkian.cl-accumulators.test)
  
(test test-list-accumulator
  (let ((the-list '(a b c)))
    (is (equal the-list
	       (with-accumulator (:list)
		 (dolist (the-elm the-list)
		   (accumulate the-elm)))))))

(test test-list-accumulator-with-initial-contents
  (let ((init-contents '(a b c)))
    (is 
     (equal init-contents
	    (with-accumulator 
		(:list :initial-contents init-contents))))
    (is 
     (equal (append init-contents '(d))
	    (with-accumulator 
		(:list :initial-contents init-contents)
	      (accumulate 'd))))))
