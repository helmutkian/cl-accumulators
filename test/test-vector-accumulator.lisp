
(defun assert-vector-contents-equal (expected-vector form-vector)
  (map nil
       (lambda (expected form)
	 (assert-equal expected form))
       expected-vector
       form-vector))

(define-test test-vector-accumulator
  (assert-vector-contents-equal
   (vector 1 2 3)
   (accumulator-contents
    (-> (make-accumulator 'vector)
      (accumulator-into 1)
      (accumulator-into 2)
      (accumulator-into 3)))))
  
