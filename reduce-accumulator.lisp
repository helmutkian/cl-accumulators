
(defclass reduce-accumulator ()
  ((fn 
    :reader fn 
    :initarg :function)
   (val 
    :accessor val
    :reader contents
    :initarg :initial-value)))


(defmethod make-accumulator ((type (eql 'reduce)) &rest initargs)
  (apply #'make-instance 'reduce-accumulator initargs))

(defmethod accumulate ((acc reduce-accumulator) &rest args)
  (setf (val acc) 
	(if (slot-boundp acc 'val)
	    (apply (fn acc) (val acc) args)
	    (apply (fn acc) args))))
    
