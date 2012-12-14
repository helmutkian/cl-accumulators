
(defmethod make-accumulator 
  ((type (eql 'reverse-list)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reducing
		    :function #'cons
		    :initform nil))
