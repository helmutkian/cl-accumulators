
(in-package :com.helmutkian.cl-accumulators)

(defmacro with-accumulators (accumulator-forms &body body)
  `(let ,(mapcar (lambda (acc-form)
		   `(,(car acc-form) 
		      (make-accumulator ,@(cdr acc-form))))
		 accumulator-forms)
     ,@body
     (values ,@(mapcar (lambda (acc-form)
			 `(contents ,(car acc-form)))
			 accumulator-forms))))
