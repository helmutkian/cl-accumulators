

(defmethod make-accumulator ((type (eql 'product)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reducing :function #'* :initial-value 1))

(defmethod make-accumulator ((type (eql 'sum)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reducing :function #'+ :initial-value 0))

(defmethod make-accumulator 
  ((type (eql 'maximizing)) &rest initargs)
  (declare (ignore initargs))
  (flet ((maxing (x y)
	   (if (or (null x) (< x y)) 
	     y
	     x)))
	(make-accumulator 'reducing
			  :function #'maxing
			  :intial-value nil)))

(defmethod make-accumulator
  ((type (eql 'miniziming)) &rest initargs)
  (declare (ignore initargs))
  (flet ((mining (x y)
	   (if (or (null x) (> x y))
	     y
	     x)))
	(make-accumulator 'reducing
			  :function #'mining
			  :initial-value nil)))

(defmethod make-accumulator
  ((type (eql 'counting)) &rest initargs)
  (declare (ignore initargs))
  (make-accumulator 'reducing :function #'1+ :initial-value 0))
	   
