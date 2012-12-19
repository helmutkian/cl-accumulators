
(5am:test test-reducing-accumulator
  (flet ((max-length (seq1 seq2)
	   (if (>= (length seq1) (length seq2))
	       seq1
	       seq2)))
    (5am:is
     (equalp 
      "the longest"
      (accumulator-contents
       (accumulate* 
	(make-accumulator 'reducing
			  :function #'max-length
			  :initial-value "")
	'("this" "string" "is" "the longest" "right?")))))))
  
  
