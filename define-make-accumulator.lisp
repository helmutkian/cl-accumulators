

(defmacro define-make-accumulator 
    (acc-type (&optional initargs-name) &body body)
  (let ((initargs (or initargs-name (gensym))))
    (multiple-value-bind (fn-body decls docstr)
	(tcr.parse-declarations-1.0::parse-body body)
      `(defmethod make-accumulator 
	   ((,(gensym) (eql ,acc-type)) &rest ,initargs)
	 ,@decls
	 ,(unless initargs-name `(declare (ignore ,initargs)))
	 ,@docstr
	 ,@fn-body))))
       
