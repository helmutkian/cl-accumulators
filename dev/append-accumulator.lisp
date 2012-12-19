
(defclass nconc-accumulator (list-accumulator) ())

(defmethod make-accumulator ((type (eql 'nconc)) &key)
  (make-instance 'nconc-accumulator))

(defmethod accumulator-into ((acc nconc-accumulator) &rest args)
  (with-accessors ((contents contents) (last-ptr last-pointer)) acc
    (let ((new-content (car args)))
      (cond
       ((null contents)
	(setf contents new-content
	      last-ptr new-content))
       (t
	(setf (cdr last-ptr) new-content)
	(setf last-pointer new-content))))))
