
(defparameter *types*
  '(number character cons symbol))

(defparameter *size-range* 100)

(defparameter *test-vector* (vector 0 1 2))

(test test-vector-accumulator-without-initargs
  (is 
   (equalp *test-vector*
	   (with-accumulators ((acm :vector))
	     (dotimes (i 3)
	       (accumulate acm i))))))
	 

(test test-vector-accumulator-with-size
  (let ((size (random *size-range*)))
    (is
     (= size 
	(array-total-size
	 (contents (make-accumulator 'vector :size size)))))))

(test test-vector-accumulator-with-adjustable
  (is-true
    (adjustable-array-p 
     (contents (make-accumulator 'vector
				 :adjustable t)))))

(test test-vector-accumulator-with-element-type
  (let ((the-type (random-elt *types*)))
    (equal the-type
	   (array-element-type
	    (contents (make-accumulator 'vector 
					:element-type the-type))))))

(test test-vector-accumulator-with-size-and-adjustable
  (let* ((size (random *size-range*))
	 (the-vector (contents 
		      (make-accumulator 'vector
					:size size
					:adjustable t))))
    (is (= size (array-total-size the-vector)))
    (is-true (adjustable-array-p the-vector))))

(test test-vector-accumulator-with-size-and-element-type
  (let* ((size (random *size-range*))
	 (the-type (random-elt *types*))
	 (the-vector (contents
		      (make-accumulator 'vector
					:size size
					:element-type the-type))))
    (is (= size (array-total-size the-vector)))
    (is (equal the-type (array-element-type the-vector)))))

(test 
    test-vector-accumulator-with-size-and-adjustable-and-element-type
  (let* ((size (random *size-range*))
	 (the-type (random-elt *types*))
	 (the-vector (contents
		      (make-accumulator 'vector
					:size size
					:element-type the-type
					:adjustable t))))
    (is (= size (array-total-size the-vector)))
    (is (equal the-type (array-element-type the-vector)))
    (is-true (adjustable-array-p the-vector))))
   
