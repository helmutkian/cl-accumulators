
(defclass reducing-accumulator ()
  ((fn 
    :reader fn 
    :initarg :function)
   (val 
    :accessor val
    :reader accumulator-contents
    :initarg :initial-value)))


(defmethod make-accumulator ((type (eql 'reducing)) &rest initargs)
  (apply #'make-instance 'reducing-accumulator initargs))

(defmethod accumulator-into ((acc reducing-accumulator) &rest args)
  (setf (val acc) (apply (fn acc) (val acc) args)))
    
