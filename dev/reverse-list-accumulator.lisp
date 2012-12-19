
(defmethod make-accumulator ((type (eql 'reverse-list)) &key)
  (make-accumulator 'reducing
		    :function #'cons
		    :initform nil))
