

(5am:test test-reverse-list-accumulator
  (let ((the-list '(1 2 3 4 5)))
    (5am:is
     (equal (reverse the-list)
	    (contents
	     (accumulate* (make-accumulator 'reverse-list)
			  the-list))))))
