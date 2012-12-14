
(defclass list-accumulator ()
  ((contents 
    :accessor contents 
    :reader accumulator-contents
    :initform nil)
   (last-pointer :accessor last-pointer)))

(defmethod make-accumulator ((type (eql 'cons)) &rest initargs)
  (declare (ignore initargs))
  (make-instance 'list-accumulator))

(defmethod make-accumulator ((type (eql 'list)) &rest initargs)
  (declare (ignore initargs))
  (make-instance 'list-accumulator))

(defmethod accumulator-into ((acc list-accumulator) &rest args)
  (with-accessors ((contents contents)
		   (last-ptr last-pointer))
		  acc
    (let ((new-content (list (car args))))
      (cond 
       ((null contents)
        (setf contents new-content
	      last-ptr new-content))
       (t
	(setf (cdr last-ptr) new-content)
	(setf last-ptr new-content))))))
	      
      
    
