
(5am:test test-product-accumulator
    (5am:is
     (= 6
	(accumulator-contents
	 (-> (make-accumulator 'product)
	   (accumulator-into 1)
	   (accumulator-into 2)
	   (accumulator-into 3))))))
