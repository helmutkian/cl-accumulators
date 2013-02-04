
(defmacro with-accumulator (type-initargs &body body)
  (let ((acm (gensym)))
    `(with-accumulators ((,acm ,@type-initargs))
       (flet ((accumulate (&rest args)
		(apply #'accumulate ,acm args)))
	 ,@body))))
