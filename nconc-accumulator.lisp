
(defclass nconc-accumulator (list-accumulator) ())

(defmethod make-accumulator ((type (eql 'nconc)) &rest initargs)
  (declare (ignore initargs))
  (make-instance 'nconc-accumulator))

(defmethod accumulator-into ((acc nconc-accumulator) &rest args)
  (with-accessors ((contents contents) (last-ptr last-pointer)) acc
    (let ((new-content (car args)))
      (cond
       ((null contents)
	(setf contents new-content
	      last-ptr new-content))
       (t
        
	(nconc last-ptr new-content)
	(setf last-ptr (last new-content)))))))
       
