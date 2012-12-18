
(defclass reducing-accumulator ()
  ((fn 
    :reader fn 
    :initarg :function)
   (val 
    :accessor val
    :reader accumulator-contents
    :initarg :initial-value)))


(defmethod make-accumulator 
  ((type (eql 'reducing)) &key function initial-value)
  (make-instance 'reducing-accumulator 
		 :function function
		 :initial-value initial-value))

(defmethod accumulator-into ((acc reducing-accumulator) &rest args)
  (setf (val acc) (apply (fn acc) (val acc) args)))
    
