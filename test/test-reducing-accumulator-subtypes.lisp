
(defun generate-nums ()
  (loop repeat (+ (random 15) 3)
        collect (random 100)))

(5am:test test-product-accumulator
  (let ((nums (generate-nums)))
    (5am:is
     (= (reduce #'* nums)
	(contents
	 (accumulate* (make-accumulator 'product)
		      nums))))))

(5am:test test-sum-accumulator
  (let ((nums (generate-nums)))
    (5am:is
     (= (reduce #'+ nums)
	(contents
	 (accumulate* (make-accumulator 'sum)
		      nums))))))

(5am:test test-max-accumulator
  (let ((nums (generate-nums)))
    (5am:is
     (= (reduce #'max nums)
	(contents
	 (accumulate* (make-accumulator 'max)
		      nums))))))

(5am:test test-min-accumulator
  (let ((nums (generate-nums)))
    (5am:is
     (= (reduce #'min nums)
	(contents
	 (accumulate* (make-accumulator 'min)
		   nums))))))

(5am:test test-count-accumulator
  (let ((nums (generate-nums)))
    (5am:is
     (= (length nums)
	(contents
	 (accumulate* (make-accumulator 'count)
		      nums))))))
