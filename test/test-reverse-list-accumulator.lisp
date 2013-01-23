

(test test-reverse-list-accumulator
  (let ((the-list '(1 2 3 4 5)))
    (is
     (equal (reverse the-list)
	    (with-accumulators ((acm 'reverse-list))
	      (dolist ((elem the-list))
		(accumulate acm elem)))))))
