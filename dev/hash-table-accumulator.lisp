
(defclass hash-table-accumulator (accumulator) ())

(defmethod into ((acc hash-table-accumulator) &rest args)
  (let ((key (first args))
	(val (second args)))
    (setf (gethash acc key) val)))
  
