

  
(test test-list-accumulator
  (let ((the-list '(a b c)))
    (is (equal the-list
	       (with-accumulators ((acm 'list))
		 (dolist (the-elm the-list)
		   (accumulate acm the-elm)))))))
