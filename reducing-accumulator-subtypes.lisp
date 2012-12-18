

(defmethod make-accumulator ((type (eql 'product)) &key)
  (make-accumulator 'reducing :function #'* :initial-value 1))

(defmethod make-accumulator ((type (eql 'sum)) &key)
  (make-accumulator 'reducing :function #'+ :initial-value 0))

(defmethod make-accumulator ((type (eql 'maximizing)) &key)
  (flet ((maxing (x y)
	   (if (or (null x) (< x y)) 
	     y
	     x)))
	(make-accumulator 'reducing
			  :function #'maxing
			  :intial-value nil)))

(defmethod make-accumulator ((type (eql 'miniziming)) &key)
  (flet ((mining (x y)
	   (if (or (null x) (> x y))
	     y
	     x)))
	(make-accumulator 'reducing
			  :function #'mining
			  :initial-value nil)))

(defmethod make-accumulator ((type (eql 'counting)) &key)
  (make-accumulator 'reducing :function #'1+ :initial-value 0))
	   
