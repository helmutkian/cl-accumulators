
(defun max-length (seq1 seq2)
  (if (>= (length seq1) (length seq2))
      seq1
      seq2))

(5am:test test-reducing-accumulator
  (5am:is
   (equalp "the longest"
      (accumulator-contents
       (-> (make-accumulator 'reducing
			     :function #'max-length
			     :initial-value "")
	 (accumulator-into "this")
	 (accumulator-into "string")
	 (accumulator-into "is")
	 (accumulator-into "the longest")
	 (accumulator-into "right?"))))))
  
